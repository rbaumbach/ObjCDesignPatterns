#import "Kiwi.h"
#import "ChileVerde.h"


SPEC_BEGIN(ChileVerdeSpec)

describe(@"ChileVerde", ^{
    __block ChileVerde *chileVerde;
    
    beforeEach(^{
        chileVerde = [[ChileVerde alloc] init];
    });
    
    it(@"is a subclass of pork", ^{
        [[chileVerde should] beKindOfClass:[Pork class]];
    });
    
    it(@"is not nil", ^{
        [chileVerde shouldNotBeNil];
    });
    
    it(@"is called 'Chile Verde'", ^{
        [[chileVerde.name should] equal:@"Chile Verde"];
    });
});

SPEC_END