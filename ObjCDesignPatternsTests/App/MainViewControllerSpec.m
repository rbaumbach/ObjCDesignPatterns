#import "Kiwi.h"
#import "Swizzlean.h"
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

- (UITableViewCell *)getTableViewCellWithTableView:(UITableView *)tableView;

@end


@interface UIViewController ()

@property (strong, nonatomic) UINavigationController *navigationController;

@end


SPEC_BEGIN(MainViewControllerSpec)

describe(@"MainViewController", ^{
    __block MainViewController *controller;
    
    beforeEach(^{
        controller = [[MainViewController alloc] init];
        [controller view];
    });
    
    it(@"should not be nil", ^{
        [controller shouldNotBeNil];
    });
    
    it(@"is a subclass of UIViewController", ^{
        [[controller should] beKindOfClass:[UIViewController class]];
    });
    
    it(@"conforms to <UITableViewDataSource>", ^{
        [[controller should] conformToProtocol:@protocol(UITableViewDataSource)];
    });
    
    it(@"conforms to <UITableViewDelegate>", ^{
        [[controller should] conformToProtocol:@protocol(UITableViewDelegate)];
    });
    
    it(@"has correct title", ^{
        [[controller.title should] equal:@"Design Patterns in Obj-C"];
    });
    
    it(@"has a tableView", ^{
        [controller.tableView shouldNotBeNil];
    });
    
    it(@"is the tableViews datasource", ^{
        [[(NSObject *)controller.tableView.dataSource should] equal:controller];
    });
    
    it(@"is the tableViews delegate", ^{
        [[(NSObject *)controller.tableView.delegate should] equal:controller];
    });
    
    it(@"has a factoryPatternsViewController", ^{
        [controller.factoryPatternsViewController shouldNotBeNil];
    });
    
    it(@"has a singletonPatternViewController", ^{
        [controller.singletonPatternViewController shouldNotBeNil];
    });
    
    it(@"has a observerPatternViewController", ^{
        [controller.observerPatternViewController shouldNotBeNil];
    });
    
    it(@"has a commandPatternViewController", ^{
        [controller.commandPatternViewController shouldNotBeNil];
    });
    
    it(@"has a delegatePatternViewController", ^{
        [controller.delegatePatternViewController shouldNotBeNil];
    });
    
    it(@"has a iteratorPatternViewController", ^{
        [controller.iteratorPatternViewController shouldNotBeNil];
    });
    
    it(@"has a statePatternViewController", ^{
        [controller.statePatternViewController shouldNotBeNil];
    });
    
    it(@"has correct tableView data source", ^{
        NSArray *expectedDataSource = @[controller.factoryPatternsViewController, controller.singletonPatternViewController, controller.observerPatternViewController, controller.commandPatternViewController, controller.delegatePatternViewController, controller.iteratorPatternViewController, controller.statePatternViewController];
        [[controller.tableViewDataSource should] equal:expectedDataSource];
    });

    context(@"#viewDidLoad", ^{
        __block Swizzlean *superViewDidLoadSwizz;
        __block BOOL superViewDidLoadCalled;
        
        beforeEach(^{
            superViewDidLoadCalled = NO;
            superViewDidLoadSwizz = [[Swizzlean alloc] initWithClassToSwizzle:[UIViewController class]];
            [superViewDidLoadSwizz swizzleInstanceMethod:@selector(viewDidLoad) withReplacementImplementation:^(id _self) {
                superViewDidLoadCalled = YES;
            }];
        });
        
        afterEach(^{
            [superViewDidLoadSwizz resetSwizzledInstanceMethod];
        });
        
        it(@"calls super, thanks for asking", ^{
            [controller viewDidLoad];
            [[theValue(superViewDidLoadCalled) should] beYes];
        });
    });
    
    context(@"<UITableViewDataSource>", ^{
        context(@"#numberOfSectionsInTableView:", ^{
            it(@"returns 1", ^{
                NSInteger numberOfSections = [controller numberOfSectionsInTableView:nil];
                [[theValue(numberOfSections) should] equal:theValue(1)];
            });
        });
        
        context(@"#tableView:numberOfRowsInSection:", ^{
            it(@"returns the total number of items in the tableView data source", ^{
                NSInteger numberOfRows = [controller tableView:nil numberOfRowsInSection:0];
                [[theValue(numberOfRows) should] equal:theValue(controller.tableViewDataSource.count)];
            });
        });
        
        context(@"#tableView:cellForRowAtIndexPath:", ^{
            __block UITableView *fakeTableView;
            __block NSIndexPath *fakeIndexPath;
            __block UITableViewCell *fakeTableViewCell;
            
            beforeEach(^{
                fakeTableViewCell = [UITableViewCell mock];
                fakeTableView = [UITableView mock];
                fakeIndexPath = [NSIndexPath mock];
                
                NSArray *fakeDataSource = [NSArray mock];
                UIViewController *fakeViewController = [UIViewController mock];
                UILabel *fakeLabel = [UILabel mock];
                
                controller.tableViewDataSource = fakeDataSource;
                
                [[controller should] receive:@selector(getTableViewCellWithTableView:)
                                   andReturn:fakeTableViewCell
                               withArguments:fakeTableView];
                
                [[fakeIndexPath should] receive:@selector(row)
                                      andReturn:theValue(0)];
                
                [[controller.tableViewDataSource should] receive:@selector(objectAtIndex:)
                                                       andReturn:fakeViewController
                                                   withArguments:theValue(0)];
                
                [[fakeViewController should] receive:@selector(title)
                                           andReturn:@"Bogus Title!"];
                
                [[fakeTableViewCell should] receive:@selector(textLabel)
                                          andReturn:fakeLabel];
                
                [[fakeLabel should] receive:@selector(setText:)
                              withArguments:@"Bogus Title!"];
            });
            
            it(@"creates the cell correctly", ^{
                UITableViewCell *retCell = [controller tableView:fakeTableView cellForRowAtIndexPath:fakeIndexPath];
                [[retCell should] equal:fakeTableViewCell];
            });
        });
    });
    
    context(@"<UITableViewDelegate", ^{
        context(@"#tableView:didSelectRowAtIndexPath:", ^{
            __block UINavigationController *navController;
            
            beforeEach(^{
                navController = [[UINavigationController alloc] initWithRootViewController:controller];
            });
            
            it(@"pushes the appropriate view controller on navigation controller stack", ^{
                UIViewController *fakeViewController = [UIViewController mock];
                NSIndexPath *fakeIndexPath = [NSIndexPath mock];
                
                [[fakeIndexPath should] receive:@selector(row)
                                      andReturn:theValue(0)];
                
                [[controller.tableViewDataSource should] receive:@selector(objectAtIndex:)
                                                       andReturn:fakeViewController
                                                   withArguments:theValue(0)];
                
                [[controller.navigationController should] receive:@selector(pushViewController:animated:)
                                                    withArguments:fakeViewController, theValue(YES)];
                
                [controller tableView:nil didSelectRowAtIndexPath:fakeIndexPath];
            });
        });
    });
    
    context(@"#getTableViewCellWithTableView:", ^{
        __block UITableView *fakeTableView;
        __block UITableViewCell *fakeTableViewCell;
        __block UITableViewCell *retCell;
        
        __block Swizzlean *cellCreationSwizz;
        __block BOOL cellInitCalled;
        
        beforeEach(^{
            fakeTableView = [UITableView mock];
            fakeTableViewCell = [UITableViewCell mock];
            
            cellInitCalled = NO;
            cellCreationSwizz = [[Swizzlean alloc] initWithClassToSwizzle:[UITableViewCell class]];
            [cellCreationSwizz swizzleInstanceMethod:@selector(initWithStyle:reuseIdentifier:)
                       withReplacementImplementation:^(id _self) {
                           cellInitCalled = YES;
                           return fakeTableViewCell;
                       }];
        });
        
        afterEach(^{
            [cellCreationSwizz resetSwizzledInstanceMethod];
        });
        
        context(@"nill cell", ^{
            beforeEach(^{
                [[fakeTableView should] receive:@selector(dequeueReusableCellWithIdentifier:)
                                      andReturn:nil
                                  withArguments:@"Cell"];
                                
                retCell = [controller getTableViewCellWithTableView:fakeTableView];
            });
            
            it(@"creates new cell", ^{
                [[theValue(cellInitCalled) should] beYes];
                [[retCell should] equal:fakeTableViewCell];
            });
        });
        
        context(@"non-nill cell", ^{
            beforeEach(^{
                [[fakeTableView should] receive:@selector(dequeueReusableCellWithIdentifier:)
                                      andReturn:fakeTableViewCell
                                  withArguments:@"Cell"];
                
                retCell = [controller getTableViewCellWithTableView:fakeTableView];
            });
            
            it(@"reuses the cell", ^{
                [[theValue(cellInitCalled) should] beNo];
                [[retCell should] equal:fakeTableViewCell];
            });
        });
    });
});

SPEC_END