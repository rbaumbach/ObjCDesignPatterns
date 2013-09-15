#import "BeefTaco.h"


@interface BeefTaco ()

@property (strong, nonatomic) Tortilla *tortilla;
@property (strong, nonatomic) Beef *beef;
@property (strong, nonatomic) Queso *queso;
@property (strong, nonatomic) Salsa *salsa;
@property (strong, nonatomic) NSArray *veduras;
@property (strong, nonatomic) NSArray *extras;

@property (strong, nonatomic) id<TacoContentsFactory> tacoContentsFactory;

@end


@implementation BeefTaco

- (id)initWithTacoContentsFactory:(id<TacoContentsFactory>)tacoContentsFactory
{
    self = [super init];
    if (self) {
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
