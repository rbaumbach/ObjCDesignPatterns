#import "Kiwi.h"
#import "Molida.h"


SPEC_BEGIN(MolidaSpec)

describe(@"Molida", ^{
    __block Molida *carne;
    
    beforeEach(^{
        carne = [[Molida alloc] init];
    });
    
    it(@"is a subclass of carne", ^{
        [[carne should] beKindOfClass:[Carne class]];
    });
    
    it(@"is not nil", ^{
        [carne shouldNotBeNil];
    });
});

SPEC_END