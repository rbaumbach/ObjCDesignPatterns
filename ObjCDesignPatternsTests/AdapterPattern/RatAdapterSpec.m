#import "Kiwi.h"
#import "Duck.h"
#import "Rat.h"
#import "RatAdapter.h"


@interface RatAdapter ()

@property (strong, nonatomic) id<Rat> rat;

@end

SPEC_BEGIN(RatAdapterSpec)

describe(@"RatAdapter", ^{
    __block RatAdapter *adapter;
    __block id<Rat> fakeRat;
    
    beforeEach(^{
        fakeRat = [KWMock mockForProtocol:@protocol(Rat)];
        adapter = [[RatAdapter alloc] initWithRat:fakeRat];
    });
    
    it(@"conforms to <Duck>", ^{
        BOOL conformsToProtocol = [RatAdapter conformsToProtocol:@protocol(Duck)];
        [[theValue(conformsToProtocol) should] beYes];
    });
    
    it(@"has a rat", ^{
        [[(NSObject *)adapter.rat should] equal:fakeRat];
    });
    
    context(@"<Duck>", ^{
        context(@"quack", ^{
            it(@"calls squeak on rat", ^{
                [[(NSObject *)adapter.rat should] receive:@selector(squeak) andReturn:@"squeak"];
                NSString *squeak = [adapter quack];
                [[squeak should] equal:@"squeak"];
            });
        });
        
        context(@"walk", ^{
            it(@"calls runAround on rat", ^{
                [[(NSObject *)adapter.rat should] receive:@selector(runAround) andReturn:@"runAround"];
                NSString *runAround = [adapter walk];
                [[runAround should] equal:@"runAround"];
            });
        });
        
        context(@"swim", ^{
            it(@"calls swim on rat", ^{
                [[(NSObject *)adapter.rat should] receive:@selector(swim) andReturn:@"swim"];
                NSString *swim = [adapter swim];
                [[swim should] equal:@"swim"];
            });
        });
        
        context(@"fly", ^{
            it(@"calls swim on rat", ^{
                [[(NSObject *)adapter.rat should] receive:@selector(flyWithSuperFlightSuit) andReturn:@"flyWithSuperFlightSuit"];
                NSString *fly = [adapter fly];
                [[fly should] equal:@"flyWithSuperFlightSuit"];
            });
        });
    });
});

SPEC_END