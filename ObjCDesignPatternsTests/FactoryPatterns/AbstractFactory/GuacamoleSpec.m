#import "Kiwi.h"
#import "Guacamole.h"


SPEC_BEGIN(GuacamoleSpec)

describe(@"Guacamole", ^{
    __block Guacamole *extra;
    
    beforeEach(^{
        extra = [[Guacamole alloc] init];
    });
    
    it(@"is a subclass of extra", ^{
        [[extra should] beKindOfClass:[Guacamole class]];
    });
    
    it(@"is not nil", ^{
        [extra shouldNotBeNil];
    });
});

SPEC_END