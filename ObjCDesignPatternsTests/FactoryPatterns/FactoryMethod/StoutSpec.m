#import "Kiwi.h"
#import "Stout.h"
#import "NSLogWrapper.h"


@interface Beverage ()

@property (strong, nonatomic) NSLogWrapper *logWrapper;

@end


SPEC_BEGIN(StoutSpec)

describe(@"Stout", ^{
    __block Stout *stout;
    
    beforeEach(^{
        stout= [[Stout alloc] init];
    });
    
    it(@"is not nil", ^{
        [stout shouldNotBeNil];
    });
    
    it(@"is named Stout", ^{
        [[stout.name should] equal:@"Stout"];
    });
    
    context(@"#prepare (method override)", ^{
        it(@"logs proper message", ^{
            [[stout.logWrapper should] receive:@selector(log:) withArguments:@"Preparing stout..."];
            [stout prepare];
        });
    });
    
    context(@"#pour (method override)", ^{
        it(@"logs proper message", ^{
            [[stout.logWrapper should] receive:@selector(log:) withArguments:@"Pouring stout!"];
            [stout pour];
        });
    });
});

SPEC_END