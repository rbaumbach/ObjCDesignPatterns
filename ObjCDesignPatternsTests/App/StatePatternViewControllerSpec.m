#import "Kiwi.h"
#import "Swizzlean.h"
#import "StatePatternViewController.h"
#import "DonkeyKongArcade.h"


@interface StatePatternViewController ()

@property (strong, nonatomic) DonkeyKongArcade *donkeyKongArcade;

- (void)setupTextView;

@end


SPEC_BEGIN(StatePatternViewControllerSpec)

describe(@"StatePatternViewController", ^{
    __block StatePatternViewController *controller;
    __block DonkeyKongArcade *fakeDonkeyKongArcade;
    
    beforeEach(^{
        fakeDonkeyKongArcade = [DonkeyKongArcade mock];
        controller = [[StatePatternViewController alloc] init];
//        controller.donkeyKongArcade = fakeDonkeyKongArcade;
        
        [controller view];
    });
    
    it(@"should not be nil", ^{
        [controller shouldNotBeNil];
    });
    
    it(@"is a subclass of UIViewController", ^{
        [[controller should] beKindOfClass:[UIViewController class]];
    });
    
    it(@"has correct title", ^{
        [[controller.title should] equal:@"State Pattern"];
    });
    
    it(@"has a DonkeyKongArcade", ^{
        [controller.donkeyKongArcade shouldNotBeNil];
    });
    
    context(@"textView", ^{
        it(@"has a textView", ^{
            [controller.textView shouldNotBeNil];
        });
        
        it(@"cannot be edited", ^{
            [[theValue(controller.textView.editable) should] beNo];
        });
    });
    
    context(@"#viewDidLoad", ^{
        __block Swizzlean *superViewDidLoadSwizz;
        __block BOOL superViewDidLoadCalled;
        
        beforeEach(^{
            superViewDidLoadCalled = NO;
            superViewDidLoadSwizz = [[Swizzlean alloc] initWithClassToSwizzle:[UIViewController class]];
            [superViewDidLoadSwizz swizzleInstanceMethod:@selector(viewDidLoad)
                           withReplacementImplementation:^(id _self) {
                               superViewDidLoadCalled = YES;
            }];
        });
        
        afterEach(^{
            [superViewDidLoadSwizz resetSwizzledInstanceMethod];
        });
        
        it(@"calls super, thanks for asking", ^{
            [controller viewDidLoad];
            [[theValue(superViewDidLoadCalled) should] beYes];
        });
        
        it(@"calls setupTextView", ^{
            [[controller should] receive:@selector(setupTextView)];
            [controller viewDidLoad];
        });
    });
    
    context(@"#setupTextView", ^{
        __block NSString *expectedText;
        
        beforeEach(^{
            expectedText = @"Inserting coin into Donkey Kong Arcade...\ninsertCoin\nPressing start...\npressStart\nPlaying game...\nplayGame\nAttempting to play game again...\nplayGame\n";
            
            [[controller.donkeyKongArcade should] receive:@selector(insertCoin)
                                                andReturn:@"insertCoin\n"];
            [[controller.donkeyKongArcade should] receive:@selector(pressStart)
                                                andReturn:@"pressStart\n"];
            [[controller.donkeyKongArcade should] receive:@selector(playGame)
                                                andReturn:@"playGame\n"
                                                withCount:2];
            
            [controller setupTextView];
        });
        
        it(@"sets up the textView", ^{
            [[controller.textView.text should] equal:expectedText];
        });
    });
});

SPEC_END