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
	NSArray *verticalConstraints1 =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-80-[redView]-20-|" options:0 metrics:nil views:views];
	NSArray *verticalConstraints2 =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-80-[greenView]-20-|" options:0 metrics:nil views:views];
	NSArray *verticalConstraints3 =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-80-[blueView]-20-|" options:0 metrics:nil views:views];

	[self.view addConstraints:horizontalConstraints];
	[self.view addConstraints:equalWidthConstraints1];
	[self.view addConstraints:equalWidthConstraints2];
	[self.view addConstraints:verticalConstraints1];
	[self.view addConstraints:verticalConstraints2];
	[self.view addConstraints:verticalConstraints3];
}

@end
