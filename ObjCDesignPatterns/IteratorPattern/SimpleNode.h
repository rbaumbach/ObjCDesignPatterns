

@interface SimpleNode : NSObject

@property (strong, nonatomic) SimpleNode *nextNode;
@property (strong, nonatomic) id item;

- (id)initWithItem:(id)item;

@end
