#import "CommandPatternViewController.h"
#import "JobArray.h"
#import "PlumberUnclogDrainJob.h"
#import "ExterminatorKillRoachesJob.h"
#import "GardenerTrimBushesJob.h"


@interface CommandPatternViewController ()

@property (strong, nonatomic) JobArray *jobArray;
@property (strong, nonatomic) Plumber *plumber;
@property (strong, nonatomic) Exterminator *exterminator;
@property (strong, nonatomic) Gardener *gardener;

@end


@implementation CommandPatternViewController

#pragma mark - Init Methods

- (id)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"Command Pattern";
        self.jobArray = [[JobArray alloc] init];
        self.plumber = [[Plumber alloc] init];
        self.exterminator = [[Exterminator alloc] init];
        self.gardener = [[Gardener alloc] init];
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
    
    [textViewText appendString:@"Creating plumber unclog drain job...\n"];
    
    PlumberUnclogDrainJob *unclogDrainJob = [[PlumberUnclogDrainJob alloc] initWithPlumber:self.plumber];
    
    [textViewText appendString:@"Creating exterminator kill roaches job...\n"];
    
    ExterminatorKillRoachesJob *killRoachesJob = [[ExterminatorKillRoachesJob alloc] initWithExterminator:self.exterminator];
    
    [textViewText appendString:@"Creating gardener trim bushes job...\n"];
    
    GardenerTrimBushesJob *trimBushesJob = [[GardenerTrimBushesJob alloc] initWithGardener:self.gardener];
    
    [textViewText appendString:@"Adding jobs to job array...\n"];
    
    [self.jobArray addJob:unclogDrainJob atIndex:0];
    [self.jobArray addJob:killRoachesJob atIndex:1];
    [self.jobArray addJob:trimBushesJob  atIndex:2];
    
    [textViewText appendString:@"Executing jobs...\n"];
    [textViewText appendString:[NSString stringWithFormat:@"%@\n", [self.jobArray runJobAtIndex:0]]];
    [textViewText appendString:[NSString stringWithFormat:@"%@\n", [self.jobArray runJobAtIndex:1]]];
    [textViewText appendString:[NSString stringWithFormat:@"%@\n", [self.jobArray runJobAtIndex:2]]];
    
    self.textView.text = textViewText;
}

@end
