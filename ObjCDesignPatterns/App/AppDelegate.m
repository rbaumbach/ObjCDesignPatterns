#import "AppDelegate.h"
#import "AppWindow.h"
#import "FactoryPatternsViewController.h"
#import "SingletonPatternViewController.h"
#import "ObserverPatternViewController.h"


@interface AppDelegate ()

@property (strong, nonatomic) AppWindow *appWindow;
@property (strong, nonatomic) FactoryPatternsViewController *factoryPatternsViewController;
@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) SingletonPatternViewController *singletonPatternViewController;
@property (strong, nonatomic) ObserverPatternViewController *observerPatternViewController;

@end


@implementation AppDelegate

- (id)init
{
    self = [super init];
    if (self) {
        self.appWindow = [[AppWindow alloc] init];
        self.factoryPatternsViewController = [[FactoryPatternsViewController alloc] init];
        self.singletonPatternViewController = [[SingletonPatternViewController alloc] init];
        self.observerPatternViewController = [[ObserverPatternViewController alloc] init];
        self.tabBarController = [[UITabBarController alloc] init];
    }
    return self;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.tabBarController.viewControllers = @[self.factoryPatternsViewController, self.singletonPatternViewController, self.observerPatternViewController];
    [self.appWindow initializeWithRootViewController:self.tabBarController];
    return YES;
}

@end
