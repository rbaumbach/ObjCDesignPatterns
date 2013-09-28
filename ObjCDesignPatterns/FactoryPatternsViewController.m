#import "FactoryPatternsViewController.h"
#import "BeerBar.h"
#import "WineBar.h"
#import "MixedDrinksBar.h"
#import "Beverage.h"
#import "CrunchyTacoStore.h"
#import "StreetTacoStore.h"
#import "Taco.h"
#import "Tortilla.h"
#import "Beef.h"
#import "Pork.h"
#import "queso.h"
#import "Salsa.h"
#import "Cebolla.h"
#import "Lechuga.h"
#import "Tomate.h"
#import "Crema.h"
#import "Guacamole.h"

@interface FactoryPatternsViewController ()

@property (strong, nonatomic) BeerBar *beerBar;

@end


@implementation FactoryPatternsViewController

#pragma mark - Init Methods

- (id)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"Factory Patterns";
        self.beerBar = [[BeerBar alloc] init];
    }
    return self;
}

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupTextView];
}

#pragma mark - Private Methods

- (void)setupTextView
{
    NSString *beerBarText = [self beerBarText];
    NSString *wineBarText = [self wineBarText];
    NSString *mixedDrinksBarText = [self mixedDrinksBarText];
    NSString *crunchyTacoStoreText = [self crunchyTacoStoreText];
    NSString *streetTacoStoreText = [self streetTacoStoreText];
    
    NSMutableString *textViewText = [[NSMutableString alloc] init];
    [textViewText appendString:@"Factory Method Pattern\n\n"];
    [textViewText appendString:beerBarText];
    [textViewText appendString:wineBarText];
    [textViewText appendString:mixedDrinksBarText];
    [textViewText appendString:@"\n"];
    [textViewText appendString:@"Abstract Factory Pattern\n\n"];
    [textViewText appendString:crunchyTacoStoreText];
    [textViewText appendString:streetTacoStoreText];
    
    self.textView.text = textViewText;
}

- (NSString *)beerBarText
{
    NSString *creatingBeerBar = @"Creating Beer Bar...\n";
    BeerBar *beerBar = [[BeerBar alloc] init];
    
    NSString *orderingAle = @"Ordering Ale...\n";
    Beverage *ale = [beerBar orderBeverage:@"Ale"];
    NSString *orderAleComplete = [NSString stringWithFormat:@"%@ ready to drink!\n", ale.name];
    
    NSString *orderingLager = @"Ordering Lager...\n";
    Beverage *lager = [beerBar orderBeverage:@"Lager"];
    NSString *orderLagerComplete = [NSString stringWithFormat:@"%@ ready to drink!\n", lager.name];
    
    NSString *orderingStout = @"Ordering Stout...\n";
    Beverage *stout = [beerBar orderBeverage:@"Stout"];
    NSString *orderStoutComplete = [NSString stringWithFormat:@"%@ ready to drink!\n", stout.name];
    
    NSMutableString *beerBarText = [[NSMutableString alloc] init];
    [beerBarText appendString:creatingBeerBar];
    [beerBarText appendString:orderingAle];
    [beerBarText appendString:orderAleComplete];
    
    [beerBarText appendString:orderingLager];
    [beerBarText appendString:orderLagerComplete];
    
    [beerBarText appendString:orderingStout];
    [beerBarText appendString:orderStoutComplete];
    
    return beerBarText;
}

