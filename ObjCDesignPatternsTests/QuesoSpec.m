#import "Kiwi.h"
#import "Queso.h"


SPEC_BEGIN(QuesoSpec)

describe(@"Queso", ^{
    __block Queso *queso;
    
    beforeEach(^{
        queso = [[Queso alloc] init];
    });
    
    it(@"is not nil", ^{
        [queso shouldNotBeNil];
    });
});

SPEC_END