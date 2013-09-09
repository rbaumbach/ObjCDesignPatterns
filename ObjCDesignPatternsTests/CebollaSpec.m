#import "Kiwi.h"
#import "Cebolla.h"


SPEC_BEGIN(CebollaSpec)

describe(@"Cebolla", ^{
    __block Cebolla *vedura;
    
    beforeEach(^{
        vedura = [[Cebolla alloc] init];
    });
    
    it(@"is a subclass of vedura", ^{
        [[vedura should] beKindOfClass:[Vedura class]];
    });
    
    it(@"is not nil", ^{
        [vedura shouldNotBeNil];
    });
});

SPEC_END