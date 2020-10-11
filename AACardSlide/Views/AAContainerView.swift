//
//  AAContainerView.swift
//  AACardSlide
//
//  Created by Aminjoni Abdullozoda on 10/11/20.
//

import UIKit
import Combine

final class AAContainerView : UIView {
    
    //MARK:- UI Elements
    private var aView : AACardView!
    private var bView : AACardView!
    
    var cancellable : AnyCancellable?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupView()
    }
    

    private func setupView(){
        
        aView = AACardView()
        bView = AACardView()
        
        aView.translatesAutoresizingMaskIntoConstraints = false
        bView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(aView)
        addSubview(bView)
        
        aView.setupConstrains()
        bView.setupConstrains()
        
        aView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        aView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        bView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        bView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
        aView.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        aView.alpha = 0

        cancellable = bView.gestureValue.sink(receiveValue: { value in

                let val = 0.5 * (abs(value) / 100)
                print(val)
            if val < 1 {
            self.aView.transform = CGAffineTransform(scaleX: val, y: val)
                self.aView.alpha = val
            }
             
            })
   
    
    }
    
}
