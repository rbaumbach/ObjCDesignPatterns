#import "Kiwi.h"
#import "StreetTacoStore.h"
#import "Taco.h"
#import "TacoContentsFactory.h"
#import "BeefTaco.h"
#import "PorkTaco.h"


@interface StreetTacoStore ()

@property (strong, nonatomic) id<TacoContentsFactory> tacoContentsFactory;

- (Taco *)createTaco:(NSString *)tacoType;

@end

@interface BeefTaco ()

@property (strong, nonatomic) id<TacoContentsFactory> tacoContentsFactory;

@end

@interface PorkTaco ()

@property (strong, nonatomic) id<TacoContentsFactory> tacoContentsFactory;

@end


SPEC_BEGIN(StreetTacoStoreSpec)

describe(@"StreetTacoStore", ^{
    __block StreetTacoStore *tacoStore;
    __block id<TacoContentsFactory> fakeTacoContentsFactory;
    
    beforeEach(^{
        fakeTacoContentsFactory = [KWMock mockForProtocol:@protocol(TacoContentsFactory)];
        tacoStore = [[StreetTacoStore alloc] init];
        tacoStore.tacoContentsFactory = fakeTacoContentsFactory;
    });
    
    it(@"is a subclass of TacoStore", ^{
        [[tacoStore should] beKindOfClass:[TacoStore class]];
    });
    
    it(@"has a TacoContentsFactory", ^{
        [[(NSObject *)tacoStore.tacoContentsFactory should] equal:fakeTacoContentsFactory];
    });
    
    context(@"#createTaco:", ^{
        context(@"BeefTaco", ^{
            __block Taco *taco;
            
            beforeEach(^{
                taco = [tacoStore createTaco:@"BeefTaco"];
            });
            
            it(@"creates a beef taco", ^{
                [[taco should] beKindOfClass:[BeefTaco class]];
                BeefTaco *beefTaco = (BeefTaco *)taco;
                [(NSObject *)beefTaco.tacoContentsFactory shouldNotBeNil];
                
            });
        });
        
        context(@"PorkTaco", ^{
            __block Taco *taco;
            
            beforeEach(^{
                taco = [tacoStore createTaco:@"PorkTaco"];
            });
            
            it(@"creates a pork taco", ^{
                [[taco should] beKindOfClass:[PorkTaco class]];
                PorkTaco *porkTaco = (PorkTaco *)taco;
                [(NSObject *)porkTaco.tacoContentsFactory shouldNotBeNil];
                
            });
        });
    });
});

SPEC_END