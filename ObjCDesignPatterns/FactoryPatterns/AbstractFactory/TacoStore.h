#import "Taco.h"


@interface TacoStore : NSObject

@property (strong, nonatomic) NSString *name;

- (Taco *)orderTaco:(NSString *)tacoType;

@end
