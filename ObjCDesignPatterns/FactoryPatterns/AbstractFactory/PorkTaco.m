#import "PorkTaco.h"


@interface PorkTaco ()

@property (strong, nonatomic) id<TacoContentsFactory> tacoContentsFactory;

@end


@implementation PorkTaco

- (id)initWithTacoContentsFactory:(id<TacoContentsFactory>)tacoContentsFactory
{
    self = [super init];
    if (self) {
        self.name = @"Pork Taco";
        self.tacoContentsFactory = tacoContentsFactory;
    }
    return self;
}

- (void)prepare
{
    self.tortilla = [self.tacoContentsFactory createTortilla];
    self.pork = [self.tacoContentsFactory createPork];
    self.queso = [self.tacoContentsFactory createQueso];
    self.salsa = [self.tacoContentsFactory createSalsa];
    self.veduras = [self.tacoContentsFactory createVeduras];
    self.extras = [self.tacoContentsFactory createExtras];
}

@end
