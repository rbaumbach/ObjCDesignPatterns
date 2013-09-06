#import "Kiwi.h"
#import "Chardonnay.h"


SPEC_BEGIN(ChardonnaySpec)

describe(@"Chardonnay", ^{
    __block Chardonnay *chardonnay;
    
    beforeEach(^{
        chardonnay = [[Chardonnay alloc] init];
    });
    
    it(@"is not nil", ^{
        [chardonnay shouldNotBeNil];
    });
});

SPEC_END