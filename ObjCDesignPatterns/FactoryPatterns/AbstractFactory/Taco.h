
@class Tortilla, Beef, Pork, Queso, Salsa;

@interface Taco : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) Tortilla *tortilla;
@property (strong, nonatomic) Beef *beef;
@property (strong, nonatomic) Pork *pork;
@property (strong, nonatomic) Queso *queso;
@property (strong, nonatomic) Salsa *salsa;
@property (strong, nonatomic) NSArray *veduras;
@property (strong, nonatomic) NSArray *extras;

- (void)prepare;
- (void)loadUpIngredients;
- (void)wrap;

@end
