#import "Kiwi.h"
#import "FactoryPatternsViewController.h"

SPEC_BEGIN(FactoryPatternsViewControllerSpec)

describe(@"FactoryPatternsViewController", ^{
    __block FactoryPatternsViewController *controller;
    
    beforeEach(^{
        controller = [[FactoryPatternsViewController alloc] init];
        [controller view];
    });
    
    it(@"should not be nil", ^{
        [controller shouldNotBeNil];
    });
    
    it(@"is a subclass of UIViewController", ^{
        [[controller should] beKindOfClass:[UIViewController class]];
    });
    
    it(@"has the correct tabBarItem title", ^{
        [[controller.tabBarItem.title should] equal:@"Factory Patterns"];
    });
    
    it(@"has a tabBarItem", ^{
        [controller.tabBarItem shouldNotBeNil];
    });
});

SPEC_END