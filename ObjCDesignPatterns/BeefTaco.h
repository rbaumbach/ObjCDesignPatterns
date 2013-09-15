#import "Taco.h"
#import "TacoContentsFactory.h"

@interface BeefTaco : Taco

- (id)initWithTacoContentsFactory:(id<TacoContentsFactory>)tacoContentsFactory;

@end
