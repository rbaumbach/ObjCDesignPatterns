#import "BeefTaco.h"


@interface BeefTaco ()

@property (strong, nonatomic) id<TacoContentsFactory> tacoContentsFactory;

@end


@implementation BeefTaco

- (id)initWithTacoContentsFactory:(id<TacoContentsFactory>)tacoContentsFactory
{
    self = [super init];
    if (self) {
        self.name = @"Beef Taco";
        self.tacoContentsFactory = tacoContentsFactory;
    }
    return self;
}

- (void)prepare
{
    self.tortilla = [self.tacoContentsFactory createTortilla];
    self.beef = [self.tacoContentsFactory createBeef];
    self.queso = [self.tacoContentsFactory createQueso];
    self.salsa = [self.tacoContentsFactory createSalsa];
    self.veduras = [self.tacoContentsFactory createVeduras];
    self.extras = [self.tacoContentsFactory createExtras];
}

@end
