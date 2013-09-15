

@interface Taco : NSObject

@property (strong, nonatomic) NSString *name;

- (void)prepare;
- (void)loadUpIngredients;
- (void)wrap;

@end
