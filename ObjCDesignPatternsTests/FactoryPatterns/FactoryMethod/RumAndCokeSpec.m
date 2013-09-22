#import "Kiwi.h"
#import "RumAndCoke.h"
#import "NSLogWrapper.h"


@interface Beverage ()

@property (strong, nonatomic) NSLogWrapper *logWrapper;

@end


SPEC_BEGIN(RumAndCokeSpec)

describe(@"RumAndCoke", ^{
    __block RumAndCoke *rumAndCoke;
    
    beforeEach(^{
        rumAndCoke = [[RumAndCoke alloc] init];
    });
    
    it(@"is not nil", ^{
        [rumAndCoke shouldNotBeNil];
    });
    
    it(@"is named Rum and Coke", ^{
        [[rumAndCoke.name should] equal:@"Rum and Coke"];
    });
    
    context(@"#prepare (method override)", ^{
        it(@"logs proper message", ^{
            [[rumAndCoke.logWrapper should] receive:@selector(log:) withArguments:@"Preparing rum and coke..."];
            [rumAndCoke prepare];
        });
    });
    
    context(@"#pour (method override)", ^{
        it(@"logs proper message", ^{
            [[rumAndCoke.logWrapper should] receive:@selector(log:) withArguments:@"Pouring rum and coke!"];
            [rumAndCoke pour];
        });
    });
});

SPEC_END