#import "BeefTaco.h"


@interface BeefTaco ()

@property (strong, nonatomic) id<TacoContentsFactory> tacoContentsFactory;

@end


@implementation BeefTaco

#pragma mark - Public Methods

- (id)initWithTacoContentsFactory:(id<TacoContentsFactory>)tacoContentsFactory
{
    self = [super init];
    if (self) {
        self.name = @"Beef Taco";
        self.tacoContentsFactory = tacoContentsFactory;
    }
    return self;
}

#pragma mark - Taco Methods

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
