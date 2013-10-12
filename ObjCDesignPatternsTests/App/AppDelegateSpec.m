#import "Kiwi.h"
#import "AppDelegate.h"
#import "AppWindow.h"
#import "MainViewController.h"


@interface AppDelegate ()

@property (strong, nonatomic) AppWindow *appWindow;
@property (strong, nonatomic) UINavigationController *navController;
@property (strong, nonatomic) MainViewController *mainViewController;

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
    
    it(@"has a navigation controller", ^{
        [appDelegate.navController shouldNotBeNil];
    });
    
    it(@"has a mainViewController", ^{
        [appDelegate.mainViewController shouldNotBeNil];
    });
    
    context(@"#application:didFinishLaunchingWithOptions:", ^{
        __block BOOL isFinished;
        __block AppWindow *fakeAppWindow;
        
        beforeEach(^{
            isFinished = NO;
            fakeAppWindow = [AppWindow mock];
            appDelegate.appWindow = fakeAppWindow;
            
            [[appDelegate.navController should] receive:@selector(setViewControllers:)
                                          withArguments:@[appDelegate.mainViewController]];
            [[fakeAppWindow should] receive:@selector(initializeWithRootViewController:)
                              withArguments:appDelegate.navController];
            
            isFinished = [appDelegate application:nil didFinishLaunchingWithOptions:nil];
        });
        
        it(@"returns YES", ^{
            [[theValue(isFinished) should] beYes];
        });
    });
});

SPEC_END

