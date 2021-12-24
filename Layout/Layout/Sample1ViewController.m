#import "Sample1ViewController.h"

@interface Sample1ViewController ()

@end

@implementation Sample1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

	self.view.backgroundColor = [UIColor whiteColor];

	UIView *redView = [[UIView alloc] init];
	redView.backgroundColor = [UIColor redColor];
	UIView *greenView = [[UIView alloc] init];
	greenView.backgroundColor = [UIColor greenColor];
	UIView *blueView = [[UIView alloc] init];
	blueView.backgroundColor = [UIColor blueColor];

	redView.translatesAutoresizingMaskIntoConstraints = NO;
	greenView.translatesAutoresizingMaskIntoConstraints = NO;
	blueView.translatesAutoresizingMaskIntoConstraints = NO;

	[self.view addSubview:redView];
	[self.view addSubview:greenView];
	[self.view addSubview:blueView];

	NSDictionary *views = NSDictionaryOfVariableBindings(redView, greenView, blueView);

	NSArray *horizontalConstraints =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[redView]-20-[greenView]-20-[blueView]-20-|" options:0 metrics:nil views:views];
	NSArray *equalWidthConstraints1 = [NSLayoutConstraint constraintsWithVisualFormat:@"[redView(==greenView)]" options:0 metrics:nil views:views];
	NSArray *equalWidthConstraints2 = [NSLayoutConstraint constraintsWithVisualFormat:@"[greenView(==blueView)]" options:0 metrics:nil views:views];

	[self.view addConstraints:horizontalConstraints];
	[self.view addConstraints:equalWidthConstraints1];
	[self.view addConstraints:equalWidthConstraints2];
    
    [redView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:20.0].active = YES;
    [redView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-20.0].active = YES;
    [greenView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:20.0].active = YES;
    [greenView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-20.0].active = YES;
    [blueView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:20.0].active = YES;
    [blueView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-20.0].active = YES;
}

@end
