#import "AppDelegate.h"
#import "AppWindow.h"
#import "ViewController.h"

@interface AppDelegate ()

@property (strong, nonatomic) AppWindow *appWindow;
@property (strong, nonatomic) UIViewController *viewController;

@end


@implementation AppDelegate

- (id)init
{
    self = [super init];
    if (self) {
        self.appWindow = [[AppWindow alloc] init];
        self.viewController = [[ViewController alloc] init];
    }
    return self;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self.appWindow initializeWithRootViewController:self.viewController];
    return YES;
}


@end
