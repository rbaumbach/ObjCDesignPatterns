#import "Kiwi.h"
#import "Stout.h"


SPEC_BEGIN(StoutSpec)

describe(@"Stout", ^{
    __block Stout *stout;
    
    beforeEach(^{
        stout= [[Stout alloc] init];
    });
    
    it(@"is not nil", ^{
        [stout shouldNotBeNil];
    });
});

SPEC_END