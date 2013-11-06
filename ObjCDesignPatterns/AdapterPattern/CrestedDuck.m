#import "CrestedDuck.h"


@implementation CrestedDuck

#pragma mark - <Duck>

- (NSString *)quack
{
    return @"Quack Quack!!!";
}

- (NSString *)walk
{
    return @"Waddle...Waddle...";
}

- (NSString *)swim
{
    return @"Float, splash, paddle with webbed feet...";
}

- (NSString *)fly
{
    return @"Flying high gracefully...";
}

@end
