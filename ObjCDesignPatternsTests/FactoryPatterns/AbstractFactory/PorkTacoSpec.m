#import "Kiwi.h"
#import "PorkTaco.h"
#import "TacoContentsFactory.h"
#import "Tortilla.h"
#import "Pork.h"
#import "Queso.h"
#import "Salsa.h"


@interface PorkTaco ()

@property (strong, nonatomic) id<TacoContentsFactory> tacoContentsFactory;

- (void)prepare;

@end


SPEC_BEGIN(PorkTacoSpec)

describe(@"PorkTaco", ^{
    __block PorkTaco *taco;
    __block id<TacoContentsFactory> fakeTacoContentsFactory;
    
    beforeEach(^{
        fakeTacoContentsFactory = [KWMock mockForProtocol:@protocol(TacoContentsFactory)];
        taco = [[PorkTaco alloc] initWithTacoContentsFactory:fakeTacoContentsFactory];
    });
    
    it(@"is a subclass of taco", ^{
        [[taco should] beKindOfClass:[Taco class]];
    });
    
    it(@"is called 'Pork Taco'", ^{
        [[taco.name should] equal:@"Pork Taco"];
    });
    
    it(@"has TacoContentsFactory", ^{
        [[(NSObject *)taco.tacoContentsFactory should] equal:fakeTacoContentsFactory];
    });
    
    context(@"#prepare", ^{
        it(@"prepares taco", ^{
            [[(NSObject *)fakeTacoContentsFactory should] receive:@selector(createTortilla)];
            [[(NSObject *)fakeTacoContentsFactory should] receive:@selector(createPork)];
            [[(NSObject *)fakeTacoContentsFactory should] receive:@selector(createQueso)];
            [[(NSObject *)fakeTacoContentsFactory should] receive:@selector(createSalsa)];
            [[(NSObject *)fakeTacoContentsFactory should] receive:@selector(createVeduras)];
            [[(NSObject *)fakeTacoContentsFactory should] receive:@selector(createExtras)];
            [taco prepare];
        });
    });
});

SPEC_END