#import "Kiwi.h"
#import "TacoStore.h"
#import "Taco.h"


@interface TacoStore ()

- (Taco *)createTaco:(NSString *)tacoType;

@end


SPEC_BEGIN(TacoStoreSpec)

describe(@"TacoStore", ^{
    __block TacoStore *tacoStore;
    
    beforeEach(^{
        tacoStore = [[TacoStore alloc] init];
    });
    
    context(@"#orderTaco:", ^{
        __block Taco *fakeTaco;
        __block Taco *returnTaco;
        
        beforeEach(^{
            fakeTaco = [Taco mock];
            [[tacoStore should] receive:@selector(createTaco:)
                              andReturn:fakeTaco
                          withArguments:@"IReturnTaco"];
            
            [[fakeTaco should] receive:@selector(prepare)];
            [[fakeTaco should] receive:@selector(loadUpIngredients)];
            [[fakeTaco should] receive:@selector(wrap)];
            
            returnTaco = [tacoStore orderTaco:@"IReturnTaco"];
        });
        
        it(@"returns a taco", ^{
            [[returnTaco should] equal:fakeTaco];
        });
    });
    
    context(@"#createTaco:", ^{
        __block Taco *taco;
        
        beforeEach(^{
            taco = [tacoStore createTaco:@"IReturnTaco"];
        });
        
        it(@"is a taco type", ^{
            [[taco should] beKindOfClass:[Taco class]];
        });
    });
});

SPEC_END