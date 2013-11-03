#import "IteratorPatternViewController.h"
#import "SimpleLinkedList.h"
#import "Iterator.h"


@interface IteratorPatternViewController ()

@property (strong, nonatomic) SimpleLinkedList *simpleLinkedList;

@end


@implementation IteratorPatternViewController

#pragma mark - Init Methods

- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"Iterator Pattern";
        self.simpleLinkedList = [[SimpleLinkedList alloc] init];
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
    [textViewText appendString:@"Adding 3 elements to the simple linked list...\n"];
    
    [self.simpleLinkedList addItem:@"0"];
    [self.simpleLinkedList addItem:@"1"];
    [self.simpleLinkedList addItem:@"2"];
    
    [textViewText appendString:@"Creating simple linked list iterator...\n"];
    
    id<Iterator> iterator = [self.simpleLinkedList createIterator];
    
    [textViewText appendString:@"Iterating through linked list...\n"];
    
    [textViewText appendString:[self createLinkedListText:iterator]];
    
    self.textView.text = textViewText;
}

- (NSString *)createLinkedListText:(id<Iterator>)iterator // needs test
{
    NSMutableString *text = [[NSMutableString alloc] init];
    
    while ([iterator hasNext]) {
        [text appendString:[NSString stringWithFormat:@"%@ -> ", [iterator next]]];
    }
    
    [text appendString:@"nil"];
    
    return text;
}

@end
