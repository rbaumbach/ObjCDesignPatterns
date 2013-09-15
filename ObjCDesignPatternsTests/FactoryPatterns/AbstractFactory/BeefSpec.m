#import "Kiwi.h"
#import "Beef.h"


SPEC_BEGIN(BeefSpec)

describe(@"Beef", ^{
    __block Beef *beef;
    
    beforeEach(^{
        beef = [[Beef alloc] init];
    });
    
    it(@"is not nil", ^{
        [beef shouldNotBeNil];
    });
});

SPEC_END