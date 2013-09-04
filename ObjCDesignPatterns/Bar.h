#import <Foundation/Foundation.h>


@class Beverage;

@interface Bar : NSObject

- (Beverage *)orderBeverage:(NSString *)beverageType;

@end
