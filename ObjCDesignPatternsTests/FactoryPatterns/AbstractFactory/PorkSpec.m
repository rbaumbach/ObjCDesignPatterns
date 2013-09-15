#import "Kiwi.h"
#import "Pork.h"


SPEC_BEGIN(PorkSpec)

describe(@"Pork", ^{
    __block Pork *pork;
    
    beforeEach(^{
        pork = [[Pork alloc] init];
    });
    
    it(@"is not nil", ^{
        [pork shouldNotBeNil];
    });
});

SPEC_END