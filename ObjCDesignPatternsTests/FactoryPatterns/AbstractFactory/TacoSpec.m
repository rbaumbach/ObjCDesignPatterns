#import "Kiwi.h"
#import "Taco.h"
#import "Tortilla.h"
#import "Beef.h"
#import "Queso.h"
#import "Salsa.h"


SPEC_BEGIN(TacoSpec)

describe(@"Taco", ^{
    __block Taco *taco;
    __block Tortilla *fakeTortilla;
    __block Beef *fakeBeef;
    __block Queso *fakeQueso;
    __block Salsa *fakeSalsa;
    __block NSArray *fakeVeduras;
    __block NSArray *fakeExtras;

    beforeEach(^{
        fakeTortilla = [Tortilla mock];
        fakeBeef = [Beef mock];
        fakeQueso = [Queso mock];
        fakeSalsa = [Salsa mock];
        fakeVeduras = @[@"beans", @"rice"];
        fakeExtras = @[@"grease", @"extra grease"];
        
        taco = [[Taco alloc] init];
        taco.name = @"EmptyTaco";
        taco.tortilla = fakeTortilla;
        taco.beef = fakeBeef;
        taco.queso = fakeQueso;
        taco.salsa = fakeSalsa;
        taco.veduras = fakeVeduras;
        taco.extras = fakeExtras;
    });
    
    it(@"is not nil", ^{
        [taco shouldNotBeNil];
    });
    
    it(@"has a name", ^{
        [[taco.name should] equal:@"EmptyTaco"];
    });
    
    it(@"has tortilla", ^{
        [[taco.tortilla should] equal:fakeTortilla];
    });
    
    it(@"has beef", ^{
        [[taco.beef should] equal:fakeBeef];
    });
    
    it(@"has queso", ^{
        [[taco.queso should] equal:fakeQueso];
    });
    
    it(@"has salsa", ^{
        [[taco.salsa should] equal:fakeSalsa];
    });
    
    it(@"has veduras", ^{
        [[taco.veduras should] equal:fakeVeduras];
    });
    
    it(@"has extras", ^{
        [[taco.extras should] equal:fakeExtras];
    });
    
    it(@"has #prepare", ^{
        [[taco should] respondToSelector:@selector(prepare)];
    });
    
    it(@"has #loadUpIngredients", ^{
        [[taco should] respondToSelector:@selector(loadUpIngredients)];
    });
    
    it(@"has #wrap", ^{
        [[taco should] respondToSelector:@selector(wrap)];
    });
});

SPEC_END