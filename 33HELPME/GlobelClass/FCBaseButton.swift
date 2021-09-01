

import UIKit

class FCBaseButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var indexPath : IndexPath?
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setup()
    }
    
    //This method does the necessary UI adjustments
    func setup()
    {
        self.titleLabel?.font = self.titleLabel?.font.withSize((SCREEN_WIDTH/375.0) * (self.titleLabel?.font.pointSize)!)
    }
}

class FCUISwitch : UISwitch{
  var indexPath : IndexPath?
    
    required init(coder aDecoder: NSCoder) {
          super.init(coder: aDecoder)!
         
      }
}
