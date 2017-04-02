/*

1. Auto Layout Visual Format Language Tutorial
https://www.raywenderlich.com/110393/auto-layout-visual-format-language-tutorial

2. Working with Auto Layout Visual Format Language and Programmatically Creating Constraints - AppCoda
http://www.appcoda.com/auto-layout-programmatically/

3. Auto Layout Guide_ Visual Format Language
https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/AutolayoutPG/VisualFormatLanguage.html

*/

import UIKit

class MainTableViewController: UITableViewController {

	var viewControllers = [String]()

	override func viewDidLoad() {
		super.viewDidLoad()

		viewControllers = ["Corner", "Center", "Stack View", "Basic", "Three views resizes with equal width"]
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewControllers.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

		cell.textLabel?.text = viewControllers[indexPath.row]

		return cell
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if indexPath.row == 0 {
			let cornerVC = CornerViewController()
			self.present(cornerVC, animated: true, completion: nil)
		}
		else if indexPath.row == 1 {
			let centerVC = CenterViewController()
			let centerNVC = UINavigationController(rootViewController: centerVC)
			let centerTBVC = UITabBarController()
			centerTBVC.viewControllers = [centerNVC]
			self.present(centerTBVC, animated: true, completion: nil)
		}
		else if indexPath.row == 2 {
			let stackVC = StackViewController();
			self.navigationController?.pushViewController(stackVC, animated: true)
		}
		else if indexPath.row == 3 {
			let basicVC = BasicViewController();
			self.navigationController?.pushViewController(basicVC, animated: true)
		}
		else if indexPath.row == 4 {
			let sample1VC = Sample1ViewController();
			self.navigationController?.pushViewController(sample1VC, animated: true)
		}
	}
}

