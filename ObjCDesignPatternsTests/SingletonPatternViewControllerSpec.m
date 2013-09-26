#import "Kiwi.h"
#import "SingletonPatternViewController.h"


SPEC_BEGIN(SingletonPatternViewControllerSpec)

describe(@"SingletonPatternViewController", ^{
    __block SingletonPatternViewController *controller;
    
    beforeEach(^{
        controller = [[SingletonPatternViewController alloc] init];
        [controller view];
    });
    
    it(@"should not be nil", ^{
        [controller shouldNotBeNil];
    });
});

SPEC_END