- (NSString *)wineBarText
{
    NSString *creatingWineBar = @"Creating Wine Bar...\n";
    WineBar *wineBar = [[WineBar alloc] init];
    
    NSString *orderingMerlot = @"Ordering Merlot...\n";
    Beverage *merlot = [wineBar orderBeverage:@"Merlot"];
    NSString *orderMerlotComplete = [NSString stringWithFormat:@"%@ ready to drink!\n", merlot.name];
    
    NSString *orderingCabernetSauvignon = @"Ordering Cabernet Sauvignon...\n";
    Beverage *cabernetSauvignon = [wineBar orderBeverage:@"CabernetSauvignon"];
    NSString *ordercabernetSauvignonComplete = [NSString stringWithFormat:@"%@ ready to drink!\n", cabernetSauvignon.name];
    
    NSString *orderingChardonnay = @"Ordering Chardonnay...\n";
    Beverage *chardonnay = [wineBar orderBeverage:@"Chardonnay"];
    NSString *orderChardonnayComplete = [NSString stringWithFormat:@"%@ ready to drink!\n", chardonnay.name];
    
    NSMutableString *wineBarText = [[NSMutableString alloc] init];
    [wineBarText appendString:creatingWineBar];
    [wineBarText appendString:orderingMerlot];
    [wineBarText appendString:orderMerlotComplete];
    
    [wineBarText appendString:orderingCabernetSauvignon];
    [wineBarText appendString:ordercabernetSauvignonComplete];
    
    [wineBarText appendString:orderingChardonnay];
    [wineBarText appendString:orderChardonnayComplete];
    
    return wineBarText;
}

- (NSString *)mixedDrinksBarText
{
    NSString *creatingMixedDrinksBar = @"Creating Mixed Drinks Bar...\n";
    MixedDrinksBar *mixedDrinksBar = [[MixedDrinksBar alloc] init];
    
    NSString *orderingJagerBomb = @"Ordering Jager Bomb...\n";
    Beverage *jagerBomb = [mixedDrinksBar orderBeverage:@"JagerBomb"];
    NSString *orderJagerBombComplete = [NSString stringWithFormat:@"%@ ready to drink!\n", jagerBomb.name];
    
    NSString *orderingRumAndCoke = @"Ordering Rum and Coke...\n";
    Beverage *rumAndCoke = [mixedDrinksBar orderBeverage:@"RumAndCoke"];
    NSString *orderRumAndCokeComplete = [NSString stringWithFormat:@"%@ ready to drink!\n", rumAndCoke.name];
    
    NSString *orderingWhiskeySour = @"Ordering Whiskey Sour...\n";
    Beverage *whiskeySour = [mixedDrinksBar orderBeverage:@"WhiskeySour"];
    NSString *orderWhiskeySourComplete = [NSString stringWithFormat:@"%@ ready to drink!\n", whiskeySour.name];
    
    NSMutableString *mixedDrinksBarText = [[NSMutableString alloc] init];
    [mixedDrinksBarText appendString:creatingMixedDrinksBar];
    [mixedDrinksBarText appendString:orderingJagerBomb];
    [mixedDrinksBarText appendString:orderJagerBombComplete];
    
    [mixedDrinksBarText appendString:orderingRumAndCoke];
    [mixedDrinksBarText appendString:orderRumAndCokeComplete];
    
    [mixedDrinksBarText appendString:orderingWhiskeySour];
    [mixedDrinksBarText appendString:orderWhiskeySourComplete];
    
    return mixedDrinksBarText;
}

