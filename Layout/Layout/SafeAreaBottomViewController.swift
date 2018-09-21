import UIKit

class SafeAreaBottomViewController: UIViewController {
    
    private lazy var bottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .purple
        return view
    }()
    
    private lazy var inBottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        view.addSubview(bottomView)
        bottomView.addSubview(inBottomView)
        
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0.0),
            bottomView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0.0),
            bottomView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0.0)
        ])
        
        NSLayoutConstraint.activate([
            inBottomView.widthAnchor.constraint(equalToConstant: 120.0),
            inBottomView.heightAnchor.constraint(equalToConstant: 70.0)
        ])
        
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                inBottomView.trailingAnchor.constraint(equalTo: bottomView.safeAreaLayoutGuide.trailingAnchor, constant: -25.0),
                inBottomView.bottomAnchor.constraint(equalTo: bottomView.safeAreaLayoutGuide.bottomAnchor, constant: -25.0),
                inBottomView.topAnchor.constraint(equalTo: bottomView.safeAreaLayoutGuide.topAnchor, constant: 25.0)
            ])
        } else {
            NSLayoutConstraint.activate([
                inBottomView.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -25.0),
                inBottomView.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -25.0),
                inBottomView.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 25.0)
            ])
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
