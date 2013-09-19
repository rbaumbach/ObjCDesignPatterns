#import "Kiwi.h"
#import "AppDelegate.h"
#import "AppWindow.h"
#import "FactoryPatternsViewController.h"

@interface AppDelegate ()

@property (strong, nonatomic) AppWindow *appWindow;
@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) FactoryPatternsViewController *factoryPatternsViewController;

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
            appDelegate.factoryPatternsViewController = fakeFactoryPatternsViewController;
            
            [[fakeTabBarController should] receive:@selector(setViewControllers:) withArguments:@[appDelegate.factoryPatternsViewController]];
            [[fakeAppWindow should] receive:@selector(initializeWithRootViewController:) withArguments:appDelegate.tabBarController];
            isFinished = [appDelegate application:nil didFinishLaunchingWithOptions:nil];
        });
        
        it(@"returns YES", ^{
            [[theValue(isFinished) should] beYes];
        });
    });
});

SPEC_END

