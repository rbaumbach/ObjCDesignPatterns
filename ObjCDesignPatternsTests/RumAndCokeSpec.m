#import "Kiwi.h"
#import "RumAndCoke.h"


SPEC_BEGIN(RumAndCokeSpec)

describe(@"RumAndCoke", ^{
    __block RumAndCoke *rumAndCoke;
    
    beforeEach(^{
        rumAndCoke = [[RumAndCoke alloc] init];
    });
    
    it(@"is not nil", ^{
        [rumAndCoke shouldNotBeNil];
    });
});

SPEC_END