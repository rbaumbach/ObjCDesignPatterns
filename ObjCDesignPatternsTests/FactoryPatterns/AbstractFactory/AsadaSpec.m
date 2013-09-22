#import "Kiwi.h"
#import "Asada.h"


SPEC_BEGIN(AsadaSpec)

describe(@"Asada", ^{
    __block Asada *asada;
    
    beforeEach(^{
        asada = [[Asada alloc] init];
    });
    
    it(@"is a subclass of beef", ^{
        [[asada should] beKindOfClass:[Beef class]];
    });
    
    it(@"is not nil", ^{
        [asada shouldNotBeNil];
    });
    
    it(@"is called 'Asada'", ^{
        [[asada.name should] equal:@"Asada"];
    });
});

SPEC_END