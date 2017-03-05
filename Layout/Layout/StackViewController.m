#import "StackViewController.h"

@interface StackViewController ()

@end

@implementation StackViewController

- (void)viewDidLoad {
    [super viewDidLoad];

	self.view.backgroundColor = [UIColor whiteColor];

	//View 1
	UIView *view1 = [[UIView alloc] init];
	view1.backgroundColor = [UIColor blueColor];
	[view1.heightAnchor constraintEqualToConstant:50].active = true;
	[view1.widthAnchor constraintEqualToConstant:120].active = true;

	//View 2
	UIView *view2 = [[UIView alloc] init];
	view2.backgroundColor = [UIColor greenColor];
	[view2.heightAnchor constraintEqualToConstant:50].active = true;
	[view2.widthAnchor constraintEqualToConstant:120].active = true;

	//View 3
	UIView *view3 = [[UIView alloc] init];
	view3.backgroundColor = [UIColor magentaColor];
	[view3.heightAnchor constraintEqualToConstant:100].active = true;
	[view3.widthAnchor constraintEqualToConstant:120].active = true;

	//Stack View
	UIStackView *stackView = [[UIStackView alloc] init];

	stackView.axis = UILayoutConstraintAxisVertical;
	stackView.distribution = UIStackViewDistributionEqualSpacing;
	stackView.alignment = UIStackViewAlignmentCenter;
	stackView.spacing = 10;
	stackView.backgroundColor = [UIColor yellowColor];

	[stackView addArrangedSubview:view1];
	[stackView addArrangedSubview:view2];
	[stackView addArrangedSubview:view3];

	stackView.translatesAutoresizingMaskIntoConstraints = false;
	[self.view addSubview:stackView];

	//Layout for Stack View
	[stackView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = true;
	[stackView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = true;
}

@end
