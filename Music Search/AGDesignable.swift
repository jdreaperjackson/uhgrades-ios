//
//  Created by John D. Jackson on 9/22/21.
//

import UIKit
import CoreLocation
import Foundation
// you can set cornerRadius,borderWidth., ect in side storeboard.
@IBDesignable
class DesignableView: UIView {
}

@IBDesignable
class DesignableTextView: UITextView {
}

@IBDesignable
class DesignableButton: UIButton {
}

@IBDesignable
class DesignableLabel: UILabel {
}

@IBDesignable
class DesignableImageView: UIImageView {
}

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}

extension UITextField{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
}

@IBDesignable
class PlaceHolderTextView: UITextView {

    @IBInspectable var placeholder: String = "" {
         didSet{
             updatePlaceHolder()
        }
    }

    @IBInspectable var placeholderColor: UIColor = UIColor.gray {
        didSet {
            updatePlaceHolder()
        }
    }

    private var originalTextColor = UIColor.darkText
    private var originalText: String = ""

    private func updatePlaceHolder() {

        if self.text == "" || self.text == placeholder  {

            self.text = placeholder
            self.textColor = placeholderColor
            if let color = self.textColor {

                self.originalTextColor = color
            }
            self.originalText = ""
        } else {
            self.textColor = self.originalTextColor
            self.originalText = self.text
        }

    }

    override func becomeFirstResponder() -> Bool {
        let result = super.becomeFirstResponder()
        self.text = self.originalText
        self.textColor = self.originalTextColor
        return result
    }
    override func resignFirstResponder() -> Bool {
        let result = super.resignFirstResponder()
        updatePlaceHolder()

        return result
    }
}
