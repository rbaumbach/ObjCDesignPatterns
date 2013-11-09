#import "CrestedDuck.h"


@implementation CrestedDuck

#pragma mark - <Duck>

- (NSString *)quack
{
    return @"Quack Quack!!!\n";
}

- (NSString *)walk
{
    return @"Waddle...Waddle...\n";
}

- (NSString *)swim
{
    return @"Float, splash, paddle with webbed feet...\n";
}

- (NSString *)fly
{
    return @"Flying high gracefully...\n";
}

@end
