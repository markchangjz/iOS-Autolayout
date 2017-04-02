#import "RotateViewController.h"

@interface RotateViewController ()

@property (nonatomic) UIView *aView;
@property (nonatomic) UIView *bView;
@property (nonatomic) NSArray *h1Constraints;
@property (nonatomic) NSArray *h2Constraints;
@property (nonatomic) NSArray *vConstraints;
@property (nonatomic) NSArray *hConstraints;
@property (nonatomic) NSArray *v1Constraints;
@property (nonatomic) NSArray *v2Constraints;

@end

@implementation RotateViewController

- (void)viewDidLoad {
    [super viewDidLoad];

	self.view.backgroundColor = [UIColor whiteColor];

	[self.view addSubview:self.aView];
	[self.view addSubview:self.bView];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];

	[self handleInterfaceRotate];
}

- (void)viewWillLayoutSubviews {
	[super viewWillLayoutSubviews];

	[self handleInterfaceRotate];
}

- (void)handleInterfaceRotate {
	[self.view removeConstraints:self.hConstraints];
	[self.view removeConstraints:self.h1Constraints];
	[self.view removeConstraints:self.h2Constraints];
	[self.view removeConstraints:self.vConstraints];
	[self.view removeConstraints:self.v1Constraints];
	[self.view removeConstraints:self.v2Constraints];

	UIView *aView = self.aView;
	UIView *bView = self.bView;
	id topLayoutGuide = self.topLayoutGuide;
	id bottomLayoutGuide = self.bottomLayoutGuide;
	NSDictionary *views = NSDictionaryOfVariableBindings(aView, bView, topLayoutGuide, bottomLayoutGuide);

	if ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortrait) { // [[UIDevice currentDevice] orientation]
		self.h1Constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[aView]-10-|" options:0 metrics:nil views:views];
		self.h2Constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[bView]-10-|" options:0 metrics:nil views:views];
		self.vConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[topLayoutGuide]-10-[aView(bView)]-10-[bView]-10-[bottomLayoutGuide]|" options:0 metrics:nil views:views];
		[self.view addConstraints:self.h1Constraints];
		[self.view addConstraints:self.h2Constraints];
		[self.view addConstraints:self.vConstraints];
	}
	else {
		self.hConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[aView(bView)]-10-[bView]-10-|" options:0 metrics:nil views:views];
		self.v1Constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[topLayoutGuide]-10-[aView]-10-[bottomLayoutGuide]|" options:0 metrics:nil views:views];
		self.v2Constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[topLayoutGuide]-10-[bView]-10-[bottomLayoutGuide]|" options:0 metrics:nil views:views];
		[self.view addConstraints:self.hConstraints];
		[self.view addConstraints:self.v1Constraints];
		[self.view addConstraints:self.v2Constraints];
	}
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
	[super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
	// 螢幕轉向
}

- (UIView *)aView {
	if (!_aView) {
		_aView = [[UIView alloc] init];
		_aView.backgroundColor = [UIColor redColor];
		_aView.translatesAutoresizingMaskIntoConstraints = NO;
	}
	return _aView;
}

- (UIView *)bView {
	if (!_bView) {
		_bView = [[UIView alloc] init];
		_bView.backgroundColor = [UIColor blueColor];
		_bView.translatesAutoresizingMaskIntoConstraints = NO;
	}
	return _bView;
}

@end
