import UIKit

// Swift: Layout Guide Introduction (AutoLayout) – Xcode, iOS, 2021
// https://www.youtube.com/watch?v=4qPcMGiSADA&ab_channel=iOSAcademy

class MyView: UIView {
    private var anotherView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemRed
        
        clipsToBounds = true
        anotherView.translatesAutoresizingMaskIntoConstraints = false
        anotherView.backgroundColor = .systemYellow
        addSubview(anotherView)
        
        let topGuide = UILayoutGuide()
        let bottomGuide = UILayoutGuide()
        
        addLayoutGuide(topGuide)
        addLayoutGuide(bottomGuide)
        
        NSLayoutConstraint.activate([
            topGuide.leadingAnchor.constraint(equalTo: leadingAnchor),
            topGuide.trailingAnchor.constraint(equalTo: trailingAnchor),
            topGuide.topAnchor.constraint(equalTo: topAnchor),
            topGuide.heightAnchor.constraint(equalToConstant: 100),
            anotherView.leadingAnchor.constraint(equalTo: leadingAnchor),
            anotherView.trailingAnchor.constraint(equalTo: trailingAnchor),
            anotherView.topAnchor.constraint(equalTo: topGuide.bottomAnchor),
            anotherView.bottomAnchor.constraint(equalTo: bottomGuide.topAnchor),
            bottomGuide.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomGuide.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomGuide.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomGuide.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class LayoutGuideViewController: UIViewController {
    
    let myView = MyView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBlue
        view.addSubview(myView)
        
        NSLayoutConstraint.activate([
            myView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            myView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
