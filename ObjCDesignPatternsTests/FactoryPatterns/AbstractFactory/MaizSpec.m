#import "Kiwi.h"
#import "Maiz.h"


SPEC_BEGIN(MaizSpec)

describe(@"Maiz", ^{
    __block Maiz *maiz;
    
    beforeEach(^{
        maiz = [[Maiz alloc] init];
    });
    
    it(@"is a subclass of tortilla", ^{
        [[maiz should] beKindOfClass:[Tortilla class]];
    });
    
    it(@"is not nil", ^{
        [maiz shouldNotBeNil];
    });
    
    it(@"is called 'Maiz'", ^{
        maiz.name = @"Maiz";
    });
});

SPEC_END