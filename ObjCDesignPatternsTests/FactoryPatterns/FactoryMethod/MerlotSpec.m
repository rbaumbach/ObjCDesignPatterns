#import "Kiwi.h"
#import "Merlot.h"


SPEC_BEGIN(MerlotSpec)

describe(@"Merlot", ^{
    __block Merlot *merlot;
    
    beforeEach(^{
        merlot = [[Merlot alloc] init];
    });
    
    it(@"is not nil", ^{
        [merlot shouldNotBeNil];
    });
});

SPEC_END