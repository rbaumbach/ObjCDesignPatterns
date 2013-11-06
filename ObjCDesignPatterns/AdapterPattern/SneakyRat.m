#import "SneakyRat.h"


@implementation SneakyRat

#pragma mark - <Duck>

- (NSString *)quack
{
    return @"Quack Quack!!! (Uses duck call)";
}

- (NSString *)walk
{
    return @"Waddle...Waddle...(Uses swim flippers)";
}

- (NSString *)swim
{
    return @"Float, splash, paddle with webbed feet...(Uses waterproof duck suit and swim flippers)";
}

- (NSString *)fly
{
    return @"Flying high gracefully...(Uses high powered super technological advanced wings)";
}

@end
