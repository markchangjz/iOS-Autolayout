import UIKit

class CenterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		self.view.backgroundColor = UIColor.white
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(self.closeButtonClicked))

		// View 1
		let topCenterLabel = UILabel()
		topCenterLabel.translatesAutoresizingMaskIntoConstraints = false
		topCenterLabel.backgroundColor = UIColor.blue
		self.view.addSubview(topCenterLabel)

		let topCenterLabelWidth = NSLayoutConstraint.constraints(withVisualFormat: "H:[topCenterLabel(100)]", options: [], metrics: nil, views: ["topCenterLabel": topCenterLabel])
		let topCenterLabelHeight = NSLayoutConstraint.constraints(withVisualFormat: "V:[topCenterLabel(50)]", options: [], metrics: nil, views: ["topCenterLabel": topCenterLabel])
		let topCenterLabelX = NSLayoutConstraint(item: topCenterLabel, attribute: .centerX, relatedBy: .equal, toItem: topCenterLabel.superview, attribute: .centerX, multiplier: 1.0, constant: 0.0)
		let topCenterLabelY = NSLayoutConstraint.constraints(withVisualFormat: "V:[topLayoutGuide]-30-[topCenterLabel]", options: [], metrics: nil, views: ["topCenterLabel": topCenterLabel, "topLayoutGuide": topLayoutGuide])

		self.view.addConstraints(topCenterLabelWidth)
		self.view.addConstraints(topCenterLabelHeight)
		self.view.addConstraints([topCenterLabelX])
		self.view.addConstraints(topCenterLabelY)

		// View 2
		let centerLabel = UILabel()
		centerLabel.translatesAutoresizingMaskIntoConstraints = false
		centerLabel.backgroundColor = UIColor.blue
		self.view.addSubview(centerLabel)

		let centerLabelWidth = NSLayoutConstraint.constraints(withVisualFormat: "H:[centerLabel(50)]", options: [], metrics: nil, views: ["centerLabel": centerLabel])
		let centerLabelHeight = NSLayoutConstraint.constraints(withVisualFormat: "V:[centerLabel(50)]", options: [], metrics: nil, views: ["centerLabel": centerLabel])
		let centerLabelX = NSLayoutConstraint(item: centerLabel, attribute: .centerX, relatedBy: .equal, toItem: centerLabel.superview, attribute: .centerX, multiplier: 1.0, constant: 0.0)
		let centerLabelY = NSLayoutConstraint(item: centerLabel, attribute: .centerY, relatedBy: .equal, toItem: centerLabel.superview, attribute: .centerY, multiplier: 1.0, constant: 0.0)

		self.view.addConstraints(centerLabelWidth)
		self.view.addConstraints(centerLabelHeight)
		self.view.addConstraints([centerLabelX, centerLabelY])

		// View 3
		let bottomCenterLabel = UILabel()
		bottomCenterLabel.translatesAutoresizingMaskIntoConstraints = false
		bottomCenterLabel.backgroundColor = UIColor.blue
		self.view.addSubview(bottomCenterLabel)

		let bottomCenterLabelWidth = NSLayoutConstraint.constraints(withVisualFormat: "H:[bottomCenterLabel(100)]", options: [], metrics: nil, views: ["bottomCenterLabel": bottomCenterLabel])
		let bottomCenterLabelHeight = NSLayoutConstraint.constraints(withVisualFormat: "V:[bottomCenterLabel(50)]", options: [], metrics: nil, views: ["bottomCenterLabel": bottomCenterLabel])
		let bottomCenterLabelX = NSLayoutConstraint(item: bottomCenterLabel, attribute: .centerX, relatedBy: .equal, toItem: topCenterLabel.superview, attribute: .centerX, multiplier: 1.0, constant: 0.0)
		let bottomCenterLabelY = NSLayoutConstraint.constraints(withVisualFormat: "V:[bottomCenterLabel]-30-[bottomLayoutGuide]|", options: [], metrics: nil, views: ["bottomCenterLabel": bottomCenterLabel, "bottomLayoutGuide": bottomLayoutGuide])

		self.view.addConstraints(bottomCenterLabelWidth)
		self.view.addConstraints(bottomCenterLabelHeight)
		self.view.addConstraints([bottomCenterLabelX])
		self.view.addConstraints(bottomCenterLabelY)

		// View 4
		let leftCenterLabel = UILabel()
		leftCenterLabel.translatesAutoresizingMaskIntoConstraints = false
		leftCenterLabel.backgroundColor = UIColor.blue
		self.view.addSubview(leftCenterLabel)

		let leftCenterLabelWidth = NSLayoutConstraint.constraints(withVisualFormat: "H:[leftCenterLabel(50)]", options: [], metrics: nil, views: ["leftCenterLabel": leftCenterLabel])
		let leftCenterLabelHeight = NSLayoutConstraint.constraints(withVisualFormat: "V:[leftCenterLabel(100)]", options: [], metrics: nil, views: ["leftCenterLabel": leftCenterLabel])
		let leftCenterLabelXY = NSLayoutConstraint.constraints(withVisualFormat: "H:|-30-[leftCenterLabel]->=0-[centerLabel]", options: [.alignAllCenterY], metrics: nil, views: ["leftCenterLabel": leftCenterLabel, "centerLabel": centerLabel])

		self.view.addConstraints(leftCenterLabelWidth)
		self.view.addConstraints(leftCenterLabelHeight)
		self.view.addConstraints(leftCenterLabelXY)

		// View 5
		let rightCenterLabel = UILabel()
		rightCenterLabel.translatesAutoresizingMaskIntoConstraints = false
		rightCenterLabel.backgroundColor = UIColor.blue
		self.view.addSubview(rightCenterLabel)

		let rightCenterLabelWidth = NSLayoutConstraint.constraints(withVisualFormat: "H:[rightCenterLabel(50)]", options: [], metrics: nil, views: ["rightCenterLabel": rightCenterLabel])
		let rightCenterLabelHeight = NSLayoutConstraint.constraints(withVisualFormat: "V:[rightCenterLabel(100)]", options: [], metrics: nil, views: ["rightCenterLabel": rightCenterLabel])
		let rightCenterLabelXY = NSLayoutConstraint.constraints(withVisualFormat: "H:[centerLabel]->=0-[rightCenterLabel]-30-|", options: [.alignAllCenterY], metrics: nil, views: ["rightCenterLabel": rightCenterLabel, "centerLabel": centerLabel])

		self.view.addConstraints(rightCenterLabelWidth)
		self.view.addConstraints(rightCenterLabelHeight)
		self.view.addConstraints(rightCenterLabelXY)
	}

	func closeButtonClicked() {
		self.dismiss(animated: true, completion: nil)
	}
}
