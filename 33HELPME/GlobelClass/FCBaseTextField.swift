
import UIKit

protocol  FCBaseTextFieldDelegate{
    func userCurrentString(str:String)
      func endEdeting()
}

class FCBaseTextField: UITextField {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var delegateText : FCBaseTextFieldDelegate?
    
    @IBInspectable var isPasteEnabled: Bool = true
    
    @IBInspectable var isSelectEnabled: Bool = true
    
    @IBInspectable var isSelectAllEnabled: Bool = true
    
    @IBInspectable var isCopyEnabled: Bool = true
    
    @IBInspectable var isCutEnabled: Bool = true
    
    @IBInspectable var isDeleteEnabled: Bool = false
    
    @IBInspectable var placeHolderColor: UIColor = .lightGray {
        didSet {
            
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: placeHolderColor])
        }
        
    }


    
    @IBInspectable var shouldAddLeftPadding: Bool = false {
        didSet {
            if shouldAddLeftPadding == true
            {
            let paddingView = UIView(frame: CGRect(x: 0,y: 0,width: 10,height: self.frame.height))
            self.leftView = paddingView
            self.leftViewMode = UITextField.ViewMode.always
            }
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setup()
    }
    
    //This method does the necessary UI adjustments
    func setup()
    {
        self.delegate = self
        self.font = self.font?.withSize((SCREEN_WIDTH/375.0) * (self.font?.pointSize)!)
        self.autocapitalizationType = .sentences
       
    }
    
  
    
}
extension FCBaseTextField:UITextFieldDelegate
{
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        /// for phone
        if textField.tag == 1001{
           
            let maxLength = 30
             let currentString: NSString = textField.text! as NSString
             let newString: NSString =
                 currentString.replacingCharacters(in: range, with: string) as NSString
            delegateText?.userCurrentString(str: newString as String)
             return  newString.length <= maxLength
        }
        return true
    }
    
    
    func  textFieldDidEndEditing(_ textField: UITextField) {
        delegateText?.endEdeting()
    }
}
