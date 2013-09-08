#import "Kiwi.h"
#import "Crema.h"


SPEC_BEGIN(CremaSpec)

describe(@"Crema", ^{
    __block Crema *extra;
    
    beforeEach(^{
        extra = [[Crema alloc] init];
    });
    
    it(@"is a subclass of extra", ^{
        BOOL isExtra = [extra isKindOfClass:[Extra class]];
        [[theValue(isExtra) should] beYes];
        
    });
    
    it(@"is not nil", ^{
        [extra shouldNotBeNil];
    });
});

SPEC_END