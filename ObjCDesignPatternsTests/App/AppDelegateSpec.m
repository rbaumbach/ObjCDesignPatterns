#import "Kiwi.h"
#import "AppDelegate.h"
#import "AppWindow.h"
#import "FactoryPatternsViewController.h"
#import "SingletonPatternViewController.h"
#import "ObserverPatternViewController.h"
#import "CommandPatternViewController.h"


@interface AppDelegate ()

@property (strong, nonatomic) AppWindow *appWindow;
@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) FactoryPatternsViewController *factoryPatternsViewController;
@property (strong, nonatomic) SingletonPatternViewController *singletonPatternViewController;
@property (strong, nonatomic) ObserverPatternViewController *observerPatternViewController;
@property (strong, nonatomic) CommandPatternViewController *commandPatternViewController;

@end


SPEC_BEGIN(AppDelegateSpec)

describe(@"AppDelegate", ^{
    __block AppDelegate *appDelegate;
    
    beforeEach(^{
        appDelegate = [[AppDelegate alloc] init];
    });
    
    it(@"conforms to <UIApplicationDelegate>", ^{
        [[appDelegate should] conformToProtocol:@protocol(UIApplicationDelegate)];
    });
    
    it(@"is a subclass of UIResponder", ^{
        [appDelegate isKindOfClass:[UIResponder class]];
    });
    
    it(@"has an appWindow", ^{
        [appDelegate.appWindow shouldNotBeNil];
    });
    
    it(@"has a tabBarController", ^{
        [appDelegate.tabBarController shouldNotBeNil];
    });
    
    it(@"has a FactoryPatternsViewController", ^{
        [appDelegate.factoryPatternsViewController shouldNotBeNil];
    });
    
    it(@"has a SingletonPatternViewController", ^{
        [appDelegate.singletonPatternViewController shouldNotBeNil];
    });
    
    it(@"has a ObserverPatternViewController", ^{
        [appDelegate.observerPatternViewController shouldNotBeNil];
    });
    
    it(@"has a CommandPatternViewController", ^{
        [appDelegate.commandPatternViewController shouldNotBeNil];
    });
    
    context(@"#application:didFinishLaunchingWithOptions:", ^{
        __block BOOL isFinished;
        __block AppWindow *fakeAppWindow;
        __block UITabBarController *fakeTabBarController;
        __block FactoryPatternsViewController *fakeFactoryPatternsViewController;
        
        beforeEach(^{
            isFinished = NO;
            fakeAppWindow = [AppWindow mock];
            fakeTabBarController = [UITabBarController mock];
            fakeFactoryPatternsViewController = [FactoryPatternsViewController mock];
            appDelegate.appWindow = fakeAppWindow;
            appDelegate.tabBarController = fakeTabBarController;
            
            [[fakeTabBarController should] receive:@selector(setViewControllers:) withArguments:@[appDelegate.factoryPatternsViewController, appDelegate.singletonPatternViewController, appDelegate.observerPatternViewController, appDelegate.commandPatternViewController]];
            [[fakeAppWindow should] receive:@selector(initializeWithRootViewController:) withArguments:appDelegate.tabBarController];
            isFinished = [appDelegate application:nil didFinishLaunchingWithOptions:nil];
        });
        
        it(@"returns YES", ^{
            [[theValue(isFinished) should] beYes];
        });
    });
});

SPEC_END

