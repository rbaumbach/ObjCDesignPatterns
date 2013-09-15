#import "WineBar.h"
#import "Chardonnay.h"
#import "Merlot.h"
#import "CabernetSauvignon.h"

@implementation WineBar

- (Beverage *)createBeverage:(NSString *)beverageType
{
    Beverage *beverage;
    
    if ([beverageType isEqualToString:@"Chardonnay"]) {
        beverage = [[Chardonnay alloc] init];
    } else if ([beverageType isEqualToString:@"Merlot"]) {
        beverage = [[Merlot alloc] init];
    } else if ([beverageType isEqualToString:@"CabernetSauvignon"]) {
        beverage = [[CabernetSauvignon alloc] init];
    }
    
    return beverage;
}

@end
