#import "MainViewController.h"
#import "FactoryPatternsViewController.h"
#import "SingletonPatternViewController.h"
#import "ObserverPatternViewController.h"
#import "CommandPatternViewController.h"
#import "DelegatePatternViewController.h"
#import "IteratorPatternViewController.h"
#import "StatePatternViewController.h"


@interface MainViewController ()

@property (strong, nonatomic) NSArray *tableViewDataSource;
@property (strong, nonatomic) FactoryPatternsViewController *factoryPatternsViewController;
@property (strong, nonatomic) SingletonPatternViewController *singletonPatternViewController;
@property (strong, nonatomic) ObserverPatternViewController *observerPatternViewController;
@property (strong, nonatomic) CommandPatternViewController *commandPatternViewController;
@property (strong, nonatomic) DelegatePatternViewController *delegatePatternViewController;
@property (strong, nonatomic) IteratorPatternViewController *iteratorPatternViewController;
@property (strong, nonatomic) StatePatternViewController *statePatternViewController;

@end


@implementation MainViewController

#pragma mark - Init Methods

- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"Design Patterns in Obj-C";
        
        self.factoryPatternsViewController = [[FactoryPatternsViewController alloc] init];
        self.singletonPatternViewController = [[SingletonPatternViewController alloc] init];
        self.observerPatternViewController = [[ObserverPatternViewController alloc] init];
        self.commandPatternViewController = [[CommandPatternViewController alloc] init];
        self.delegatePatternViewController = [[DelegatePatternViewController alloc] init];
        self.iteratorPatternViewController = [[IteratorPatternViewController alloc] init];
        self.statePatternViewController = [[StatePatternViewController alloc] init];
        
        self.tableViewDataSource = @[self.factoryPatternsViewController, self.singletonPatternViewController,
                                     self.observerPatternViewController, self.commandPatternViewController,
                                     self.delegatePatternViewController, self.iteratorPatternViewController,
                                     self.statePatternViewController];
    }
    return self;
}

#pragma mark - <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tableViewDataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self getTableViewCellWithTableView:tableView];
    
    UIViewController *viewController = [self.tableViewDataSource objectAtIndex:indexPath.row];
    NSString *viewControllerTitle = viewController.title;

    cell.textLabel.text = viewControllerTitle;
    
    return cell;
}

#pragma mark - <UITableViewDelegate>

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *viewController = [self.tableViewDataSource objectAtIndex:indexPath.row];

    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - Private Methods

- (UITableViewCell *)getTableViewCellWithTableView:(UITableView *)tableView
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
    }
    
    return cell;
}

@end
