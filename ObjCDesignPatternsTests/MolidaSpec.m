#import "Kiwi.h"
#import "Molida.h"


SPEC_BEGIN(MolidaSpec)

describe(@"Molida", ^{
    __block Molida *molida;
    
    beforeEach(^{
        molida = [[Molida alloc] init];
    });
    
    it(@"is a subclass of beef", ^{
        [[molida should] beKindOfClass:[Beef class]];
    });
    
    it(@"is not nil", ^{
        [molida shouldNotBeNil];
    });
});

SPEC_END