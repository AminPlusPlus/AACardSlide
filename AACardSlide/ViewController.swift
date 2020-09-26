//
//  ViewController.swift
//  AACardSlide
//
//  Created by Aminjoni Abdullozoda on 9/26/20.
//

import UIKit
import Combine

class ViewController: UIViewController {

    
    //MARK: - UI Elements
    @IBOutlet var containerCardView : UIView!
    
    
    var cancellable : AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }

    
    private func setupView() {
        (0...5).forEach { (i) in
        
            let crewView = AACardView()
            crewView.translatesAutoresizingMaskIntoConstraints = false
            
            containerCardView.addSubview(crewView)
            crewView.setupConstrains()
            
            crewView.heightAnchor.constraint(equalTo: containerCardView.heightAnchor).isActive = true
            crewView.widthAnchor.constraint(equalTo: containerCardView.widthAnchor).isActive = true
            
            
            cancellable = crewView.gestureValue.sink(receiveValue: { value in
                
                let val = 0.5 * (abs(value) / 100)
                print(val )
                
                if val <= 1 {
                    self.containerCardView.subviews[0].transform = CGAffineTransform(scaleX: val, y:  val)
                    self.containerCardView.subviews[0].alpha = val
                }
              
            })
           
        
        }
    }

}

