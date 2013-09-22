#import "Kiwi.h"
#import "Lechuga.h"


SPEC_BEGIN(LechugaSpec)

describe(@"Lechuga", ^{
    __block Lechuga *lechuga;
    
    beforeEach(^{
        lechuga = [[Lechuga alloc] init];
    });
    
    it(@"is a subclass of vedura", ^{
        [[lechuga should] beKindOfClass:[Lechuga class]];
    });
    
    it(@"is not nil", ^{
        [lechuga shouldNotBeNil];
    });
    
    it(@"is called 'Lechuga'", ^{
        lechuga.name = @"Lechuga";
    });
});

SPEC_END