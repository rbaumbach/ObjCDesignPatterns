#import "Kiwi.h"
#import "Ale.h"


SPEC_BEGIN(AleSpec)

describe(@"Ale", ^{
    __block Ale *ale;
    
    beforeEach(^{
        ale = [[Ale alloc] init];
    });
    
    it(@"is not nil", ^{
        [ale shouldNotBeNil];
    });
});

SPEC_END