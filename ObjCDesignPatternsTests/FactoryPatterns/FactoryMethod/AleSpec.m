#import "Kiwi.h"
#import "Ale.h"
#import "NSLogWrapper.h"


@interface Beverage ()

@property (strong, nonatomic) NSLogWrapper *logWrapper;

@end


SPEC_BEGIN(AleSpec)

describe(@"Ale", ^{
    __block Ale *ale;
    
    beforeEach(^{
        ale = [[Ale alloc] init];
    });
    
    it(@"is not nil", ^{
        [ale shouldNotBeNil];
    });
    
    it(@"is named Ale", ^{
        [[ale.name should] equal:@"Ale"];
    });
    
    context(@"#prepare (method override)", ^{
        it(@"logs proper message", ^{
            [[ale.logWrapper should] receive:@selector(log:) withArguments:@"Preparing ale..."];
            [ale prepare];
        });
    });
    
    context(@"#pour (method override)", ^{
        it(@"logs proper message", ^{
            [[ale.logWrapper should] receive:@selector(log:) withArguments:@"Pouring ale!"];
            [ale pour];
        });
    });
});

SPEC_END