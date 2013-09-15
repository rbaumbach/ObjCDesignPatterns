#import "Kiwi.h"
#import "Cilantro.h"


SPEC_BEGIN(CilantroSpec)

describe(@"Cilantro", ^{
    __block Cilantro *vedura;
    
    beforeEach(^{
        vedura = [[Cilantro alloc] init];
    });
    
    it(@"is a subclass of vedura", ^{
        [[vedura should] beKindOfClass:[Vedura class]];
    });
    
    it(@"is not nil", ^{
        [vedura shouldNotBeNil];
    });
});

SPEC_END