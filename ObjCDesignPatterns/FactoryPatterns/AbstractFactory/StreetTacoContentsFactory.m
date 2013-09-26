#import "StreetTacoContentsFactory.h"
#import "Maiz.h"
#import "Asada.h"
#import "Carnitas.h"
#import "Fresco.h"
#import "Picante.h"
#import "Cebolla.h"
#import "Cilantro.h"
#import "Crema.h"
#import "Guacamole.h"


@implementation StreetTacoContentsFactory

#pragma mark - <TacoContentsFactory> Methods

- (Tortilla *)createTortilla
{
    return [[Maiz alloc] init];
}

- (Beef *)createBeef
{
    return [[Asada alloc] init];
}

- (Pork *)createPork
{
    return [[Carnitas alloc] init];
}

- (Queso *)createQueso
{
    return [[Fresco alloc] init];
}
- (Salsa *)createSalsa
{
    return [[Picante alloc] init];
}

- (NSArray *)createVeduras
{
    Cebolla *cebolla = [[Cebolla alloc] init];
    Cilantro *cilantro = [[Cilantro alloc] init];
    return @[cebolla, cilantro];
}

- (NSArray *)createExtras
{
    Crema *crema = [[Crema alloc] init];
    Guacamole *quacamole = [[Guacamole alloc] init];
    return @[crema, quacamole];
}

@end
