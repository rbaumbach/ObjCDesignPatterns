#import "Kiwi.h"
#import "Mild.h"


SPEC_BEGIN(MildSpec)

describe(@"Mild", ^{
    __block Mild *salsa;
    
    beforeEach(^{
        salsa = [[Mild alloc] init];
    });
    
    it(@"is a subclass of salsa", ^{
        [[salsa should] beKindOfClass:[Salsa class]];
    });
    
    it(@"is not nil", ^{
        [salsa shouldNotBeNil];
    });
});

SPEC_END