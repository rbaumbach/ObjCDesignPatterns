#import "Kiwi.h"
#import "Merlot.h"
#import "NSLogWrapper.h"


@interface Beverage ()

@property (strong, nonatomic) NSLogWrapper *logWrapper;

@end


SPEC_BEGIN(MerlotSpec)

describe(@"Merlot", ^{
    __block Merlot *merlot;
    
    beforeEach(^{
        merlot = [[Merlot alloc] init];
    });
    
    it(@"is not nil", ^{
        [merlot shouldNotBeNil];
    });
    
    it(@"is named Merlot", ^{
        [[merlot.name should] equal:@"Merlot"];
    });
    
    context(@"#prepare (method override)", ^{
        it(@"logs proper message", ^{
            [[merlot.logWrapper should] receive:@selector(log:) withArguments:@"Preparing merlot..."];
            [merlot prepare];
        });
    });
    
    context(@"#pour (method override)", ^{
        it(@"logs proper message", ^{
            [[merlot.logWrapper should] receive:@selector(log:) withArguments:@"Pouring merlot!"];
            [merlot pour];
        });
    });
});

SPEC_END