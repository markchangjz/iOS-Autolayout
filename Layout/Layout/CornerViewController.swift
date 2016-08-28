import UIKit

class CornerViewController: UIViewController {

	var closeButton = UIButton()

	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = UIColor.whiteColor()

		var views = [String: AnyObject]()
		var allConstraints = [NSLayoutConstraint]()

		// View 1
		let upperLeftView = UIView()
		upperLeftView.translatesAutoresizingMaskIntoConstraints = false
		upperLeftView.backgroundColor = UIColor.redColor()
		self.view.addSubview(upperLeftView)
		views["upperLeftView"] = upperLeftView

		let c1 = NSLayoutConstraint.constraintsWithVisualFormat("H:|-20-[upperLeftView(50)]", options: [], metrics: nil, views: views)
		allConstraints += c1
		let c2 = NSLayoutConstraint.constraintsWithVisualFormat("V:|-50-[upperLeftView(100)]", options: [], metrics: nil, views: views)
		allConstraints += c2

		// View 2
		let upperRightView = UIView()
		upperRightView.translatesAutoresizingMaskIntoConstraints = false
		upperRightView.backgroundColor = UIColor.greenColor()
		self.view.addSubview(upperRightView)
		views["upperRightView"] = upperRightView

		let c3 = NSLayoutConstraint.constraintsWithVisualFormat("H:[upperRightView(100)]-30-|", options: [], metrics: nil, views: views)
		allConstraints += c3
		let c4 = NSLayoutConstraint.constraintsWithVisualFormat("V:|-50-[upperRightView(50)]", options: [], metrics: nil, views: views)
		allConstraints += c4

		// View 3
		let bottomLeftView = UIView()
		bottomLeftView.translatesAutoresizingMaskIntoConstraints = false
		bottomLeftView.backgroundColor = UIColor.blueColor()
		self.view.addSubview(bottomLeftView)
		views["bottomLeftView"] = bottomLeftView

		let c5 = NSLayoutConstraint.constraintsWithVisualFormat("H:|-50-[bottomLeftView(50)]", options: [], metrics: nil, views: views)
		allConstraints += c5
		let c6 = NSLayoutConstraint.constraintsWithVisualFormat("V:[bottomLeftView(50)]-10-|", options: [], metrics: nil, views: views)
		allConstraints += c6

		// View 4
		let bottomRightView = UIView()
		bottomRightView.translatesAutoresizingMaskIntoConstraints = false
		bottomRightView.backgroundColor = UIColor.yellowColor()
		self.view.addSubview(bottomRightView)
		views["bottomRightView"] = bottomRightView

		let c7 = NSLayoutConstraint.constraintsWithVisualFormat("H:[bottomRightView(50)]-20-|", options: [], metrics: nil, views: views)
		allConstraints += c7
		let c8 = NSLayoutConstraint.constraintsWithVisualFormat("V:[bottomRightView(100)]-10-|", options: [], metrics: nil, views: views)
		allConstraints += c8

		NSLayoutConstraint.activateConstraints(allConstraints)

		// Close Button
		closeButton.frame = CGRectMake(0, 0, 100, 50)
		closeButton.backgroundColor = UIColor.blackColor()
		closeButton.setTitle("Close", forState: UIControlState.Normal)
		closeButton.addTarget(self, action:#selector(self.closeButtonClicked), forControlEvents: .TouchUpInside)
		self.view.addSubview(closeButton)
	}

	override func viewWillLayoutSubviews() {
		closeButton.center.x = self.view.center.x
		closeButton.frame.origin.y = CGRectGetHeight(UIScreen.mainScreen().bounds) - CGRectGetHeight(closeButton.frame) - 10
	}

	func closeButtonClicked() {
		self.dismissViewControllerAnimated(true, completion: nil)
	}
}
