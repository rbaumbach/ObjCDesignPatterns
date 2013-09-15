#import "Kiwi.h"
#import "Fresco.h"


SPEC_BEGIN(FrescoSpec)

describe(@"Fresco", ^{
    __block Fresco *queso;
    
    beforeEach(^{
        queso = [[Fresco alloc] init];
    });
    
    it(@"is a subclass of queso", ^{
        [[queso should] beKindOfClass:[Queso class]];
    });
    
    it(@"is not nil", ^{
        [queso shouldNotBeNil];
    });
});

SPEC_END