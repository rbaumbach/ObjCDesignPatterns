#import "CrunchyTacoContentsFactory.h"
#import "Maiz.h"
#import "Molida.h"
#import "ChileVerde.h"
#import "Cheddar.h"
#import "Mild.h"
#import "Cebolla.h"
#import "Tomate.h"
#import "Lechuga.h"
#import "Crema.h"
#import "Guacamole.h"


@implementation CrunchyTacoContentsFactory

- (Tortilla *)createTortilla
{
    return [[Maiz alloc] init];
}

- (Beef *)createBeef
{
    return [[Molida alloc] init];
}

- (Pork *)createPork
{
    return [[ChileVerde alloc] init];
}

- (Queso *)createQueso
{
    return [[Cheddar alloc] init];
}

- (Salsa *)createSalsa
{
    return [[Mild alloc] init];
}

- (NSArray *)createVeduras
{
    Cebolla *cebolla = [[Cebolla alloc] init];
    Tomate *tomate = [[Tomate alloc] init];
    Lechuga *lechuga = [[Lechuga alloc] init];
    return @[cebolla, tomate, lechuga];
}

- (NSArray *)createExtras
{
    Crema *crema = [[Crema alloc] init];
    Guacamole *quacamole = [[Guacamole alloc] init];
    return @[crema, quacamole];
}

@end
