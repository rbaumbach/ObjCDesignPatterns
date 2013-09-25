#import "AppWindow.h"


@interface AppWindow ()

@property (nonatomic) CGRect screenBounds;
@property (strong, nonatomic) UIWindow *uiWindow;

@end


@implementation AppWindow

- (void)initializeWithRootViewController:(UIViewController *)rootViewController
{
    self.screenBounds = [self createMainScreenBounds];
    self.uiWindow = [self createUIWindowWithBounds];
    [self setupWindow:rootViewController];
}

- (CGRect)createMainScreenBounds
{
    return [[UIScreen mainScreen] bounds];
}

- (UIWindow *)createUIWindowWithBounds
{
    return [[UIWindow alloc] initWithFrame:self.screenBounds];
}

- (void)setupWindow:(UIViewController *)rootViewController
{
    self.uiWindow.rootViewController = rootViewController;
    [self.uiWindow makeKeyAndVisible];
}

@end
