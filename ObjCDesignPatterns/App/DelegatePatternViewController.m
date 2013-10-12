#import "DelegatePatternViewController.h"
#import "FancyMutableArray.h"


@interface DelegatePatternViewController ()

@property (strong, nonatomic) FancyMutableArray *fancyMutableArray;
@property (strong, nonatomic) NSString *addedItem;
@property (strong, nonatomic) NSString *replacedItem;
@property (strong, nonatomic) NSString *removedItem;
@property (nonatomic) int replacedItemIndex;
@property (nonatomic) int removedItemIndex;

@end


@implementation DelegatePatternViewController

#pragma mark - Init Methods

- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"Delegate Pattern";
        self.fancyMutableArray = [[FancyMutableArray alloc]init];
        self.fancyMutableArray.delegate = self;
    }
    return self;
}

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupTextView];
}

#pragma mark - <FancyMutableArrayDelegate>

- (void)didAddItem:(id)item
{
    self.addedItem = item;
}

- (void)didReplaceItemWithtItem:(id)item
                        atIndex:(int)index
{
    self.replacedItem = item;
    self.replacedItemIndex = index;
}

- (void)didRemoveItem:(id)item
              atIndex:(int)index
{
    self.removedItem = item;
    self.removedItemIndex = index;
}

#pragma mark - Private Methods

- (void)setupTextView
{
    NSMutableString *textViewText = [[NSMutableString alloc] init];

    [textViewText appendString:@"Adding item to fancy mutable array...\n"];
    
    [self.fancyMutableArray addItem:@"Old Shoe"];

    [textViewText appendString:[NSString stringWithFormat:@"%@ added!\n", self.addedItem]];

    [textViewText appendString:@"Replacing item in fancy mutable array...\n"];
    
    [self.fancyMutableArray replaceItem:@"New Shoe" atIndex:0];

    [textViewText appendString:[NSString stringWithFormat:@"%@ replaced at index: %d\n", self.replacedItem, self.replacedItemIndex]];

    [textViewText appendString:@"Removing item in fancy mutable array...\n"];
    
    [self.fancyMutableArray removeItemAtIndex:0];

    [textViewText appendString:[NSString stringWithFormat:@"%@ removed at index: %d\n", self.removedItem, self.removedItemIndex]];

    self.textView.text = textViewText;
}

@end
