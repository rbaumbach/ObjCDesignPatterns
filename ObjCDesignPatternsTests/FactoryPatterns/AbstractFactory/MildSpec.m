#import "Kiwi.h"
#import "Mild.h"


SPEC_BEGIN(MildSpec)

describe(@"Mild", ^{
    __block Mild *mild;
    
    beforeEach(^{
        mild = [[Mild alloc] init];
    });
    
    it(@"is a subclass of salsa", ^{
        [[mild should] beKindOfClass:[Salsa class]];
    });
    
    it(@"is not nil", ^{
        [mild shouldNotBeNil];
    });
    
    it(@"is called 'Mild'", ^{
        mild.name = @"Mild";
    });
});

SPEC_END