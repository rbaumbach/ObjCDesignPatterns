#import "Kiwi.h"
#import "Exterminator.h"


SPEC_BEGIN(ExterminatorSpec)

describe(@"Exterminator", ^{
    __block Exterminator *exterminator;
    
    beforeEach(^{
        exterminator = [[Exterminator alloc] init];
    });
    
    it(@"is not nil", ^{
        [exterminator shouldNotBeNil];
    });
    
    context(@"#killRoaches", ^{
        __block NSString *killedRoaches;
        
        beforeEach(^{
            killedRoaches = [exterminator killRoaches];
        });
        
        it(@"returns 'Exterminator killed roaches!'", ^{
            [[killedRoaches should] equal:@"Exterminator killed roaches!"];
        });
    });
    
    context(@"#captureRats", ^{
        __block NSString *capturedRats;
        
        beforeEach(^{
            capturedRats = [exterminator captureRats];
        });
        
        it(@"returns 'Exterminator captured rats!'", ^{
            [[capturedRats should] equal:@"Exterminator captured rats!"];
        });
    });
});

SPEC_END