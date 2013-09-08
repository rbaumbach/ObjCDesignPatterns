#import "Kiwi.h"
#import "Lechuga.h"


SPEC_BEGIN(LechugaSpec)

describe(@"Lechuga", ^{
    __block Lechuga *vedura;
    
    beforeEach(^{
        vedura = [[Lechuga alloc] init];
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