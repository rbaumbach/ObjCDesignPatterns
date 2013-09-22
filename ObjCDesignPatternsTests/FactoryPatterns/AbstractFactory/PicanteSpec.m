#import "Kiwi.h"
#import "Picante.h"


SPEC_BEGIN(PicanteSpec)

describe(@"Picante", ^{
    __block Picante *picante;
    
    beforeEach(^{
        picante = [[Picante alloc] init];
    });
    
    it(@"is a subclass of salsa", ^{
        [[picante should] beKindOfClass:[Salsa class]];
    });
    
    it(@"is not nil", ^{
        [picante shouldNotBeNil];
    });
    
    it(@"is called 'Picante'", ^{
        [[picante.name should] equal:@"Picante"];
    });
});

SPEC_END