#import "Kiwi.h"
#import "Picante.h"


SPEC_BEGIN(PicanteSpec)

describe(@"Picante", ^{
    __block Picante *salsa;
    
    beforeEach(^{
        salsa = [[Picante alloc] init];
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