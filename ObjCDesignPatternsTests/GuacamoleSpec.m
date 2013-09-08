#import "Kiwi.h"
#import "Guacamole.h"


SPEC_BEGIN(GuacamoleSpec)

describe(@"Guacamole", ^{
    __block Guacamole *extra;
    
    beforeEach(^{
        extra = [[Guacamole alloc] init];
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