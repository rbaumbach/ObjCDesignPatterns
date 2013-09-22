#import "Kiwi.h"
#import "Crema.h"


SPEC_BEGIN(CremaSpec)

describe(@"Crema", ^{
    __block Crema *crema;
    
    beforeEach(^{
        crema = [[Crema alloc] init];
    });
    
    it(@"is a subclass of extra", ^{
        [[crema should] beKindOfClass:[Crema class]];
    });
    
    it(@"is crema nil", ^{
        [crema shouldNotBeNil];
    });
    
    it(@"is called 'Crema'", ^{
        [[crema.name should] equal:@"Crema"];
    });
});

SPEC_END