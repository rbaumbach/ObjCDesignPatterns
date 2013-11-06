#import "Kiwi.h"
#import "Duck.h"
#import "SneakyRat.h"


SPEC_BEGIN(SneakyRatSpec)

describe(@"SneakyRat", ^{
    __block SneakyRat *sneakyRat;
    
    beforeEach(^{
        sneakyRat = [[SneakyRat alloc] init];
    });
    
    it(@"conforms to <Duck>", ^{
        BOOL conformsToProtocol = [SneakyRat conformsToProtocol:@protocol(Duck)];
        [[theValue(conformsToProtocol) should] beYes];
    });
    
    context(@"<Duck>", ^{
        context(@"quack", ^{
            it(@"returns 'Quack Quack!!! (Uses duck call)'", ^{
                NSString *quack = [sneakyRat quack];
                [[quack should] equal:@"Quack Quack!!! (Uses duck call)"];
            });
        });
        
        context(@"walk", ^{
            it(@"returns 'Waddle...Waddle...(Uses swim flippers)'", ^{
                NSString *walk = [sneakyRat walk];
                [[walk should] equal:@"Waddle...Waddle...(Uses swim flippers)"];
            });
        });
        
        context(@"swim", ^{
            it(@"returns 'Float, splash, paddle with webbed feet...(Uses waterproof duck suit and swim flippers)'", ^{
                NSString *swim = [sneakyRat swim];
                [[swim should] equal:@"Float, splash, paddle with webbed feet...(Uses waterproof duck suit and swim flippers)"];
            });
        });
        
        context(@"fly", ^{
            it(@"returns 'Flying high gracefully...(Uses high powered super technological advanced wings)'", ^{
                NSString *fly = [sneakyRat fly];
                [[fly should] equal:@"Flying high gracefully...(Uses high powered super technological advanced wings)"];
            });
        });
    });
});

SPEC_END