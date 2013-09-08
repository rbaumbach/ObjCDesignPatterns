#import "Kiwi.h"
#import "Tomate.h"


SPEC_BEGIN(TomateSpec)

describe(@"Tomate", ^{
    __block Tomate *vedura;
    
    beforeEach(^{
        vedura = [[Tomate alloc] init];
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