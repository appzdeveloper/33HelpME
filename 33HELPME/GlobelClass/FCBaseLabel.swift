

import UIKit

class FCBaseLabel: UILabel {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setup()
    }
    
    //This method does the necessary UI adjustments
    func setup()
    {
        self.font = self.font.withSize((SCREEN_WIDTH/375.0) * self.font.pointSize)
//        if self.text != nil
//        {
//            self.text = self.text?.localized()
//        }
    }
}


class GFCBaseLabelShadow: UILabel {

     /*
        // Only override draw() if you perform custom drawing.
        // An empty implementation adversely affects performance during animation.
        override func draw(_ rect: CGRect) {
            // Drawing code
        }
        */
        required init(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)!
            setup()
        }
        
        //This method does the necessary UI adjustments
        func setup()
        {
            self.font = self.font.withSize((SCREEN_WIDTH/375.0) * self.font.pointSize)
    //        if self.text != nil
    //        {
    //            self.text = self.text?.localized()
    //        }
            
            self.layer.masksToBounds = false
               self.layer.shadowRadius = 4
               self.layer.shadowOpacity = 0.4
               self.layer.shadowColor = UIColor.black.cgColor
               self.layer.shadowOffset = CGSize(width: 0 , height:4)
        }
}
