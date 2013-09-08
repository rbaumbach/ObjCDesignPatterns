#import "Kiwi.h"
#import "Cebolla.h"


SPEC_BEGIN(CebollaSpec)

describe(@"Cebolla", ^{
    __block Cebolla *vedura;
    
    beforeEach(^{
        vedura = [[Cebolla alloc] init];
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