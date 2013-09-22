

@class Beverage;

@interface Bar : NSObject

@property (strong, nonatomic) NSString *name;

- (Beverage *)orderBeverage:(NSString *)beverageType;

@end
