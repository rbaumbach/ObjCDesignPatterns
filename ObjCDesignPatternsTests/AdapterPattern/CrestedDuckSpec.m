#import "Kiwi.h"
#import "Duck.h"
#import "CrestedDuck.h"


SPEC_BEGIN(CrestedDuckSpec)

describe(@"CrestedDuck", ^{
    __block CrestedDuck *crestedDuck;
    
    beforeEach(^{
        crestedDuck = [[CrestedDuck alloc] init];
    });
    
    it(@"conforms to <Duck>", ^{
        BOOL conformsToProtocol = [crestedDuck conformsToProtocol:@protocol(Duck)];
        [[theValue(conformsToProtocol) should] beYes];
    });
    
    context(@"<Duck>", ^{
        context(@"quack", ^{
            it(@"returns 'Quack Quack!!!'", ^{
                NSString *quack = [crestedDuck quack];
                [[quack should] equal:@"Quack Quack!!!"];
            });
        });
        
        context(@"walk", ^{
            it(@"returns 'Waddle...Waddle...'", ^{
                NSString *walk = [crestedDuck walk];
                [[walk should] equal:@"Waddle...Waddle..."];
            });
        });
        
        context(@"swim", ^{
            it(@"returns 'Float, splash, paddle with webbed feet...'", ^{
                NSString *swim = [crestedDuck swim];
                [[swim should] equal:@"Float, splash, paddle with webbed feet..."];
            });
        });
        
        context(@"fly", ^{
            it(@"returns 'Flying high gracefully...'", ^{
                NSString *fly = [crestedDuck fly];
                [[fly should] equal:@"Flying high gracefully..."];
            });
        });
    });
});

SPEC_END