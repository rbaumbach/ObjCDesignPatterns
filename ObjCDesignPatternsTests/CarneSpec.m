#import "Kiwi.h"
#import "Carne.h"


SPEC_BEGIN(CarneSpec)

describe(@"Carne", ^{
    __block Carne *carne;
    
    beforeEach(^{
        carne = [[Carne alloc] init];
    });
    
    it(@"is not nil", ^{
        [carne shouldNotBeNil];
    });
});

SPEC_END