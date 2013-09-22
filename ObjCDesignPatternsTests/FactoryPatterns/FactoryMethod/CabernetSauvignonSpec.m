#import "Kiwi.h"
#import "CabernetSauvignon.h"
#import "NSLogWrapper.h"


@interface Beverage ()

@property (strong, nonatomic) NSLogWrapper *logWrapper;

@end


SPEC_BEGIN(CabernetSauvignonSpec)

describe(@"CabernetSauvignon", ^{
    __block CabernetSauvignon *cabernetSauvignon;
    
    beforeEach(^{
        cabernetSauvignon = [[CabernetSauvignon alloc] init];
    });
    
    it(@"is not nil", ^{
        [cabernetSauvignon shouldNotBeNil];
    });
    
    it(@"is named Cabernet Sauvignon", ^{
        [[cabernetSauvignon.name should] equal:@"Cabernet Sauvignon"];
    });
    
    context(@"#prepare (method override)", ^{
        it(@"logs proper message", ^{
            [[cabernetSauvignon.logWrapper should] receive:@selector(log:) withArguments:@"Preparing cabernet sauvignon..."];
            [cabernetSauvignon prepare];
        });
    });
    
    context(@"#pour (method override)", ^{
        it(@"logs proper message", ^{
            [[cabernetSauvignon.logWrapper should] receive:@selector(log:) withArguments:@"Pouring cabernet sauvignon!"];
            [cabernetSauvignon pour];
        });
    });
});

SPEC_END