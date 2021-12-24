import UIKit

class CornerViewController: UIViewController {

	var closeButton = UIButton()

	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = UIColor.white

		var views = [String: AnyObject]()
		var allConstraints = [NSLayoutConstraint]()

		// View 1
		let upperLeftView = UIView()
		upperLeftView.translatesAutoresizingMaskIntoConstraints = false
		upperLeftView.backgroundColor = UIColor.red
		self.view.addSubview(upperLeftView)
		views["upperLeftView"] = upperLeftView

		let c1 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[upperLeftView(50)]", options: [], metrics: nil, views: views)
		allConstraints += c1
		let c2 = NSLayoutConstraint.constraints(withVisualFormat: "V:|-50-[upperLeftView(100)]", options: [], metrics: nil, views: views)
		allConstraints += c2

		// View 2
		let upperRightView = UIView()
		upperRightView.translatesAutoresizingMaskIntoConstraints = false
		upperRightView.backgroundColor = UIColor.green
		self.view.addSubview(upperRightView)
		views["upperRightView"] = upperRightView

		let c3 = NSLayoutConstraint.constraints(withVisualFormat: "H:[upperRightView(100)]-30-|", options: [], metrics: nil, views: views)
		allConstraints += c3
		let c4 = NSLayoutConstraint.constraints(withVisualFormat: "V:|-50-[upperRightView(50)]", options: [], metrics: nil, views: views)
		allConstraints += c4

		// View 3
		let bottomLeftView = UIView()
		bottomLeftView.translatesAutoresizingMaskIntoConstraints = false
		bottomLeftView.backgroundColor = UIColor.blue
		self.view.addSubview(bottomLeftView)
		views["bottomLeftView"] = bottomLeftView

		let c5 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-50-[bottomLeftView(50)]", options: [], metrics: nil, views: views)
		allConstraints += c5
		let c6 = NSLayoutConstraint.constraints(withVisualFormat: "V:[bottomLeftView(50)]-10-|", options: [], metrics: nil, views: views)
		allConstraints += c6

		// View 4
		let bottomRightView = UIView()
		bottomRightView.translatesAutoresizingMaskIntoConstraints = false
		bottomRightView.backgroundColor = UIColor.yellow
		self.view.addSubview(bottomRightView)
		views["bottomRightView"] = bottomRightView

		let c7 = NSLayoutConstraint.constraints(withVisualFormat: "H:[bottomRightView(50)]-20-|", options: [], metrics: nil, views: views)
		allConstraints += c7
		let c8 = NSLayoutConstraint.constraints(withVisualFormat: "V:[bottomRightView(100)]-10-|", options: [], metrics: nil, views: views)
		allConstraints += c8

		NSLayoutConstraint.activate(allConstraints)

		// Close Button
		closeButton.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
		closeButton.backgroundColor = UIColor.black
		closeButton.setTitle("Close", for: UIControl.State())
		closeButton.addTarget(self, action:#selector(self.closeButtonClicked), for: .touchUpInside)
		self.view.addSubview(closeButton)
	}

	override func viewWillLayoutSubviews() {
		closeButton.center.x = self.view.center.x
		closeButton.frame.origin.y = UIScreen.main.bounds.height - closeButton.frame.height - 10
	}

	@objc func closeButtonClicked() {
		self.dismiss(animated: true, completion: nil)
	}
}
