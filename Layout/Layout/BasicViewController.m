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

	id topLayoutGuide = self.topLayoutGuide;
	id bottomLayoutGuide = self.bottomLayoutGuide;
	NSDictionary *views = NSDictionaryOfVariableBindings(leftView, rightView, topLayoutGuide, bottomLayoutGuide);

	NSArray *hConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-15-[leftView(rightView)]-15-[rightView]-15-|" options:0 metrics:nil views:views];
	NSArray *vlConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[topLayoutGuide]-15-[leftView]-15-[bottomLayoutGuide]|" options:0 metrics:nil views:views];
	NSArray *vrConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[topLayoutGuide]-30-[rightView]-30-[bottomLayoutGuide]|" options:0 metrics:nil views:views];
	[self.view addConstraints:hConstraint];
	[self.view addConstraints:vlConstraint];
	[self.view addConstraints:vrConstraint];
}

@end
