#import "Kiwi.h"
#import "Salsa.h"


SPEC_BEGIN(SalsaSpec)

describe(@"Salsa", ^{
    __block Salsa *salsa;
    
    beforeEach(^{
        salsa = [[Salsa alloc] init];
        salsa.name = @"Hot Sauuuuce";
    });
    
    it(@"is not nil", ^{
        [salsa shouldNotBeNil];
    });
    
    it(@"has a name property", ^{
        salsa.name = @"Hot Sauuuuce";
    });
});

SPEC_END