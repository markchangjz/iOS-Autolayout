#import "BasicViewController.h"

@interface BasicViewController ()

@end

@implementation BasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];

	self.view.backgroundColor = [UIColor whiteColor];

	UIView *leftView = [[UIView alloc] init];
	leftView.backgroundColor = [UIColor redColor];
	UIView *rightView = [[UIView alloc] init];
	rightView.backgroundColor = [UIColor blueColor];
	[self.view addSubview:leftView];
	[self.view addSubview:rightView];

	leftView.translatesAutoresizingMaskIntoConstraints = NO;
	rightView.translatesAutoresizingMaskIntoConstraints = NO;
    
	NSDictionary *views = NSDictionaryOfVariableBindings(leftView, rightView);

    NSDictionary *metrics = @{@"p": @(15)};
	NSArray *hConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(p)-[leftView(rightView)]-(p)-[rightView]-(p)-|" options:0 metrics:metrics views:views];
    [self.view addConstraints:hConstraint];
    
    [NSLayoutConstraint activateConstraints:@[
        [leftView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:15],
        [leftView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-15],
        
        [rightView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:30],
        [rightView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-30]
    ]];
}

@end
