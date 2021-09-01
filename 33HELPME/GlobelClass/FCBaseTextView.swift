//
//  FCBaseTextView.swift
//  Snaptiles
//
//  Created by Cgt_Jpr_Mac_BalkaranS on 7/12/19.
//  Copyright © 2019 Cgt_Jpr_Mac_BalkaranS. All rights reserved.
//

import UIKit



class FCBaseTextView: UITextView {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    open var heightConstraint: NSLayoutConstraint?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setup()
    }
    
    //This method does the necessary UI adjustments
    func setup()
    {
        self.font = self.font?.withSize((SCREEN_WIDTH/375.0) * (self.font?.pointSize)!)
        self.layer.cornerRadius = 5
    }
}
