#import "AppDelegate.h"
#import "AppWindow.h"
#import "MainViewController.h"


@interface AppDelegate ()

@property (strong, nonatomic) AppWindow *appWindow;
@property (strong, nonatomic) UINavigationController *navController;
@property (strong, nonatomic) MainViewController *mainViewController;

@end


@implementation AppDelegate

- (id)init
{
    self = [super init];
    if (self) {
        self.appWindow = [[AppWindow alloc] init];
        self.navController = [[UINavigationController alloc] init];
        self.mainViewController = [[MainViewController alloc] init];
    }
    return self;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.navController.viewControllers = @[self.mainViewController];

    [self.appWindow initializeWithRootViewController:self.navController];
    return YES;
}

@end
