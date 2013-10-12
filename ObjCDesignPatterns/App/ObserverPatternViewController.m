#import "ObserverPatternViewController.h"
#import "BurritoReporter.h"
#import "ChimichangaTimes.h"
#import "SuperBurritoGazette.h"
#import "BurritoSupremeBee.h"

@interface ObserverPatternViewController ()

@property (strong, nonatomic) BurritoReporter *burritoReporter;
@property (strong, nonatomic) ChimichangaTimes *chimichangaTimes;
@property (strong, nonatomic) SuperBurritoGazette *superBurritoGazette;
@property (strong, nonatomic) BurritoSupremeBee *burritoSupremeBee;

@end


@implementation ObserverPatternViewController

#pragma mark - Init Methods

- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"Observer Pattern";
    }
    return self;
}

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupBurritoReporting];
    [self setupTextView];
}

- (void)setupBurritoReporting
{
    self.burritoReporter = [[BurritoReporter alloc] init];
    self.chimichangaTimes = [[ChimichangaTimes alloc] initWithNewsReporter:self.burritoReporter];
    self.superBurritoGazette = [[SuperBurritoGazette alloc] initWithNewsReporter:self.burritoReporter];
    self.burritoSupremeBee = [[BurritoSupremeBee alloc] initWithNewsReporter:self.burritoReporter];
}

- (NSString *)getNewspaperSnippets
{
    NSMutableString *textViewText = [[NSMutableString alloc]init];
    
    [textViewText appendString:@"Chimichanga News Snippet...\n"];
    [textViewText appendString:self.chimichangaTimes.snippet];
    
    [textViewText appendString:@"Super Burrito Gazette News Snippet...\n"];
    [textViewText appendString:self.superBurritoGazette.snippet];
    
    [textViewText appendString:@"Burrito Supreme Bee News Snippet...\n"];
    [textViewText appendString:self.burritoSupremeBee.snippet];
    
    return textViewText;
}

- (void)setupTextView
{
    NSMutableString *textViewText = [[NSMutableString alloc] init];
    [textViewText appendString:@"Creating Burrito reporter...\n"];
    [textViewText appendString:@"Creating Chimichanga Times, Super Burrito Gazette and Burrito Supreme Bee...\n"];
    
    [textViewText appendString:@"Reporter reports Elvis burrito sighting...\n"];
    
    self.burritoReporter.headline = @"Elvis Burrito Sighting!!!";
    
    [textViewText appendString:[self getNewspaperSnippets]];
    
    [textViewText appendString:@"Reporter reports attack of Zombie Vegan Wrap...\n"];
    
    self.burritoReporter.headline = @"Zombie Vegan Wrap attacks man in San Francisco!!!";
    
    [textViewText appendString:[self getNewspaperSnippets]];
    
    [textViewText appendString:@"Burrito Supreme doesn't want reports from this 'tabloid' reporter.  "];
    [textViewText appendString:@"Unsubscribing...\n"];
    
    [self.burritoReporter removeObserver:self.burritoSupremeBee];
    
    [textViewText appendString:@"Reporter reports 'Tortilla Malfunction' at Giant's game...\n"];
    
    self.burritoReporter.headline = @"'Tortilla Malfunction' at Giant's game!!!";
    
    [textViewText appendString:[self getNewspaperSnippets]];
    
    self.textView.text = textViewText;
}

@end
