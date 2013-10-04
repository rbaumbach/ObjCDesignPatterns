#import "Kiwi.h"
#import "Gardener.h"


SPEC_BEGIN(GardenerSpec)

describe(@"Gardener", ^{
    __block Gardener *gardener;
    
    beforeEach(^{
        gardener = [[Gardener alloc] init];
    });
    
    it(@"is not nil", ^{
        [gardener shouldNotBeNil];
    });
    
    context(@"#plantRoses", ^{
        __block NSString *plantedRoses;
        
        beforeEach(^{
            plantedRoses = [gardener plantRoses];
        });
        
        it(@"returns 'Gardener planted roses!'", ^{
            [[plantedRoses should] equal:@"Gardener planted roses!"];
        });
    });
    
    context(@"#trimBushes", ^{
        __block NSString *trimmedBuses;
        
        beforeEach(^{
            trimmedBuses = [gardener trimBushes];
        });
        
        it(@"returns 'Gardener trimmed bushes!'", ^{
            [[trimmedBuses should] equal:@"Gardener trimmed bushes!"];
        });
    });
});

SPEC_END