- (NSString *)crunchyTacoStoreText
{
    NSString *creatingCrunchyTacoStore = @"Creating Crunchy Taco Store...\n";
    CrunchyTacoStore *crunchyTacoStore = [[CrunchyTacoStore alloc] init];
    
    NSString *orderingBeefTaco = @"Ordering Beef Taco...\n";
    Taco *beefTaco = [crunchyTacoStore orderTaco:@"BeefTaco"];
    
    NSString *beefTacoContents = [NSString stringWithFormat:@"Taco has: %@ tortilla, %@, %@ cheese, %@ salsa, %@, %@, %@, %@ and %@\n",
                                  beefTaco.tortilla.name, beefTaco.beef.name, beefTaco.queso.name, beefTaco.salsa.name,
                                  ((Vedura *)beefTaco.veduras[0]).name, ((Vedura *)beefTaco.veduras[1]).name, ((Vedura *)beefTaco.veduras[2]).name,
                                  ((Extra *)beefTaco.extras[0]).name, ((Vedura *)beefTaco.extras[1]).name];
    NSString *orderBeefTacoComplete = [NSString stringWithFormat:@"%@ is ready to eat!\n", beefTaco.name];
    
    NSString *orderingPorkTaco = @"Ordering Pork Taco...\n";
    Taco *porkTaco = [crunchyTacoStore orderTaco:@"PorkTaco"];
    
    NSString *porkTacoContents = [NSString stringWithFormat:@"Taco has: %@ tortilla, %@, %@ cheese, %@ salsa, %@, %@, %@, %@ and %@\n",
                                  porkTaco.tortilla.name, porkTaco.pork.name, porkTaco.queso.name, porkTaco.salsa.name,
                                  ((Vedura *)porkTaco.veduras[0]).name, ((Vedura *)porkTaco.veduras[1]).name, ((Vedura *)porkTaco.veduras[2]).name,
                                  ((Extra *)porkTaco.extras[0]).name, ((Vedura *)porkTaco.extras[1]).name];
    NSString *orderPorkTacoComplete = [NSString stringWithFormat:@"%@ is ready to eat!\n", porkTaco.name];
    
    NSMutableString *crunchyTacoStoreText = [[NSMutableString alloc] init];
    [crunchyTacoStoreText appendString:creatingCrunchyTacoStore];
    [crunchyTacoStoreText appendString:orderingBeefTaco];
    [crunchyTacoStoreText appendString:beefTacoContents];
    [crunchyTacoStoreText appendString:orderBeefTacoComplete];
    
    [crunchyTacoStoreText appendString:orderingPorkTaco];
    [crunchyTacoStoreText appendString:porkTacoContents];
    [crunchyTacoStoreText appendString:orderPorkTacoComplete];
    
    return crunchyTacoStoreText;
}

- (NSString *)streetTacoStoreText
{
    NSString *creatingStreetTacoStore = @"Creating Street Taco Store...\n";
    StreetTacoStore *streetTacoStore = [[StreetTacoStore alloc] init];
    
    NSString *orderingBeefTaco = @"Ordering Beef Taco...\n";
    Taco *beefTaco = [streetTacoStore orderTaco:@"BeefTaco"];
    
    NSString *beefTacoContents = [NSString stringWithFormat:@"Taco has: %@ tortilla, %@, %@ cheese, %@ salsa, %@, %@, %@ and %@\n",
                                  beefTaco.tortilla.name, beefTaco.beef.name, beefTaco.queso.name, beefTaco.salsa.name,
                                  ((Vedura *)beefTaco.veduras[0]).name, ((Vedura *)beefTaco.veduras[1]).name,
                                  ((Extra *)beefTaco.extras[0]).name, ((Vedura *)beefTaco.extras[1]).name];
    NSString *orderBeefTacoComplete = [NSString stringWithFormat:@"%@ is ready to eat!\n", beefTaco.name];
    
    NSString *orderingPorkTaco = @"Ordering Pork Taco...\n";
    Taco *porkTaco = [streetTacoStore orderTaco:@"PorkTaco"];
    
    NSString *porkTacoContents = [NSString stringWithFormat:@"Taco has: %@ tortilla, %@, %@ cheese, %@ salsa, %@, %@, %@ and %@\n",
                                  porkTaco.tortilla.name, porkTaco.pork.name, porkTaco.queso.name, porkTaco.salsa.name,
                                  ((Vedura *)porkTaco.veduras[0]).name, ((Vedura *)porkTaco.veduras[1]).name,
                                  ((Extra *)porkTaco.extras[0]).name, ((Vedura *)porkTaco.extras[1]).name];
    NSString *orderPorkTacoComplete = [NSString stringWithFormat:@"%@ is ready to eat!\n", porkTaco.name];
    
    NSMutableString *streetTacoStoreText = [[NSMutableString alloc] init];
    [streetTacoStoreText appendString:creatingStreetTacoStore];
    [streetTacoStoreText appendString:orderingBeefTaco];
    [streetTacoStoreText appendString:beefTacoContents];
    [streetTacoStoreText appendString:orderBeefTacoComplete];
    
    [streetTacoStoreText appendString:orderingPorkTaco];
    [streetTacoStoreText appendString:porkTacoContents];
    [streetTacoStoreText appendString:orderPorkTacoComplete];
    
    return streetTacoStoreText;
}

@end
