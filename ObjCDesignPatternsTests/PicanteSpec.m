#import "Kiwi.h"
#import "Picante.h"


SPEC_BEGIN(PicanteSpec)

describe(@"Picante", ^{
    __block Picante *salsa;
    
    beforeEach(^{
        salsa = [[Picante alloc] init];
    });
    
    it(@"is a subclass of salsa", ^{
        [[salsa should] beKindOfClass:[Salsa class]];
    });
    
    it(@"is not nil", ^{
        [salsa shouldNotBeNil];
    });
});

SPEC_END