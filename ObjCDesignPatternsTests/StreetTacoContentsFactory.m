#import "Kiwi.h"
#import "StreetTacoContentsFactory.h"
#import "Maiz.h"
#import "Asada.h"
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
        BOOL conformsToProtocol = [tacoFactory conformsToProtocol:@protocol(TacoContentsFactory)];
        [[theValue(conformsToProtocol) should] beYes];
    });
    
    context(@"#createTortilla", ^{
        __block Tortilla *tortilla;
        
        beforeEach(^{
            tortilla = [tacoFactory createTortilla];
        });
        
        it(@"creates maiz tortilla", ^{
            BOOL isMaiz = [tortilla isKindOfClass:[Maiz class]];
            [[theValue(isMaiz) should] beYes];
        });
    });
    
    context(@"#createCarne", ^{
        __block Carne *carne;
        
        beforeEach(^{
            carne = [tacoFactory createCarne];
        });
        
        it(@"creates carne asada", ^{
            BOOL isAsada = [carne isKindOfClass:[Asada class]];
            [[theValue(isAsada) should] beYes];
        });
    });
    
    context(@"#createQueso", ^{
        __block Queso *queso;
        
        beforeEach(^{
            queso = [tacoFactory createQueso];
        });
        
        it(@"creates queso fresco", ^{
            BOOL isFresco = [queso isKindOfClass:[Fresco class]];
            [[theValue(isFresco) should] beYes];
        });
    });
    
    context(@"#createSalsa", ^{
        __block Salsa *salsa;
        
        beforeEach(^{
            salsa = [tacoFactory createSalsa];
        });
        
        it(@"creates salsa picante", ^{
            BOOL isPicante = [salsa isKindOfClass:[Picante class]];
            [[theValue(isPicante) should] beYes];
        });
    });
    
    context(@"#createVeduras", ^{
        __block NSArray *veduras;
        
        beforeEach(^{
            veduras = [tacoFactory createVeduras];
        });
        
        it(@"has cebollas and cilantro", ^{
            BOOL hasCebollas = [veduras[0] isKindOfClass:[Cebolla class]];
            BOOL hasCilantro = [veduras[1] isKindOfClass:[Cilantro class]];
            [[theValue(hasCebollas) should] beYes];
            [[theValue(hasCilantro) should] beYes];
        });
    });
    
    context(@"#createExtras", ^{
        __block NSArray *extras;
        
        beforeEach(^{
            extras = [tacoFactory createExtras];
        });
        
        it(@"has crema and guacamole", ^{
            BOOL hasCreama = [extras[0] isKindOfClass:[Crema class]];
            BOOL hasGuacamole = [extras[1] isKindOfClass:[Guacamole class]];
            [[theValue(hasCreama) should] beYes];
            [[theValue(hasGuacamole) should] beYes];
        });
    });
});

SPEC_END