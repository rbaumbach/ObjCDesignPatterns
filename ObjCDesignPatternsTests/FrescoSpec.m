#import "Kiwi.h"
#import "Fresco.h"


SPEC_BEGIN(FrescoSpec)

describe(@"Fresco", ^{
    __block Fresco *queso;
    
    beforeEach(^{
        queso = [[Fresco alloc] init];
    });
    
    it(@"is a subclass of queso", ^{
        BOOL isQueso = [queso isKindOfClass:[Queso class]];
        [[theValue(isQueso) should] beYes];
        
    });
    
    it(@"is not nil", ^{
        [queso shouldNotBeNil];
    });
});

SPEC_END