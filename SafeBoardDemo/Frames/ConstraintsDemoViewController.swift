import UIKit

final class ConstraintsDemoViewController: UIViewController {
    
    let imageView = UIImageView()
    var leadingConstraint: NSLayoutConstraint!
    
    override func loadView() {
        self.view = UIView()
        
        blueSquareCenter()
    }
    
    // Layouts imageView with midori image using NSLayoutConstraint
    // s: cl11, cl12, cl13, cl14
    private func layoutUsingCodeConstraints() {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(NSLayoutConstraint(item: imageView,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .top,
                                              multiplier: 1,
                                              constant: 0))
        
        constraints.append(NSLayoutConstraint(item: imageView,
                                              attribute: .bottom,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .bottom,
                                              multiplier: 1,
                                              constant: 0))
        
        constraints.append(NSLayoutConstraint(item: imageView,
                                              attribute: .leading,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .leading,
                                              multiplier: 1,
                                              constant: 0))
        
        constraints.append(NSLayoutConstraint(item: imageView,
                                              attribute: .trailing,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .trailing,
                                              multiplier: 1,
                                              constant: 0))
        
        NSLayoutConstraint.activate(constraints)
        
        imageView.image = UIImage(named: "midori1")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        leadingConstraint.constant = 20
//        UIView.animate(withDuration: 2) {
//            self.view.layoutIfNeeded()
//        }
    }
    
    // Layouts midori with insets
    // s: cl21, cl22, cl23
    private func layoutUsingVisualConstraints() {
        var constraints = [NSLayoutConstraint]()
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[imageView]-20-|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: ["imageView": imageView])
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-40-[imageView]-40-|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: ["imageView": imageView])
        NSLayoutConstraint.activate(constraints)
        imageView.image = UIImage(named: "midori1")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
    }
    
    // Layouts same square using CenterX, CenterY
    // s: cl31, cl32
    private func blueSquareCenter() {
        let blueSquare = UIView()
        blueSquare.backgroundColor = .blue
        let side: CGFloat = 250
        
        blueSquare.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(blueSquare)
        
        NSLayoutConstraint.activate([
            blueSquare.widthAnchor.constraint(equalToConstant: side),
            blueSquare.heightAnchor.constraint(equalTo: blueSquare.widthAnchor),
            blueSquare.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            blueSquare.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    // Layout using intrinsicContentSize Demo
    private func intrinsicContentSize() {
        let stackView = UIStackView()
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        stackView.backgroundColor = .gray
        
        let customView = CustomView()
        customView.backgroundColor = .blue
        
        stackView.addArrangedSubview(customView)
    }
    
    // Fixing / breaking constraints demos
    
    // Try to layout view with missed constraints
    // s: cl41, cl42
    private func notEnoughConstraintsDemo() {
        let blueSquare = UIView()
        blueSquare.backgroundColor = .blue
        view.addSubview(blueSquare)
        blueSquare.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            blueSquare.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            blueSquare.widthAnchor.constraint(equalToConstant: 250),
            blueSquare.heightAnchor.constraint(equalTo: blueSquare.widthAnchor)
        ])
    }
    
    // Try to layout view which contains extra constraints
    // s: cl51, cl52
    private func extraConstraintsDemo() {
        let blueSquare = UIView()
        blueSquare.backgroundColor = .blue
        view.addSubview(blueSquare)
        blueSquare.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            blueSquare.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            blueSquare.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            blueSquare.widthAnchor.constraint(equalToConstant: 250),
            blueSquare.widthAnchor.constraint(equalToConstant: 251),
            blueSquare.heightAnchor.constraint(equalTo: blueSquare.widthAnchor)
        ])
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
