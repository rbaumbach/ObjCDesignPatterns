#import "Kiwi.h"
#import "CabernetSauvignon.h"


SPEC_BEGIN(CabernetSauvignonSpec)

describe(@"Merlot", ^{
    __block CabernetSauvignon *cabernetSauvignon;
    
    beforeEach(^{
        cabernetSauvignon = [[CabernetSauvignon alloc] init];
    });
    
    it(@"is not nil", ^{
        [cabernetSauvignon shouldNotBeNil];
    });
});

SPEC_END