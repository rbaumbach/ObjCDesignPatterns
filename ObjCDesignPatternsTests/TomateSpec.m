#import "Kiwi.h"
#import "Tomate.h"


SPEC_BEGIN(TomateSpec)

describe(@"Tomate", ^{
    __block Tomate *vedura;
    
    beforeEach(^{
        vedura = [[Tomate alloc] init];
    });
    
    it(@"is a subclass of vedura", ^{
        [[vedura should] beKindOfClass:[Tomate class]];
        
    });
    
    it(@"is not nil", ^{
        [vedura shouldNotBeNil];
    });
});

SPEC_END