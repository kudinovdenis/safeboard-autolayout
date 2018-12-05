import UIKit

final class FramesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout1()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            self.animatedLayout()
        }
    }
    
    // Layouts Gray square on top of the Blue one.
    // s: l11, l12
    private func layout1() {
        let blueSquare = UIView()
        blueSquare.backgroundColor = .blue
        let side: CGFloat = 250
        blueSquare.frame = CGRect(x: 50,
                                  y: 50,
                                  width: side,
                                  height: side)
        view.addSubview(blueSquare)
    }
    
    // Layouts blue square in the center of view
    // s: l2
    private func layout2() {
        let blueSquare = UIView()
        blueSquare.backgroundColor = .blue
        let side: CGFloat = 100
        blueSquare.frame = CGRect(x: view.center.x - side / 2.0,
                                  y: view.center.y - side / 2.0,
                                  width: side,
                                  height: side)
        
        view.addSubview(blueSquare)
    }
    
    // Layouts blue square and animates it diagonally
    // @ see viewDidAppear(_:)
    // s: l31, l32
    private func animatedLayout() {
        let blueSquare = UIView()
        blueSquare.backgroundColor = .blue
        let side: CGFloat = 100
        blueSquare.frame = CGRect(x: 0,
                                  y: 0,
                                  width: side,
                                  height: side)
        
        view.addSubview(blueSquare)
        
        UIView.animate(withDuration: 2) {
            blueSquare.frame = CGRect(x: self.view.frame.size.width - side,
                                      y: self.view.frame.size.height - side,
                                      width: side,
                                      height: side)
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
