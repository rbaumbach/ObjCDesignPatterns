#import "BeerBar.h"
#import "Lager.h"
#import "Stout.h"
#import "Ale.h"


@implementation BeerBar

#pragma mark - Init Methods

- (id)init
{
    self = [super init];
    if (self) {
        self.name = @"Beer Bar";
    }
    return self;
}

#pragma mark - Bar Methods

- (Beverage *)createBeverage:(NSString *)beverageType
{
    Beverage *beverage;
    
    if ([beverageType isEqualToString:@"Lager"]) {
        beverage = [[Lager alloc] init];
    } else if ([beverageType isEqualToString:@"Stout"]) {
        beverage = [[Stout alloc] init];
    } else if ([beverageType isEqualToString:@"Ale"]) {
        beverage = [[Ale alloc] init];
    }
    
    return beverage;
}

@end
