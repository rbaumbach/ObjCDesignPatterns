#import "Kiwi.h"
#import "Cebolla.h"


SPEC_BEGIN(CebollaSpec)

describe(@"Cebolla", ^{
    __block Cebolla *cebolla;
    
    beforeEach(^{
        cebolla = [[Cebolla alloc] init];
    });
    
    it(@"is a subclass of vedura", ^{
        [[cebolla should] beKindOfClass:[Vedura class]];
    });
    
    it(@"is not nil", ^{
        [cebolla shouldNotBeNil];
    });
    
    it(@"is called 'Cebolla'", ^{
        [[cebolla.name should] equal:@"Cebolla"];
    });
});

SPEC_END