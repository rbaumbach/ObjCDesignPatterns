#import "Kiwi.h"
#import "Rat.h"
#import "SneakyRat.h"


SPEC_BEGIN(SneakyRatSpec)

describe(@"SneakyRat", ^{
    __block SneakyRat *sneakyRat;
    
    beforeEach(^{
        sneakyRat = [[SneakyRat alloc] init];
    });
    
    it(@"conforms to <Duck>", ^{
        BOOL conformsToProtocol = [SneakyRat conformsToProtocol:@protocol(Rat)];
        [[theValue(conformsToProtocol) should] beYes];
    });
    
    context(@"<Rat>", ^{
        context(@"squeak", ^{
            it(@"returns 'Squeak Squeak!!!'", ^{
                NSString *squeak = [sneakyRat squeak];
                [[squeak should] equal:@"Squeak Squeak!!!"];
            });
        });
        
        context(@"runAround", ^{
            it(@"returns 'Run around really fast...'", ^{
                NSString *runAround = [sneakyRat runAround];
                [[runAround should] equal:@"Run around really fast..."];
            });
        });
        
        context(@"swim", ^{
            it(@"returns 'Splash, rat paddle...'", ^{
                NSString *swim = [sneakyRat swim];
                [[swim should] equal:@"Splash, rat paddle..."];
            });
        });
        
        context(@"fly", ^{
            it(@"returns 'Equips high powered super technological advanced wings and soars through the sky...'", ^{
                NSString *fly = [sneakyRat flyWithSuperFlightSuit];
                [[fly should] equal:@"Equips high powered super technological advanced wings and soars through the sky..."];
            });
        });
    });
});

SPEC_END