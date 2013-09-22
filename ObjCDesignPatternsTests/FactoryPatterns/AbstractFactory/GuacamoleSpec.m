#import "Kiwi.h"
#import "Guacamole.h"


SPEC_BEGIN(GuacamoleSpec)

describe(@"Guacamole", ^{
    __block Guacamole *guacamole;
    
    beforeEach(^{
        guacamole = [[Guacamole alloc] init];
    });
    
    it(@"is a subclass of extra", ^{
        [[guacamole should] beKindOfClass:[Guacamole class]];
    });
    
    it(@"is not nil", ^{
        [guacamole shouldNotBeNil];
    });
    
    it(@"is called 'Guacamole'", ^{
        [[guacamole.name should] equal:@"Guacamole"];
    });
});

SPEC_END