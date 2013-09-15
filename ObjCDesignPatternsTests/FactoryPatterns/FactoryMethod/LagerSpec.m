#import "Kiwi.h"
#import "Lager.h"


SPEC_BEGIN(LagerSpec)

describe(@"Lager", ^{
    __block Lager *lager;
    
    beforeEach(^{
        lager = [[Lager alloc] init];
    });
    
    it(@"is not nil", ^{
        [lager shouldNotBeNil];
    });
});

SPEC_END