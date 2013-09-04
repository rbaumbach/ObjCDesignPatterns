#import "Bar.h"
#import "Beverage.h"


@implementation Bar

- (Beverage *)orderBeverage:(NSString *)beverageType
{
    Beverage *beverage = [self createBeverage:beverageType];
    
    [beverage prepare];
    [beverage pour];
    
    return beverage;
}

- (Beverage *)createBeverage:(NSString *)beverageType
{
    return [[Beverage alloc] init];
}

@end
