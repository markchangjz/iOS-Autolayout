/*
1. Auto Layout Visual Format Language Tutorial
https://www.raywenderlich.com/110393/auto-layout-visual-format-language-tutorial

*/

import UIKit

class MainTableViewController: UITableViewController {

	var viewControllers = [String]()

	override func viewDidLoad() {
		super.viewDidLoad()

		viewControllers = ["Corner", "Center"]
	}

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewControllers.count
	}

	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

		cell.textLabel?.text = viewControllers[indexPath.row]

		return cell
	}

	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		if indexPath.row == 0 {
			let cornerVC = CornerViewController()

			self.presentViewController(cornerVC, animated: true, completion: nil)
		}
		else if indexPath.row == 1 {
			let centerVC = CenterViewController()
			let centerNVC = UINavigationController(rootViewController: centerVC)
			let centerTBVC =  UITabBarController()
			centerTBVC.viewControllers = [centerNVC]

			self.presentViewController(centerTBVC, animated: true, completion: nil)
		}
	}
}

