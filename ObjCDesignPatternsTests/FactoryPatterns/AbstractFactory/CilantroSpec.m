#import "Kiwi.h"
#import "Cilantro.h"


SPEC_BEGIN(CilantroSpec)

describe(@"Cilantro", ^{
    __block Cilantro *cilantro;
    
    beforeEach(^{
        cilantro = [[Cilantro alloc] init];
    });
    
    it(@"is a subclass of vedura", ^{
        [[cilantro should] beKindOfClass:[Vedura class]];
    });
    
    it(@"is not nil", ^{
        [cilantro shouldNotBeNil];
    });
    
    it(@"is called 'Cilantro'", ^{
        cilantro.name = @"Cilantro";
    });
});

SPEC_END