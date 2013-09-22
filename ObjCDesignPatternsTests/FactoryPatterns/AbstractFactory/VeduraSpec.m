#import "Kiwi.h"
#import "Vedura.h"


SPEC_BEGIN(VeduraSpec)

describe(@"Vedura", ^{
    __block Vedura *vedura;
    
    beforeEach(^{
        vedura = [[Vedura alloc] init];
        vedura.name = @"Bok Choy";
    });
    
    it(@"is not nil", ^{
        [vedura shouldNotBeNil];
    });
    
    it(@"has a name property", ^{
        vedura.name = @"Bok Choy";
    });
});

SPEC_END