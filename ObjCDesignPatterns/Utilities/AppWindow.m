#import "AppWindow.h"


@interface AppWindow ()

@property (nonatomic) CGRect screenBounds;
@property (strong, nonatomic) UIWindow *uiWindow;

@end


@implementation AppWindow

#pragma mark - Public Methods

- (void)initializeWithRootViewController:(UIViewController *)rootViewController
{
    self.screenBounds = [self createMainScreenBounds];
    self.uiWindow = [self createUIWindowWithBounds];
    [self setupWindow:rootViewController];
}

#pragma mark - Private Methods

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
