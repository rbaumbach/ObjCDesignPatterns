#import "Kiwi.h"
#import "AppWindow.h"
#import "Swizzlean.h"


@interface AppWindow ()

@property (nonatomic) CGRect screenBounds;
@property (strong, nonatomic) UIWindow *uiWindow;

- (CGRect)createMainScreenBounds;
- (UIWindow *)createUIWindowWithBounds;
- (void)setupWindow:(UIViewController *)rootViewController;

@end


SPEC_BEGIN(AppWindowSpec)

describe(@"AppWindow", ^{
    __block AppWindow *appWindow;
    
    beforeEach(^{
        appWindow = [[AppWindow alloc] init];
    });
    
    context(@"initializeWithRootViewController:", ^{
        __block CGRect fakeScreenBounds;
        __block UIViewController *fakeViewController;
        __block UIWindow *fakeWindow;
        
        beforeEach(^{
            fakeViewController = [UIViewController mock];
            fakeScreenBounds = CGRectMake(5, 10, 15, 20);
            fakeWindow = [UIWindow mock];
            
            [[appWindow should] receive:@selector(createMainScreenBounds) andReturn:theValue(fakeScreenBounds)];
            [[appWindow should] receive:@selector(createUIWindowWithBounds) andReturn:fakeWindow];
            [[appWindow should] receive:@selector(setupWindow:) withArguments:fakeViewController];
            [appWindow initializeWithRootViewController:fakeViewController];
        });
        
        it(@"stores the bounds of the screen", ^{
            [[theValue(appWindow.screenBounds) should] equal:theValue(fakeScreenBounds)];
        });
        
        it(@"stores the UIWindow using bounds of the screen", ^{
            [[appWindow.uiWindow should] equal:fakeWindow];
        });
    });
    
    context(@"#createMainScreenBounds", ^{
        it(@"creates bounds of the screen", ^{
            UIScreen *fakeUIScreen = [UIScreen mock];
            CGRect fakeScreenBounds = CGRectMake(5, 10, 15, 20);
            
            [[UIScreen stubAndReturn:fakeUIScreen] mainScreen];
            [[fakeUIScreen should] receive:@selector(bounds) andReturn:theValue(fakeScreenBounds)];
            CGRect retScreenBounds = [appWindow createMainScreenBounds];
            [[theValue(retScreenBounds) should] equal:theValue(fakeScreenBounds)];
        });
    });
    
    context(@"#createUIWindowWithBounds", ^{
        __block Swizzlean *swizzWindow;
        __block UIWindow *fakeWindow;
        __block UIWindow *retWindow;
        __block CGRect retBounds;
        __block CGRect fakeScreenBounds;
        
        beforeEach(^{
            fakeWindow = [UIWindow mock];
            fakeScreenBounds = CGRectMake(5, 10, 15, 20);
            swizzWindow = [[Swizzlean alloc] initWithClassToSwizzle:[UIWindow class]];
            [swizzWindow swizzleInstanceMethod:@selector(initWithFrame:) withReplacementImplementation:^(id _self, CGRect paramBounds) {
                retBounds = paramBounds;
                return fakeWindow;
            }];
            
            appWindow.screenBounds = fakeScreenBounds;
            retWindow = [appWindow createUIWindowWithBounds];
        });
        
        afterEach(^{
            [swizzWindow resetSwizzledInstanceMethod];
        });
        
        it(@"creats a UIWindow using bounds of the screen", ^{
            [[retWindow should] equal:fakeWindow];
            [[theValue(retBounds) should] equal:theValue(fakeScreenBounds)];
        });
    });
    
    context(@"#setupWindow", ^{
        it(@"sets up the window", ^{
            UIWindow *fakeWindow = [UIWindow mock];
            UIViewController *fakeViewController = [UIViewController mock];
            
            appWindow.uiWindow = fakeWindow;
            [[appWindow.uiWindow should] receive:@selector(setRootViewController:) withArguments:fakeViewController];
            [[appWindow.uiWindow should] receive:@selector(makeKeyAndVisible)];
            [appWindow setupWindow:fakeViewController];
        });
    });
});

SPEC_END

