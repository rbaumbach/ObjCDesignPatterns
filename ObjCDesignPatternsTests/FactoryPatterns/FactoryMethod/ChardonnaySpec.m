#import "Kiwi.h"
#import "Chardonnay.h"
#import "NSLogWrapper.h"


@interface Beverage ()

@property (strong, nonatomic) NSLogWrapper *logWrapper;

@end


SPEC_BEGIN(ChardonnaySpec)

describe(@"Chardonnay", ^{
    __block Chardonnay *chardonnay;
    
    beforeEach(^{
        chardonnay = [[Chardonnay alloc] init];
    });
    
    it(@"is not nil", ^{
        [chardonnay shouldNotBeNil];
    });
    
    it(@"is named Chardonnay", ^{
        [[chardonnay.name should] equal:@"Chardonnay"];
    });
    
    context(@"#prepare (method override)", ^{
        it(@"logs proper message", ^{
            [[chardonnay.logWrapper should] receive:@selector(log:) withArguments:@"Preparing chardonnay..."];
            [chardonnay prepare];
        });
    });
    
    context(@"#pour (method override)", ^{
        it(@"logs proper message", ^{
            [[chardonnay.logWrapper should] receive:@selector(log:) withArguments:@"Pouring chardonnay!"];
            [chardonnay pour];
        });
    });
});

SPEC_END