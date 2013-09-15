#import "Kiwi.h"
#import "TacoContentsFactory.h"
#import "CrunchyTacoContentsFactory.h"
#import "Maiz.h"
#import "Molida.h"
#import "ChileVerde.h"
#import "Cheddar.h"
#import "Mild.h"
#import "Cebolla.h"
#import "Tomate.h"
#import "Lechuga.h"
#import "Crema.h"
#import "Guacamole.h"


SPEC_BEGIN(CrunchyTacoContentsFactorySpec)

describe(@"CrunchyTacoContentsFactory", ^{
    __block CrunchyTacoContentsFactory *tacoFactory;
    
    beforeEach(^{
        tacoFactory = [[CrunchyTacoContentsFactory alloc] init];
    });
    
    it(@"conforms to TacoContentsFactory protocol", ^{
        [[tacoFactory should] conformToProtocol:@protocol(TacoContentsFactory)];
    });
    
    context(@"#createTortilla", ^{
        __block Tortilla *tortilla;
        
        beforeEach(^{
            tortilla = [tacoFactory createTortilla];
        });
        
        it(@"creates maiz tortilla", ^{
            [[tortilla should] beKindOfClass:[Maiz class]];
        });
    });
    
    context(@"#createBeef", ^{
        __block Beef *beef;
        
        beforeEach(^{
            beef = [tacoFactory createBeef];
        });
        
        it(@"creates carne molida", ^{
            [[beef should] beKindOfClass:[Molida class]];
        });
    });
    
    context(@"#createPork", ^{
        __block Pork *pork;
        
        beforeEach(^{
            pork = [tacoFactory createPork];
        });
        
        it(@"creates chile verde", ^{
            [[pork should] beKindOfClass:[ChileVerde class]];
        });
    });
    
    context(@"#createQueso", ^{
        __block Queso *queso;
        
        beforeEach(^{
            queso = [tacoFactory createQueso];
        });
        
        it(@"creates queso cheddar", ^{
            [[queso should] beKindOfClass:[Cheddar class]];
        });
    });
    
    context(@"#createSalsa", ^{
        __block Salsa *salsa;
        
        beforeEach(^{
            salsa = [tacoFactory createSalsa];
        });
        
        it(@"creates salsa mild", ^{
            [[salsa should] beKindOfClass:[Mild class]];
        });
    });
    
    context(@"#createVeduras", ^{
        __block NSArray *veduras;
        
        beforeEach(^{
            veduras = [tacoFactory createVeduras];
        });
        
        it(@"has cebollas, tomates and lechuga", ^{
            [[veduras[0] should] beKindOfClass:[Cebolla class]];
            [[veduras[1] should] beKindOfClass:[Tomate class]];
            [[veduras[2] should] beKindOfClass:[Lechuga class]];
        });
    });
    
    context(@"#createExtras", ^{
        __block NSArray *extras;
        
        beforeEach(^{
            extras = [tacoFactory createExtras];
        });
        
        it(@"has crema and guacamole", ^{
            [[extras[0] should] beKindOfClass:[Crema class]];
            [[extras[1] should] beKindOfClass:[Guacamole class]];
        });
    });
});

SPEC_END