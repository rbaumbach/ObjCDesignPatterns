#import "Kiwi.h"
#import "Mild.h"


SPEC_BEGIN(MildSpec)

describe(@"Mild", ^{
    __block Mild *salsa;
    
    beforeEach(^{
        salsa = [[Mild alloc] init];
    });
    
    it(@"is a subclass of salsa", ^{
        BOOL isSalsa = [salsa isKindOfClass:[Salsa class]];
        [[theValue(isSalsa) should] beYes];
        
    });
    
    it(@"is not nil", ^{
        [salsa shouldNotBeNil];
    });
});

SPEC_END