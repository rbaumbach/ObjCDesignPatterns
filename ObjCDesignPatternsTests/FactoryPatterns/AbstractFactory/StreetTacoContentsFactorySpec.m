#import "Kiwi.h"
#import "StreetTacoContentsFactory.h"
#import "Maiz.h"
#import "Asada.h"
#import "Carnitas.h"
#import "Fresco.h"
#import "Picante.h"
#import "Cebolla.h"
#import "Cilantro.h"
#import "Crema.h"
#import "Guacamole.h"


SPEC_BEGIN(StreetTacoContentsFactorySpec)

describe(@"StreetTacoContentsFactory", ^{
    __block StreetTacoContentsFactory *tacoFactory;
    
    beforeEach(^{
        tacoFactory = [[StreetTacoContentsFactory alloc] init];
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
    
    context(@"#createBeef:", ^{
        __block Beef *beef;
        
        beforeEach(^{
            beef = [tacoFactory createBeef];
        });
        
        it(@"creates carne asada", ^{
            [[beef should] beKindOfClass:[Asada class]];
        });
    });
    
    context(@"createPork", ^{
        __block Pork *pork;
        
        beforeEach(^{
            pork = [tacoFactory createPork];
        });
        
        it(@"creates carnitas", ^{
            [[pork should] beKindOfClass:[Carnitas class]];
        });
    });
    
    context(@"#createQueso", ^{
        __block Queso *queso;
        
        beforeEach(^{
            queso = [tacoFactory createQueso];
        });
        
        it(@"creates queso fresco", ^{
            [[queso should] beKindOfClass:[Fresco class]];
        });
    });
    
    context(@"#createSalsa", ^{
        __block Salsa *salsa;
        
        beforeEach(^{
            salsa = [tacoFactory createSalsa];
        });
        
        it(@"creates salsa picante", ^{
            [[salsa should] beKindOfClass:[Picante class]];
        });
    });
    
    context(@"#createVeduras", ^{
        __block NSArray *veduras;
        
        beforeEach(^{
            veduras = [tacoFactory createVeduras];
        });
        
        it(@"has cebollas and cilantro", ^{
            [[veduras[0] should] beKindOfClass:[Cebolla class]];
            [[veduras[1] should] beKindOfClass:[Cilantro class]];
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