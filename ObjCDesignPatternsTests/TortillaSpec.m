#import "Kiwi.h"
#import "Tortilla.h"


SPEC_BEGIN(TortillaSpec)

describe(@"Tortilla", ^{
    __block Tortilla *tortilla;
    
    beforeEach(^{
        tortilla = [[Tortilla alloc] init];
    });
    
    it(@"is not nil", ^{
        [tortilla shouldNotBeNil];
    });
});

SPEC_END