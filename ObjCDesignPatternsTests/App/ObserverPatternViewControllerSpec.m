#import "Kiwi.h"
#import "Swizzlean.h"
#import "ObserverPatternViewController.h"
#import "BurritoReporter.h"
#import "ChimichangaTimes.h"
#import "SuperBurritoGazette.h"
#import "BurritoSupremeBee.h"


@interface ObserverPatternViewController ()

@property (strong, nonatomic) BurritoReporter *burritoReporter;
@property (strong, nonatomic) ChimichangaTimes *chimichangaTimes;
@property (strong, nonatomic) SuperBurritoGazette *superBurritoGazette;
@property (strong, nonatomic) BurritoSupremeBee *burritoSupremeBee;

- (void)setupBurritoReporting;
- (NSString *)getNewspaperSnippets;
- (void)setupTextView;

@end


SPEC_BEGIN(ObserverPatternViewControllerSpec)

describe(@"ObserverPatternViewController", ^{
    __block ObserverPatternViewController *controller;
    
    beforeEach(^{
        controller = [[ObserverPatternViewController alloc] init];
        [controller view];
    });
    
    it(@"should not be nil", ^{
        [controller shouldNotBeNil];
    });
    
    it(@"is a subclass of UIViewController", ^{
        [[controller should] beKindOfClass:[UIViewController class]];
    });
    
    it(@"has the correct tabBarItem title", ^{
        [[controller.tabBarItem.title should] equal:@"Observer"];
    });
    
    it(@"has a tabBarItem", ^{
        [controller.tabBarItem shouldNotBeNil];
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
            [superViewDidLoadSwizz swizzleInstanceMethod:@selector(viewDidLoad) withReplacementImplementation:^(id _self) {
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
        
        it(@"calls setupBurritoReporting", ^{
            [[controller should] receive:@selector(setupBurritoReporting)];
            [controller viewDidLoad];
        });
        
        it(@"calls setupTextView", ^{
            [[controller should] receive:@selector(setupTextView)];
            [controller viewDidLoad];
        });
    });
    
    context(@"#setupBurritoReporting", ^{
        it(@"creates a burrito reporter", ^{
            [controller.burritoReporter shouldNotBeNil];
        });
        
        it(@"creates Chimichanga Times", ^{
            [controller.chimichangaTimes shouldNotBeNil];
        });
        
        it(@"creates Super Burrito Gazette", ^{
            [controller.superBurritoGazette shouldNotBeNil];
        });
        
        it(@"creates Burrito Supreme Bee", ^{
            [controller.burritoSupremeBee shouldNotBeNil];
        });
    });
    
    context(@"#getNewspaperSnippets", ^{
        __block NSString *snippets;
        
        beforeEach(^{
            [controller setupBurritoReporting]; // shortcut to setup the reporting plumbing
            controller.burritoReporter.headline = @"Waffle Burrito";
            snippets = [controller getNewspaperSnippets];
        });
        
        it(@"returns snippets from all newspapers", ^{
            NSString *expectedSnippets = @"Chimichanga News Snippet...\nWaffle Burrito\n~>Chimichanga Times 2013<~\nSuper Burrito Gazette News Snippet...\nWaffle Burrito\n->>>Super Burrito Gazette 2013<<<-\nBurrito Supreme Bee News Snippet...\nWaffle Burrito\n<-->Super Burrito Bee 2013<-->\n";
            [[snippets should] equal:expectedSnippets];
        });
    });

    context(@"#setupTextView", ^{
        beforeEach(^{
            [controller setupBurritoReporting]; // shortcut to setup the reporting plumbing
            [[controller should] receive:@selector(getNewspaperSnippets) andReturn:@"Fake Snippets\n" withCount:3];
            [[controller.burritoReporter should] receive:@selector(removeObserver:) withArguments:controller.burritoSupremeBee];
            [controller setupTextView];
        });
        
        it(@"sets up the textView with the correct text ", ^{
            NSString *expectedText = @"Creating Burrito reporter...\nCreating Chimichanga Times, Super Burrito Gazette and Burrito Supreme Bee...\nReporter reports Elvis burrito sighting...\nFake Snippets\nReporter reports attack of Zombie Vegan Wrap...\nFake Snippets\nBurrito Supreme doesn't want reports from this 'tabloid' reporter.  Unsubscribing...\nReporter reports 'Tortilla Malfunction' at Giant's game...\nFake Snippets\n";
            [[controller.textView.text should] equal:expectedText];
        });
    });
});

SPEC_END