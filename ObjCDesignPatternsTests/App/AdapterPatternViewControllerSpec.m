#import "Kiwi.h"
#import "Swizzlean.h"
#import "AdapterPatternViewController.h"
#import "RatAdapter.h"


@interface AdapterPatternViewController ()

@property (strong, nonatomic) id<Duck> duck;
@property (strong, nonatomic) id<Rat> rat;

- (void)setupTextView;
- (NSString *)duckText;
- (NSString *)ratText;
- (NSString *)ratAdapterText;

@end


SPEC_BEGIN(AdapterPatternViewControllerSpec)

describe(@"AdapterPatternViewController", ^{
    __block AdapterPatternViewController *controller;
    
    beforeEach(^{
        controller = [[AdapterPatternViewController alloc] init];
        
        [controller view];
    });
    
    it(@"should not be nil", ^{
        [controller shouldNotBeNil];
    });
    
    it(@"is a subclass of UIViewController", ^{
        [[controller should] beKindOfClass:[UIViewController class]];
    });
    
    it(@"has correct title", ^{
        [[controller.title should] equal:@"Adapter Pattern"];
    });
    
    it(@"has a duck", ^{
        [(NSObject *)controller.duck shouldNotBeNil];
    });
    
    it(@"has a rat", ^{
        [(NSObject *)controller.rat shouldNotBeNil];
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
            expectedText = @"duckText\nratText\nratAdapterText\n";
            
            [[controller should] receive:@selector(duckText)
                               andReturn:@"duckText\n"];
            [[controller should] receive:@selector(ratText)
                               andReturn:@"ratText\n"];
            [[controller should] receive:@selector(ratAdapterText)
                               andReturn:@"ratAdapterText\n"];
            
            [controller setupTextView];
        });
        
        it(@"sets up the textView", ^{
            [[controller.textView.text should] equal:expectedText];
        });
    });
    
    context(@"#duckText", ^{
        __block NSString *expectedText;
        __block NSString *retText;
        
        beforeEach(^{
            expectedText = @"What we have here is a duck\nQuack: quack\nWalk: walk\nSwim: swim\nFly: fly\n\n";
            
            [[(NSObject *)controller.duck should] receive:@selector(quack)
                               andReturn:@"quack\n"];
            [[(NSObject *)controller.duck should] receive:@selector(walk)
                               andReturn:@"walk\n"];
            [[(NSObject *)controller.duck should] receive:@selector(swim)
                               andReturn:@"swim\n"];
            [[(NSObject *)controller.duck should] receive:@selector(fly)
                                                andReturn:@"fly\n"];
            
            retText = [controller duckText];
        });
        
        it(@"returns rat text", ^{
            [[retText should] equal:expectedText];
        });
    });
    
    context(@"#ratText", ^{
        __block NSString *expectedText;
        __block NSString *retText;
        
        beforeEach(^{
            expectedText = @"What we have here is a rat\nSqueak: squeak\nRun Around: runAround\nSwim: swim\nFly with Super Flight Suit: flyWithSuperFlightSuit\n\n";
            
            [[(NSObject *)controller.rat should] receive:@selector(squeak)
                                                andReturn:@"squeak\n"];
            [[(NSObject *)controller.rat should] receive:@selector(runAround)
                                                andReturn:@"runAround\n"];
            [[(NSObject *)controller.rat should] receive:@selector(swim)
                                                andReturn:@"swim\n"];
            [[(NSObject *)controller.rat should] receive:@selector(flyWithSuperFlightSuit)
                                                andReturn:@"flyWithSuperFlightSuit\n"];
            
            retText = [controller ratText];
        });
        
        it(@"returns rat text", ^{
            [[retText should] equal:expectedText];
        });
    });
    
    context(@"#ratAdapterText", ^{
        __block NSString *expectedText;
        __block NSString *retText;
        __block RatAdapter *fakeRatAdapter;
        
        __block Swizzlean *ratAdapterSwizz;
        __block id<Rat> retRat;
        
        beforeEach(^{
            fakeRatAdapter = [RatAdapter mock];
            ratAdapterSwizz = [[Swizzlean alloc] initWithClassToSwizzle:[RatAdapter class]];
            [ratAdapterSwizz swizzleInstanceMethod:@selector(initWithRat:)
                     withReplacementImplementation:^(id _self, id<Rat> ratParam) {
                         retRat = ratParam;
                         return fakeRatAdapter;
            }];
            
            expectedText = @"Using RatAdapter to use a rat as a duck\nQuack: squeak\nWalk: runAround\nSwim: swim\nFly: flyWithSuperFlightSuit\n";
            
            [[(NSObject *)fakeRatAdapter should] receive:@selector(quack)
                                               andReturn:@"squeak\n"];
            [[(NSObject *)fakeRatAdapter should] receive:@selector(walk)
                                               andReturn:@"runAround\n"];
            [[(NSObject *)fakeRatAdapter should] receive:@selector(swim)
                                               andReturn:@"swim\n"];
            [[(NSObject *)fakeRatAdapter should] receive:@selector(fly)
                                               andReturn:@"flyWithSuperFlightSuit\n"];
            
            retText = [controller ratAdapterText];
        });
        
        afterEach(^{
            [ratAdapterSwizz resetSwizzledInstanceMethod];
        });
        
        it(@"creates a rat adapter with proper rat", ^{
            [[(NSObject *)retRat should] equal:controller.rat];
        });
        
        it(@"returns rat text", ^{
            [[retText should] equal:expectedText];
        });
    });
});

SPEC_END