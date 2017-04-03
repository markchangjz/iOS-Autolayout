// https://useyourloaf.com/blog/goodbye-spacer-views-hello-layout-guides/

#import "StackViewController.h"

@interface StackViewController ()

@end

@implementation StackViewController

- (void)viewDidLoad {
    [super viewDidLoad];

	self.view.backgroundColor = [UIColor whiteColor];

	UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Center", @"Split"]];
	[segmentedControl addTarget:self action:@selector(switchView:) forControlEvents:UIControlEventValueChanged];
	segmentedControl.selectedSegmentIndex = 0;
	self.navigationItem.titleView = segmentedControl;

	[self stackView1];
}

- (void)stackView1 {
	UIView *view1 = [[UIView alloc] init];
	view1.backgroundColor = [UIColor blueColor];
	[view1.heightAnchor constraintEqualToConstant:50].active = YES;
	[view1.widthAnchor constraintEqualToConstant:120].active = YES;

	UIView *view2 = [[UIView alloc] init];
	view2.backgroundColor = [UIColor greenColor];
	[view2.heightAnchor constraintEqualToConstant:50].active = YES;
	[view2.widthAnchor constraintEqualToConstant:120].active = YES;

	UIView *view3 = [[UIView alloc] init];
	view3.backgroundColor = [UIColor magentaColor];
	[view3.heightAnchor constraintEqualToConstant:100].active = YES;
	[view3.widthAnchor constraintEqualToConstant:120].active = YES;

	UIStackView *stackView = [[UIStackView alloc] init];
	stackView.axis = UILayoutConstraintAxisVertical;
	stackView.distribution = UIStackViewDistributionEqualSpacing;
	stackView.alignment = UIStackViewAlignmentCenter;
	stackView.spacing = 10;

	[stackView addArrangedSubview:view1];
	[stackView addArrangedSubview:view2];
	[stackView addArrangedSubview:view3];

	stackView.translatesAutoresizingMaskIntoConstraints = NO;
	[self.view addSubview:stackView];

	// 置中
	[stackView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
	[stackView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
}

- (void)stackView2 {
	UIView *topView1 = [[UIView alloc] init];
	topView1.backgroundColor = [UIColor blueColor];
	[topView1.heightAnchor constraintEqualToConstant:100].active = true;
	UIView *topView2 = [[UIView alloc] init];
	topView2.backgroundColor = [UIColor redColor];
	[topView2.heightAnchor constraintEqualToConstant:100].active = true;

	UIStackView *topStackView = [[UIStackView alloc] init];
	topStackView.axis = UILayoutConstraintAxisHorizontal;
	topStackView.alignment = UIStackViewAlignmentTop;
	topStackView.spacing = 10.0;
	topStackView.distribution = UIStackViewDistributionFillEqually;
	topStackView.translatesAutoresizingMaskIntoConstraints = NO;
	[topStackView addArrangedSubview:topView1];
	[topStackView addArrangedSubview:topView2];
	[self.view addSubview:topStackView];

	UIView *bottomView1 = [[UIView alloc] init];
	bottomView1.backgroundColor = [UIColor greenColor];
	UIView *bottomView2 = [[UIView alloc] init];
	bottomView2.backgroundColor = [UIColor yellowColor];

	UIStackView *bottomStackView = [[UIStackView alloc] init];
	bottomStackView.axis = UILayoutConstraintAxisVertical;
	bottomStackView.alignment = UIStackViewAlignmentTop;
	bottomStackView.spacing = 10.0;
	bottomStackView.distribution = UIStackViewDistributionFillEqually;
	bottomStackView.translatesAutoresizingMaskIntoConstraints = NO;
	[bottomStackView addArrangedSubview:bottomView1];
	[bottomStackView addArrangedSubview:bottomView2];
	[self.view addSubview:bottomStackView];

	id topLayoutGuide = self.topLayoutGuide;
	id bottomLayoutGuide = self.bottomLayoutGuide;
	NSDictionary *views = NSDictionaryOfVariableBindings(topStackView, bottomStackView, topLayoutGuide, bottomLayoutGuide, bottomView1, bottomView2);

	// 設定 topStackView
	NSArray *hTopStackViewConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[topStackView]-10-|" options:0 metrics:nil views:views];
	NSArray *vTopStackViewConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[topLayoutGuide]-10-[topStackView(120)]" options:0 metrics:nil views:views];

	// 設定 bottomStackView
	NSArray *hBottomStackViewConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[bottomStackView]-10-|" options:0 metrics:nil views:views];
	NSArray *vBottomStackViewConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[bottomStackView]-10-[bottomLayoutGuide]" options:0 metrics:nil views:views];

	// 把 topStackView 擺在上面，bottomStackView 擺在下面
	NSArray *stackViewConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[topStackView][bottomStackView]" options:0 metrics:nil views:views];

	// 把 bottomView1 的寬度，設定成跟 bottomStackView 一樣
	NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:bottomView1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:bottomStackView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0];

	// 把 bottomView1 跟 bottomView2 的寬與高都設定成一樣
	NSArray *bottomWidthConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[bottomView1(bottomView2)]" options:0 metrics:nil views:views];
	NSArray *bottomHeightConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[bottomView1(bottomView2)]" options:0 metrics:nil views:views];

	[self.view addConstraints:hTopStackViewConstraint];
	[self.view addConstraints:vTopStackViewConstraint];
	[self.view addConstraints:hBottomStackViewConstraint];
	[self.view addConstraints:vBottomStackViewConstraint];
	[self.view addConstraints:stackViewConstraint];
	[self.view addConstraint:widthConstraint];
	[self.view addConstraints:bottomWidthConstraint];
	[self.view addConstraints:bottomHeightConstraint];
}

#pragma mark - IBAction

- (void)switchView:(UISegmentedControl *)sender {
	// 將所有 View 移除
	[[self.view subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];

	switch (sender.selectedSegmentIndex) {
		case 0:
			[self stackView1];
			break;
		case 1:
			[self stackView2];
			break;
	}
}

@end
