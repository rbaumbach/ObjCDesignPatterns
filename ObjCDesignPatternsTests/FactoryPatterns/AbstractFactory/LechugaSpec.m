#import "Kiwi.h"
#import "Lechuga.h"


SPEC_BEGIN(LechugaSpec)

describe(@"Lechuga", ^{
    __block Lechuga *vedura;
    
    beforeEach(^{
        vedura = [[Lechuga alloc] init];
    });
    
    it(@"is a subclass of vedura", ^{
        [[vedura should] beKindOfClass:[Lechuga class]];
    });
    
    it(@"is not nil", ^{
        [vedura shouldNotBeNil];
    });
});

SPEC_END