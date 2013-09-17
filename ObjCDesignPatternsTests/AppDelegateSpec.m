#import "Kiwi.h"
#import "AppDelegate.h"
#import "AppWindow.h"

@interface AppDelegate ()

@property (strong, nonatomic) AppWindow *appWindow;
@property (strong, nonatomic) UIViewController *viewController;

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
    
    it(@"has a UIViewController", ^{
        [appDelegate.viewController shouldNotBeNil];
    });
    
    context(@"#application:didFinishLaunchingWithOptions:", ^{
        __block BOOL isFinished;
        __block AppWindow *fakeAppWindow;
        __block UIViewController *fakeViewController;
        
        beforeEach(^{
            isFinished = NO;
            fakeAppWindow = [AppWindow mock];
            appDelegate.appWindow = fakeAppWindow;
            fakeViewController = [UIViewController mock];
            appDelegate.viewController = fakeViewController;
            
            [[fakeAppWindow should] receive:@selector(initializeWithRootViewController:) withArguments:appDelegate.viewController];
            isFinished = [appDelegate application:nil didFinishLaunchingWithOptions:nil];
        });
        
        it(@"returns YES", ^{
            [[theValue(isFinished) should] beYes];
        });
    });
});

SPEC_END

