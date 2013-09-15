#import "Taco.h"
#import "TacoContentsFactory.h"


@interface PorkTaco : Taco

- (id)initWithTacoContentsFactory:(id<TacoContentsFactory>)tacoContentsFactory;

@end
