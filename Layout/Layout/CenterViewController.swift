import UIKit

class CenterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		self.view.backgroundColor = UIColor.whiteColor()
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Close", style: .Plain, target: self, action: #selector(self.closeButtonClicked))

		// View 1
		let topCenterLabel = UILabel()
		topCenterLabel.translatesAutoresizingMaskIntoConstraints = false
		topCenterLabel.backgroundColor = UIColor.blueColor()
		self.view.addSubview(topCenterLabel)

		let topCenterLabelWidth = NSLayoutConstraint.constraintsWithVisualFormat("H:[topCenterLabel(100)]", options: [], metrics: nil, views: ["topCenterLabel": topCenterLabel])
		let topCenterLabelHeight = NSLayoutConstraint.constraintsWithVisualFormat("V:[topCenterLabel(50)]", options: [], metrics: nil, views: ["topCenterLabel": topCenterLabel])
		let topCenterLabelX = NSLayoutConstraint(item: topCenterLabel, attribute: .CenterX, relatedBy: .Equal, toItem: topCenterLabel.superview, attribute: .CenterX, multiplier: 1.0, constant: 0.0)
		let topCenterLabelY = NSLayoutConstraint.constraintsWithVisualFormat("V:[topLayoutGuide]-30-[topCenterLabel]", options: [], metrics: nil, views: ["topCenterLabel": topCenterLabel, "topLayoutGuide": topLayoutGuide])

		self.view.addConstraints(topCenterLabelWidth)
		self.view.addConstraints(topCenterLabelHeight)
		self.view.addConstraints([topCenterLabelX])
		self.view.addConstraints(topCenterLabelY)

		// View 2
		let centerLabel = UILabel()
		centerLabel.translatesAutoresizingMaskIntoConstraints = false
		centerLabel.backgroundColor = UIColor.blueColor()
		self.view.addSubview(centerLabel)

		let centerLabelWidth = NSLayoutConstraint.constraintsWithVisualFormat("H:[centerLabel(50)]", options: [], metrics: nil, views: ["centerLabel": centerLabel])
		let centerLabelHeight = NSLayoutConstraint.constraintsWithVisualFormat("V:[centerLabel(50)]", options: [], metrics: nil, views: ["centerLabel": centerLabel])
		let centerLabelX = NSLayoutConstraint(item: centerLabel, attribute: .CenterX, relatedBy: .Equal, toItem: centerLabel.superview, attribute: .CenterX, multiplier: 1.0, constant: 0.0)
		let centerLabelY = NSLayoutConstraint(item: centerLabel, attribute: .CenterY, relatedBy: .Equal, toItem: centerLabel.superview, attribute: .CenterY, multiplier: 1.0, constant: 0.0)

		self.view.addConstraints(centerLabelWidth)
		self.view.addConstraints(centerLabelHeight)
		self.view.addConstraints([centerLabelX, centerLabelY])

		// View 3
		let bottomCenterLabel = UILabel()
		bottomCenterLabel.translatesAutoresizingMaskIntoConstraints = false
		bottomCenterLabel.backgroundColor = UIColor.blueColor()
		self.view.addSubview(bottomCenterLabel)

		let bottomCenterLabelWidth = NSLayoutConstraint.constraintsWithVisualFormat("H:[bottomCenterLabel(100)]", options: [], metrics: nil, views: ["bottomCenterLabel": bottomCenterLabel])
		let bottomCenterLabelHeight = NSLayoutConstraint.constraintsWithVisualFormat("V:[bottomCenterLabel(50)]", options: [], metrics: nil, views: ["bottomCenterLabel": bottomCenterLabel])
		let bottomCenterLabelX = NSLayoutConstraint(item: bottomCenterLabel, attribute: .CenterX, relatedBy: .Equal, toItem: topCenterLabel.superview, attribute: .CenterX, multiplier: 1.0, constant: 0.0)
		let bottomCenterLabelY = NSLayoutConstraint.constraintsWithVisualFormat("V:[bottomCenterLabel]-30-[bottomLayoutGuide]|", options: [], metrics: nil, views: ["bottomCenterLabel": bottomCenterLabel, "bottomLayoutGuide": bottomLayoutGuide])

		self.view.addConstraints(bottomCenterLabelWidth)
		self.view.addConstraints(bottomCenterLabelHeight)
		self.view.addConstraints([bottomCenterLabelX])
		self.view.addConstraints(bottomCenterLabelY)

		// View 4
		let leftCenterLabel = UILabel()
		leftCenterLabel.translatesAutoresizingMaskIntoConstraints = false
		leftCenterLabel.backgroundColor = UIColor.blueColor()
		self.view.addSubview(leftCenterLabel)

		let leftCenterLabelWidth = NSLayoutConstraint.constraintsWithVisualFormat("H:[leftCenterLabel(50)]", options: [], metrics: nil, views: ["leftCenterLabel": leftCenterLabel])
		let leftCenterLabelHeight = NSLayoutConstraint.constraintsWithVisualFormat("V:[leftCenterLabel(100)]", options: [], metrics: nil, views: ["leftCenterLabel": leftCenterLabel])
		let leftCenterLabelXY = NSLayoutConstraint.constraintsWithVisualFormat("H:|-30-[leftCenterLabel]->=0-[centerLabel]", options: [.AlignAllCenterY], metrics: nil, views: ["leftCenterLabel": leftCenterLabel, "centerLabel": centerLabel])

		self.view.addConstraints(leftCenterLabelWidth)
		self.view.addConstraints(leftCenterLabelHeight)
		self.view.addConstraints(leftCenterLabelXY)

		// View 5
		let rightCenterLabel = UILabel()
		rightCenterLabel.translatesAutoresizingMaskIntoConstraints = false
		rightCenterLabel.backgroundColor = UIColor.blueColor()
		self.view.addSubview(rightCenterLabel)

		let rightCenterLabelWidth = NSLayoutConstraint.constraintsWithVisualFormat("H:[rightCenterLabel(50)]", options: [], metrics: nil, views: ["rightCenterLabel": rightCenterLabel])
		let rightCenterLabelHeight = NSLayoutConstraint.constraintsWithVisualFormat("V:[rightCenterLabel(100)]", options: [], metrics: nil, views: ["rightCenterLabel": rightCenterLabel])
		let rightCenterLabelXY = NSLayoutConstraint.constraintsWithVisualFormat("H:[centerLabel]->=0-[rightCenterLabel]-30-|", options: [.AlignAllCenterY], metrics: nil, views: ["rightCenterLabel": rightCenterLabel, "centerLabel": centerLabel])

		self.view.addConstraints(rightCenterLabelWidth)
		self.view.addConstraints(rightCenterLabelHeight)
		self.view.addConstraints(rightCenterLabelXY)
	}

	func closeButtonClicked() {
		self.dismissViewControllerAnimated(true, completion: nil)
	}
}
