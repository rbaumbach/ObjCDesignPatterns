#import "Kiwi.h"
#import "Salsa.h"


SPEC_BEGIN(SalsaSpec)

describe(@"Salsa", ^{
    __block Salsa *salsa;
    
    beforeEach(^{
        salsa = [[Salsa alloc] init];
    });
    
    it(@"is not nil", ^{
        [salsa shouldNotBeNil];
    });
});

SPEC_END