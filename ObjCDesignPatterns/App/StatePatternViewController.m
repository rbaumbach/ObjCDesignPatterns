#import "StatePatternViewController.h"
#import "DonkeyKongArcade.h"


@interface StatePatternViewController ()

@property (strong, nonatomic) DonkeyKongArcade *donkeyKongArcade;

@end


@implementation StatePatternViewController

#pragma mark - Init Methods

- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"State Pattern";
        self.donkeyKongArcade = [[DonkeyKongArcade alloc] init];
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
    
    [textViewText appendString:@"Inserting coin into Donkey Kong Arcade...\n"];
    
    NSString *coinInserted = [self.donkeyKongArcade insertCoin];
    
    [textViewText appendString:coinInserted];
    
    [textViewText appendString:@"Pressing start...\n"];
    
    NSString *startPressed = [self.donkeyKongArcade pressStart];
    
    [textViewText appendString:startPressed];
    
    [textViewText appendString:@"Playing game...\n"];
    
    NSString *gamePlayed = [self.donkeyKongArcade playGame];
    
    [textViewText appendString:gamePlayed];
    
    [textViewText appendString:@"Attempting to play game again...\n"];
    
    NSString *gamePlayedTwice = [self.donkeyKongArcade playGame];
    
    [textViewText appendString:gamePlayedTwice];

    self.textView.text = textViewText;
}

@end
