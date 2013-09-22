#import "Kiwi.h"
#import "Fresco.h"


SPEC_BEGIN(FrescoSpec)

describe(@"Fresco", ^{
    __block Fresco *fresco;
    
    beforeEach(^{
        fresco = [[Fresco alloc] init];
    });
    
    it(@"is a subclass of queso", ^{
        [[fresco should] beKindOfClass:[Queso class]];
    });
    
    it(@"is not nil", ^{
        [fresco shouldNotBeNil];
    });
    
    it(@"is called 'Fresco'", ^{
        [[fresco.name should] equal:@"Fresco"];
    });
});

SPEC_END