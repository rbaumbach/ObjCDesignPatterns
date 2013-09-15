#import "TacoStore.h"


@implementation TacoStore

- (Taco *)orderTaco:(NSString *)tacoType
{
    Taco *taco;
    
    taco = [self createTaco:tacoType];
    [taco prepare];
    [taco loadUpIngredients];
    [taco wrap];
    
    return taco;
}

- (Taco *)createTaco:(NSString *)tacoType
{
    return [[Taco alloc] init];
}

@end
