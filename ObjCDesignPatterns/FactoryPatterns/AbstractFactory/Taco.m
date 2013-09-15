#import "Taco.h"
#import "Tortilla.h"
#import "Beef.h"
#import "Queso.h"
#import "Salsa.h"

@interface Taco ()

@property (strong, nonatomic) Tortilla *tortilla;
@property (strong, nonatomic) Beef *beef;
@property (strong, nonatomic) Queso *queso;
@property (strong, nonatomic) Salsa *salsa;
@property (strong, nonatomic) NSArray *veduras;
@property (strong, nonatomic) NSArray *extras;

@end

@implementation Taco

- (void)prepare
{
    NSLog(@"Preparing taco...");
}

- (void)loadUpIngredients
{
    NSLog(@"Loading up all taco ingredients...");
}

- (void)wrap
{
    NSLog(@"Wrapping up the taco!!!");
}

@end
