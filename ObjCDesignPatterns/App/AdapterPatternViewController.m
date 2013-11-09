#import "AdapterPatternViewController.h"
#import "CrestedDuck.h"
#import "SneakyRat.h"
#import "RatAdapter.h"


@interface AdapterPatternViewController ()

@property (strong, nonatomic) id<Duck> duck;
@property (strong, nonatomic) id<Rat> rat;

@end


@implementation AdapterPatternViewController

#pragma mark - View Lifecycle

- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"Adapter Pattern";
        self.duck = [[CrestedDuck alloc] init];
        self.rat = [[SneakyRat alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupTextView];
}

#pragma mark - Private Methods

- (void)setupTextView
{
    NSMutableString *textViewText = [[NSMutableString alloc] init];
    
    [textViewText appendString:[self duckText]];
    [textViewText appendString:[self ratText]];
    [textViewText appendString:[self ratAdapterText]];
    
    self.textView.text = textViewText;
}

- (NSString *)duckText
{
    NSMutableString *duckText = [[NSMutableString alloc] init];
    
    [duckText appendString:@"What we have here is a duck\n"];
    [duckText appendString:@"Quack: "];
    [duckText appendString:[self.duck quack]];
    [duckText appendString:@"Walk: "];
    [duckText appendString:[self.duck walk]];
    [duckText appendString:@"Swim: "];
    [duckText appendString:[self.duck swim]];
    [duckText appendString:@"Fly: "];
    [duckText appendString:[self.duck fly]];
    [duckText appendString:@"\n"];
    
    return duckText;
}

- (NSString *)ratText
{
    NSMutableString *ratText = [[NSMutableString alloc] init];
    
    [ratText appendString:@"What we have here is a rat\n"];
    [ratText appendString:@"Squeak: "];
    [ratText appendString:[self.rat squeak]];
    [ratText appendString:@"Run Around: "];
    [ratText appendString:[self.rat runAround]];
    [ratText appendString:@"Swim: "];
    [ratText appendString:[self.rat swim]];
    [ratText appendString:@"Fly with Super Flight Suit: "];
    [ratText appendString:[self.rat flyWithSuperFlightSuit]];
    [ratText appendString:@"\n"];
    
    return ratText;
}

- (NSString *)ratAdapterText
{
    RatAdapter *ratAdapter = [[RatAdapter alloc] initWithRat:self.rat];

    NSMutableString *ratAdapterText = [[NSMutableString alloc] init];
    
    [ratAdapterText appendString:@"Using RatAdapter to use a rat as a duck\n"];
    [ratAdapterText appendString:@"Quack: "];
    [ratAdapterText appendString:[ratAdapter quack]];
    [ratAdapterText appendString:@"Walk: "];
    [ratAdapterText appendString:[ratAdapter walk]];
    [ratAdapterText appendString:@"Swim: "];
    [ratAdapterText appendString:[ratAdapter swim]];
    [ratAdapterText appendString:@"Fly: "];
    [ratAdapterText appendString:[ratAdapter fly]];
    
    return ratAdapterText;
}

@end
