#import "AppDelegate.h"
#import "AppWindow.h"
#import "FactoryPatternsViewController.h"

@interface AppDelegate ()

@property (strong, nonatomic) AppWindow *appWindow;
@property (strong, nonatomic) FactoryPatternsViewController *factoryPatternsViewController;
@property (strong, nonatomic) UITabBarController *tabBarController;

@end


@implementation AppDelegate

- (id)init
{
    self = [super init];
    if (self) {
        self.appWindow = [[AppWindow alloc] init];
        self.factoryPatternsViewController = [[FactoryPatternsViewController alloc] init];
        self.tabBarController = [[UITabBarController alloc] init];
    }
    return self;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.tabBarController.viewControllers = @[self.factoryPatternsViewController];
    [self.appWindow initializeWithRootViewController:self.tabBarController];
    return YES;
}


@end
