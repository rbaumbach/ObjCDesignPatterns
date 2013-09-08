#import "Kiwi.h"
#import "Maiz.h"


SPEC_BEGIN(MaizSpec)

describe(@"Maiz", ^{
    __block Maiz *tortilla;
    
    beforeEach(^{
        tortilla = [[Maiz alloc] init];
    });
    
    it(@"is a subclass of tortilla", ^{
        BOOL isTortilla = [tortilla isKindOfClass:[Tortilla class]];
        [[theValue(isTortilla) should] beYes];
        
    });
    
    it(@"is not nil", ^{
        [tortilla shouldNotBeNil];
    });
});

SPEC_END