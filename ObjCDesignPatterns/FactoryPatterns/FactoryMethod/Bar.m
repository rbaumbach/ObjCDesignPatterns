#import "Bar.h"
#import "Beverage.h"


@implementation Bar

#pragma mark - Public Methods

- (Beverage *)orderBeverage:(NSString *)beverageType
{
    Beverage *beverage = [self createBeverage:beverageType];
    
    [beverage prepare];
    [beverage pour];
    
    return beverage;
}

#pragma mark - Private Methods

- (Beverage *)createBeverage:(NSString *)beverageType
{
    return [[Beverage alloc] init];
}

@end
