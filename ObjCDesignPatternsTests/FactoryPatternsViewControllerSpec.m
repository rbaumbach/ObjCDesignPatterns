#import "Kiwi.h"
#import "Swizzlean.h"
#import "FactoryPatternsViewController.h"
#import "BeerBar.h"

@interface FactoryPatternsViewController ()

@property (strong, nonatomic) BeerBar *beerBar;

- (void)setupTextView;
- (NSString *)beerBarText;
- (NSString *)wineBarText;
- (NSString *)mixedDrinksBarText;
- (NSString *)crunchyTacoStoreText;
- (NSString *)streetTacoStoreText;

@end


SPEC_BEGIN(FactoryPatternsViewControllerSpec)

describe(@"FactoryPatternsViewController", ^{
    __block FactoryPatternsViewController *controller;
    
    beforeEach(^{
        controller = [[FactoryPatternsViewController alloc] init];
        [controller view];
    });
    
    it(@"should not be nil", ^{
        [controller shouldNotBeNil];
    });
    
    it(@"is a subclass of UIViewController", ^{
        [[controller should] beKindOfClass:[UIViewController class]];
    });
    
    it(@"has the correct tabBarItem title", ^{
        [[controller.tabBarItem.title should] equal:@"Factory Patterns"];
    });
    
    it(@"has a tabBarItem", ^{
        [controller.tabBarItem shouldNotBeNil];
    });
    
    it(@"has a beer bar", ^{
        [controller.beerBar shouldNotBeNil];
    });
    
    context(@"#viewDidLoad", ^{
        __block Swizzlean *superViewDidLoadSwizz;
        __block BOOL superViewDidLoadCalled;
        
        beforeEach(^{
            superViewDidLoadCalled = NO;
            superViewDidLoadSwizz = [[Swizzlean alloc] initWithClassToSwizzle:[UIViewController class]];
            [superViewDidLoadSwizz swizzleInstanceMethod:@selector(viewDidLoad) withReplacementImplementation:^(id _self) {
                superViewDidLoadCalled = YES;
            }];
        });
        
        afterEach(^{
            [superViewDidLoadSwizz resetSwizzledInstanceMethod];
        });
        
        it(@"calls super, thanks for asking", ^{
            [controller viewDidLoad];
            [[theValue(superViewDidLoadCalled) should] beYes];
        });
        
        it(@"calls setupTextView", ^{
            [[controller should] receive:@selector(setupTextView)];
            [controller viewDidLoad];
        });
    });
    
    context(@"#setupTextView", ^{
        __block NSString *textViewText;
        
        beforeEach(^{
            [[controller should] receive:@selector(beerBarText) andReturn:@"beerBar"];
            [[controller should] receive:@selector(wineBarText) andReturn:@"wineBar"];
            [[controller should] receive:@selector(mixedDrinksBarText) andReturn:@"mixedDrinksBar"];
            [[controller should] receive:@selector(crunchyTacoStoreText) andReturn:@"crunchyTacoStore"];
            [[controller should] receive:@selector(streetTacoStoreText) andReturn:@"streetTacoStore"];
            [controller setupTextView];
            
            textViewText = @"Factory Method Pattern\n\nbeerBarwineBarmixedDrinksBar\nAbstract Factory Pattern\n\ncrunchyTacoStorestreetTacoStore";
        });
        
        it(@"sets up textView with correct text", ^{
            [[controller.textView.text should] equal:textViewText];
        });
    });
    
    context(@"textView", ^{
        it(@"has a textView", ^{
            [controller.textView shouldNotBeNil];
        });
        
        it(@"cannot be edited", ^{
            [[theValue(controller.textView.editable) should] beNo];
        });
    });
    
    context(@"#beerBarText", ^{
        __block NSString *beerBarText;
        __block NSString *retString;
        
        beforeEach(^{
            beerBarText = @"Creating Beer Bar...\nOrdering Ale...\nAle ready to drink!\nOrdering Lager...\nLager ready to drink!\nOrdering Stout...\nStout ready to drink!\n";
            retString = [controller beerBarText];
        });
        
        it(@"returns the correct text", ^{
            [[retString should] equal:beerBarText];
        });
    });
    
    context(@"#wineBarText", ^{
        __block NSString *wineBarText;
        __block NSString *retString;
        
        beforeEach(^{
            wineBarText = @"Creating Wine Bar...\nOrdering Merlot...\nMerlot ready to drink!\nOrdering Cabernet Sauvignon...\nCabernet Sauvignon ready to drink!\nOrdering Chardonnay...\nChardonnay ready to drink!\n";
            retString = [controller wineBarText];
        });
        
        it(@"returns the correct text", ^{
            [[retString should] equal:wineBarText];
        });
    });

    context(@"#mixedDrinksBarText", ^{
        __block NSString *mixedDrinksBarText;
        __block NSString *retString;
        
        beforeEach(^{
            mixedDrinksBarText = @"Creating Mixed Drinks Bar...\nOrdering Jager Bomb...\nJager Bomb ready to drink!\nOrdering Rum and Coke...\nRum and Coke ready to drink!\nOrdering Whiskey Sour...\nWhiskey Sour ready to drink!\n";
            retString = [controller mixedDrinksBarText];
        });
        
        it(@"returns correct text", ^{
            [[retString should] equal:mixedDrinksBarText];
        });
    });
    
    context(@"#crunchyTacoStoreText", ^{
        __block NSString *crunchyTacoStoreText;
        __block NSString *retString;
        
        beforeEach(^{
            crunchyTacoStoreText = @"Creating Crunchy Taco Store...\nOrdering Beef Taco...\nTaco has: Maiz tortilla, Molida, Cheddar cheese, Mild salsa, Cebolla, Tomate, Lechuga, Crema and Guacamole\nBeef Taco is ready to eat!\nOrdering Pork Taco...\nTaco has: Maiz tortilla, Chile Verde, Cheddar cheese, Mild salsa, Cebolla, Tomate, Lechuga, Crema and Guacamole\nPork Taco is ready to eat!\n";
            retString = [controller crunchyTacoStoreText];
        });
        
        it(@"returns correct text", ^{
            [[retString should] equal:crunchyTacoStoreText];
        });
    });
    
    context(@"#streetTacoStoreText", ^{
        __block NSString *streetTacoStoreText;
        __block NSString *retString;
        
        beforeEach(^{
            streetTacoStoreText = @"Creating Street Taco Store...\nOrdering Beef Taco...\nTaco has: Maiz tortilla, Asada, Fresco cheese, Picante salsa, Cebolla, Cilantro, Crema and Guacamole\nBeef Taco is ready to eat!\nOrdering Pork Taco...\nTaco has: Maiz tortilla, Carnitas, Fresco cheese, Picante salsa, Cebolla, Cilantro, Crema and Guacamole\nPork Taco is ready to eat!\n";
            retString = [controller streetTacoStoreText];
        });
        
        it(@"returns correct text", ^{
            [[retString should] equal:streetTacoStoreText];
        });
    });
});

SPEC_END