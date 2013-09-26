#import "TacoStore.h"


@implementation TacoStore

#pragma mark - Public Methods

- (Taco *)orderTaco:(NSString *)tacoType
{
    Taco *taco;
    
    taco = [self createTaco:tacoType];
    [taco prepare];
    [taco loadUpIngredients];
    [taco wrap];
    
    return taco;
}

#pragma mark - Private Methods

- (Taco *)createTaco:(NSString *)tacoType
{
    return [[Taco alloc] init];
}

@end
