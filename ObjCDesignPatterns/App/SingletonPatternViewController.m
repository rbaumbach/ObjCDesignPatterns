#import "SingletonPatternViewController.h"
#import "FancyLookupTable.h"


@interface SingletonPatternViewController ()

@property (strong, nonatomic) FancyLookupTable *fancyLookupTable;

@end


@implementation SingletonPatternViewController

#pragma mark - Init Methods

- (id)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"Singleton";
        self.fancyLookupTable = [FancyLookupTable sharedInstance];
    }
    return self;
}

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupTextView];
}

#pragma mark - Private Methods

- (void)setupTextView
{
    NSMutableString *textViewText = [[NSMutableString alloc] init];
    [textViewText appendString:@"FancyLookupTable singleton created\n"];
    [textViewText appendString:[NSString stringWithFormat:@"Object reference is: %@\n", self.fancyLookupTable]];
    [textViewText appendString:@"Attempting new instance...\n"];
    
    self.fancyLookupTable = [FancyLookupTable sharedInstance];
    
    [textViewText appendString:[NSString stringWithFormat:@"Object reference is still: %@\n", self.fancyLookupTable]];
    [textViewText appendString:[NSString stringWithFormat:@"Getting fancy goblet: %@\n", [self.fancyLookupTable getFancyItem:@"fancyGoblet"]]];
    [textViewText appendString:[NSString stringWithFormat:@"Adding a fancy dog...\n"]];
    
    [self.fancyLookupTable addFancyItem:@"Gold Dog" withKey:@"fancyDog"];
    
    [textViewText appendString:[NSString stringWithFormat:@"%@ added!\n", [self.fancyLookupTable getFancyItem:@"fancyDog"]]];
    
    self.textView.text = textViewText;
}

@end
