#import "Kiwi.h"
#import "Tortilla.h"


SPEC_BEGIN(TortillaSpec)

describe(@"Tortilla", ^{
    __block Tortilla *tortilla;
    
    beforeEach(^{
        tortilla = [[Tortilla alloc] init];
        tortilla.name = @"Mexican Fruit Roll-up";
    });
    
    it(@"is not nil", ^{
        [tortilla shouldNotBeNil];
    });
    
    it(@"has a name property", ^{
        tortilla.name = @"Mexican Fruit Roll-up";
    });
});

SPEC_END