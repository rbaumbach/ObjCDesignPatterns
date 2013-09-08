#import "Kiwi.h"
#import "Vedura.h"


SPEC_BEGIN(VeduraSpec)

describe(@"Vedura", ^{
    __block Vedura *vedura;
    
    beforeEach(^{
        vedura = [[Vedura alloc] init];
    });
    
    it(@"is not nil", ^{
        [vedura shouldNotBeNil];
    });
});

SPEC_END