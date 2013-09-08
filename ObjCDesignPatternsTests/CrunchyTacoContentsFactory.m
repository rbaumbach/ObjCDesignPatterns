#import "Kiwi.h"
#import "TacoContentsFactory.h"
#import "CrunchyTacoContentsFactory.h"
#import "Maiz.h"
#import "Molida.h"
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
        
        it(@"creates carne molida", ^{
            BOOL isMolida = [carne isKindOfClass:[Molida class]];
            [[theValue(isMolida) should] beYes];
        });
    });
    
    context(@"#createQueso", ^{
        __block Queso *queso;
        
        beforeEach(^{
            queso = [tacoFactory createQueso];
        });
        
        it(@"creates queso cheddar", ^{
            BOOL isCheddar = [queso isKindOfClass:[Cheddar class]];
            [[theValue(isCheddar) should] beYes];
        });
    });
    
    context(@"#createSalsa", ^{
        __block Salsa *salsa;
        
        beforeEach(^{
            salsa = [tacoFactory createSalsa];
        });
        
        it(@"creates salsa mild", ^{
            BOOL isMild = [salsa isKindOfClass:[Mild class]];
            [[theValue(isMild) should] beYes];
        });
    });
    
    context(@"#createVeduras", ^{
        __block NSArray *veduras;
        
        beforeEach(^{
            veduras = [tacoFactory createVeduras];
        });
        
        it(@"has cebollas, tomates and lechuga", ^{
            BOOL hasCebollas = [veduras[0] isKindOfClass:[Cebolla class]];
            BOOL hasTomates = [veduras[1] isKindOfClass:[Tomate class]];
            BOOL hasLechuga = [veduras[2] isKindOfClass:[Lechuga class]];
            [[theValue(hasCebollas) should] beYes];
            [[theValue(hasTomates) should] beYes];
            [[theValue(hasLechuga) should] beYes];
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