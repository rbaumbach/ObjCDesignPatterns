#import "Kiwi.h"
#import "WhiskeySour.h"


SPEC_BEGIN(WhiskeySourSpec)

describe(@"WhiskeySour", ^{
    __block WhiskeySour *whiskeySour;
    
    beforeEach(^{
        whiskeySour = [[WhiskeySour alloc] init];
    });
    
    it(@"is not nil", ^{
        [whiskeySour shouldNotBeNil];
    });
});

SPEC_END