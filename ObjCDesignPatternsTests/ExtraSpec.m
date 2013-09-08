#import "Kiwi.h"
#import "Extra.h"


SPEC_BEGIN(ExtraSpec)

describe(@"Extra", ^{
    __block Extra *extra;
    
    beforeEach(^{
        extra = [[Extra alloc] init];
    });
    
    it(@"is not nil", ^{
        [extra shouldNotBeNil];
    });
});

SPEC_END