#import "Kiwi.h"
#import "Cilantro.h"


SPEC_BEGIN(CilantroSpec)

describe(@"Cilantro", ^{
    __block Cilantro *vedura;
    
    beforeEach(^{
        vedura = [[Cilantro alloc] init];
    });
    
    it(@"is a subclass of vedura", ^{
        BOOL isVedura = [vedura isKindOfClass:[Vedura class]];
        [[theValue(isVedura) should] beYes];
        
    });
    
    it(@"is not nil", ^{
        [vedura shouldNotBeNil];
    });
});

SPEC_END