#import "Kiwi.h"
#import "Cheddar.h"


SPEC_BEGIN(CheddarSpec)

describe(@"Cheddar", ^{
    __block Cheddar *queso;
    
    beforeEach(^{
        queso = [[Cheddar alloc] init];
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