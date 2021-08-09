//
//  ViewAdditions.swift
//  EZDeals
//
//  Created by Narsun on 30/03/2019.
//  Copyright © 2019 Narsun. All rights reserved.
//

import Foundation
import UIKit
import ObjectiveC

extension NSObject {
    var classIdentifier: String {
        return String(describing: type(of: self))
    }
    
    class var classIdentifier: String {
        return String(describing: self)
    }
    
    class var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
}

extension UIFont {
    static func availableFonts() {
        // Get all fonts families
        for family in UIFont.familyNames {
            //            log("\(family)")
            // Show all fonts for any given family
            for name in UIFont.fontNames(forFamilyName: family) {
                //                log("   \(name)")
            }
        }
    }
}


extension UIImageView {

    func makeRounded() {

        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
extension UIViewController {
    func appBarDesignInExtensions() {
        navigationController?.navigationBar.isTranslucent =  false
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.2877477407, green: 0.2236644924, blue: 0.1979552507, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.largeTitleTextAttributes = [.font: UIFont.systemFont(ofSize: 28)]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        let viewControllerName = String.init(describing: self.classForCoder)
        print("ViewController Name: \(viewControllerName)")
    }
}


// MARK: UIColor
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    static let THEME_YELLOW = UIColor(rgb: 0xFEC110)
    static let THEME_NOTE = UIColor(rgb: 0xFF3D00)
    
}


//class EZTextField: UITextField {
//
//    private func getKeyboardLanguage() -> String? {
//
//        let appDelegate : AppDelegate = AppDelegate.shared
////        if appDelegate.appLanguage == .english {
////            return "en"
////        }else{
////            return "ur"
////        }
//    }
//
//    override var textInputMode: UITextInputModre? {
//        if let language = getKeyboardLanguage() {
//            for tim in UITextInputMode.activeInputModes {
//                if tim.primaryLanguage!.contains(language) {
//                    return tim
//                }
//            }
//        }
//        return super.textInputMode
//    }
//
//}


@IBDesignable extension UILabel {
    
    func adjustAlignment() {
//        if let appLanguage = AppDelegate.shared.getSettings() as? AppLanguage {
//            self.textAlignment = (appLanguage == .english) ? NSTextAlignment.left : NSTextAlignment.right
//        }else{
//            self.textAlignment = NSTextAlignment.left
//        }
    }
    
}


@IBDesignable extension UIView {
    
    func addShadow(opacity: Float, cornerRadius: Float, shadowRadius:Float) {
        
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = CGFloat(shadowRadius)
        self.layer.shadowOffset = .zero
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        
    }
    
    
    /* The color of the shadow. Defaults to opaque black. Colors created
     * from patterns are currently NOT supported. Animatable. */
    //    @IBInspectable var shadowColor: UIColor? {
    //        set {
    //            layer.shadowColor = newValue!.cgColor
    //        }
    //        get {
    //            if let color = layer.shadowColor {
    //                return UIColor(cgColor:color)
    //            }
    //            else {
    //                return nil
    //            }
    //        }
    //    }
    
    /* The opacity of the shadow. Defaults to 0. Specifying a value outside the
     * [0,1] range will give undefined results. Animatable. */
    //    @IBInspectable var shadowOpacity: Float {
    //        set {
    //            layer.shadowOpacity = newValue
    //        }
    //        get {
    //            return layer.shadowOpacity
    //        }
    //    }
    
    /* The shadow offset. Defaults to (0, -3). Animatable. */
    //    @IBInspectable var shadowOffset: CGPoint {
    //        set {
    //            layer.shadowOffset = CGSize(width: newValue.x, height: newValue.y)
    //        }
    //        get {
    //            return CGPoint(x: layer.shadowOffset.width, y:layer.shadowOffset.height)
    //        }
    //    }
    
    /* The blur radius used to create the shadow. Defaults to 3. Animatable. */
    //    @IBInspectable var shadowRadius: CGFloat {
    //        set {
    //            layer.shadowRadius = newValue
    //            layer.shadowPath = UIBezierPath(rect: bounds).cgPath
    ////            layer.shouldRasterize = true
    //        }
    //        get {
    //            return layer.shadowRadius
    //        }
    //    }
    
    //    @IBInspectable var cornerRadius: CGFloat {
    //        set {
    //            layer.cornerRadius = newValue
    //        }
    //        get {
    //            return layer.cornerRadius
    //        }
    //    }
    
    
    //    public var width: CGFloat {
    //        get { return self.frame.size.width }
    //        set { self.frame.size.width = newValue }
    //    }
    //
    //    public var height: CGFloat {
    //        get { return self.frame.size.height }
    //        set { self.frame.size.height = newValue }
    //    }
    
    public var top: CGFloat {
        get { return self.frame.origin.y }
        set { self.frame.origin.y = newValue }
    }
    
  
    
    public var left: CGFloat {
        get { return self.frame.origin.x }
        set { self.frame.origin.x = newValue }
    }
    
    public var centerX: CGFloat{
        get { return self.center.x }
        set { self.center = CGPoint(x: newValue,y: self.centerY) }
    }
    public var centerY: CGFloat {
        get { return self.center.y }
        set { self.center = CGPoint(x: self.centerX,y: newValue) }
    }
    
    public var origin: CGPoint {
        set { self.frame.origin = newValue }
        get { return self.frame.origin }
    }
    
    //    public var size: CGSize {
    //        set { self.frame.size = newValue }
    //        get { return self.frame.size }
    //    }
    
    
}

protocol TopUIViewController {
    func topUIViewController() -> UIViewController?
}

extension Optional {
    func unwraped<T>(defaultV:T) -> T {
        switch self {
        case .some(let value):
            return value as? T ?? defaultV
        case _:
            return defaultV
        }
    }
}

// MARK: UIDevice
public extension UIDevice {
    
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        case "iPod5,1":                                 return "iPod Touch 5"
        case "iPod7,1":                                 return "iPod Touch 6"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
        case "iPhone4,1":                               return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
        case "iPhone7,2":                               return "iPhone 6"
        case "iPhone7,1":                               return "iPhone 6 Plus"
        case "iPhone8,1":                               return "iPhone 6s"
        case "iPhone8,2":                               return "iPhone 6s Plus"
        case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
        case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
        case "iPhone8,4":                               return "iPhone SE"
        case "iPhone10,1", "iPhone10,4":                return "iPhone 8"
        case "iPhone10,2", "iPhone10,5":                return "iPhone 8 Plus"
        case "iPhone10,3", "iPhone10,6":                return "iPhone X"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
        case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
        case "iPad6,11", "iPad6,12":                    return "iPad 5"
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
        case "iPad6,3", "iPad6,4":                      return "iPad Pro 9.7 Inch"
        case "iPad6,7", "iPad6,8":                      return "iPad Pro 12.9 Inch"
        case "iPad7,1", "iPad7,2":                      return "iPad Pro 12.9 Inch 2. Generation"
        case "iPad7,3", "iPad7,4":                      return "iPad Pro 10.5 Inch"
        case "AppleTV5,3":                              return "Apple TV"
        case "AppleTV6,2":                              return "Apple TV 4K"
        case "AudioAccessory1,1":                       return "HomePod"
        case "i386", "x86_64":                          return "Simulator"
        default:                                        return identifier
        }
    }
    
}

extension String {
    
    var length: Int { return self.count }
    
    
    enum RegularExpressions: String {
        case phone = "^\\s*(?:\\+?(\\d{1,3}))?([-. (]*(\\d{3})[-. )]*)?((\\d{3})[-. ]*(\\d{2,4})(?:[-.x ]*(\\d+))?)\\s*$";
        case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}";
        
    }
    
    func isValidEmail(regex: RegularExpressions) -> Bool {
        return isValidEmail(regex: regex.rawValue);
    }
    
    func isValidEmail(regex: String) -> Bool {
        let matches = range(of: regex, options: .regularExpression);
        return matches != nil;
    }
    
    func integerValue() -> Int {
        return Int(self).unwraped(defaultV: 0)
    }
    
    func index(at position: Int, from start: Index? = nil) -> Index? {
        let startingIndex = start ?? startIndex
        return index(startingIndex, offsetBy: position, limitedBy: endIndex)
    }
    
    func character(at position: Int) -> Character? {
        guard position >= 0, let indexPosition = index(at: position) else {
            return nil
        }
        
        //        log(indexPosition)
        
        if self != "" {
            return self[indexPosition]
        }else{
            return nil
        }
        
        //        if endIndex <= indexPosition {
        //        }else{
        //            return "0"
        //        }
        
    }
    
}

extension StringProtocol {
    
    subscript(offset: Int) -> Element {
        return self[index(startIndex, offsetBy: offset)]
    }
    
    subscript(_ range: CountableRange<Int>) -> SubSequence {
        return prefix(range.lowerBound + range.count)
            .suffix(range.count)
    }
    subscript(range: CountableClosedRange<Int>) -> SubSequence {
        return prefix(range.lowerBound + range.count)
            .suffix(range.count)
    }
    
    subscript(range: PartialRangeThrough<Int>) -> SubSequence {
        return prefix(range.upperBound.advanced(by: 1))
    }
    subscript(range: PartialRangeUpTo<Int>) -> SubSequence {
        return prefix(range.upperBound)
    }
    subscript(range: PartialRangeFrom<Int>) -> SubSequence {
        return suffix(Swift.max(0, count - range.lowerBound))
    }
}

extension LosslessStringConvertible {
    var string: String { return String(self) }
}


extension BidirectionalCollection {
    subscript(safe offset: Int) -> Element? {
        guard !isEmpty, let i = index(startIndex, offsetBy: offset, limitedBy: index(before: endIndex)) else { return nil }
        return self[i]
    }
}

extension NSNotification.Name {
    
    static let UpdateQuestionViews = NSNotification.Name("updateQuestionViews")
    static let UpdateSettings = NSNotification.Name("UpdateSettings")
    static let UpdateNotifications = NSNotification.Name("UpdateNotifications")
    static let UPDATE_NUMERIC_QUESTION_BUTTON = NSNotification.Name("UPDATE_NUMERIC_QUESTION_BUTTON")
    static let POPUP_DISMISSED = NSNotification.Name("POPUP_DISMISSED")
    static let networkisreachable = Notification.Name("networkisreachable")
    static let networknotreachable = Notification.Name("networknotreachable")
    static let lownetworkreachable = Notification.Name("lownetworkreachable")
    static let highnetworkreachable = Notification.Name("highnetworkreachable")
    
    static let SOCKETUpdateQuestionNotification = NSNotification.Name("SOCKETUpdateQuestionNotification")
    static let SOCKETUpdateSlotNotification = NSNotification.Name("SOCKETUpdateSlotNotification")
    static let SOCKETUpdateAnswerNotification = NSNotification.Name("SOCKETUpdateAnswerNotification")
    static let SOCKETUpdateOfflineSlotDataNotification = NSNotification.Name("SOCKETUpdateOfflineSlotDataNotification")
    static let SOCKETUpdateStatsNotification = NSNotification.Name("SOCKETUpdateStatsNotification")
    
}

extension UISearchBar {

    // Due to searchTextField property who available iOS 13 only, extend this property for iOS 13 previous version compatibility
    var compatibleSearchTextField: UITextField {
        guard #available(iOS 13.0, *) else { return legacySearchField }
        return self.searchTextField
    }

    private var legacySearchField: UITextField {
        if let textField = self.subviews.first?.subviews.last as? UITextField {
            // Xcode 11 previous environment
            return textField
        } else if let textField = self.value(forKey: "searchField") as? UITextField {
            // Xcode 11 run in iOS 13 previous devices
            return textField
        } else {
            // exception condition or error handler in here
            return UITextField()
        }
    }
}

extension Date {
    
    func isEqualTo(_ date: Date) -> Bool {
        return self == date
    }
    
    func isGreaterThan(_ date: Date) -> Bool {
        return self > date
    }
    
    func isSmallerThan(_ date: Date) -> Bool {
        return self < date
    }
    
    var millisecondsSince1970:Int {
        return Int((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    init(milliseconds:Int) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
    
    func years(sinceDate: Date) -> Int? {
        return Calendar.current.dateComponents([.year], from: sinceDate, to: self).year
    }
    
    func months(sinceDate: Date) -> Int? {
        return Calendar.current.dateComponents([.month], from: sinceDate, to: self).month
    }
    
    func days(sinceDate: Date) -> Int? {
        return Calendar.current.dateComponents([.day], from: sinceDate, to: self).day
    }
    
    func hours(sinceDate: Date) -> Int? {
        return Calendar.current.dateComponents([.hour], from: sinceDate, to: self).hour
    }
    
    func minutes(sinceDate: Date) -> Int? {
        return Calendar.current.dateComponents([.minute], from: sinceDate, to: self).minute
    }
    
    func seconds(sinceDate: Date) -> Int? {
        return Calendar.current.dateComponents([.second], from: sinceDate, to: self).second
    }
    
}

extension Optional {
    
    func unwrapped<T>(defaultV:T) -> T {
        switch self {
        case .some(let value):
            return value as! T
        case _:
            return defaultV
        }
    }
    
    
    
}


extension UIView {
   
   func dropShadow(scale: Bool = true) {
        layer.cornerRadius = 5.0
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 0.7
   }
   
   func addBottomRoundedEdge() {
      let offset: CGFloat = (self.frame.width * 0.5)
      let bounds: CGRect = self.bounds
      
      let rectBounds: CGRect = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width , height: bounds.size.height / 2)
      let rectPath: UIBezierPath = UIBezierPath(rect: rectBounds)
      let ovalBounds: CGRect = CGRect(x: bounds.origin.x - offset / 2, y: bounds.origin.y, width: bounds.size.width + offset , height: bounds.size.height)
      let ovalPath: UIBezierPath = UIBezierPath(ovalIn: ovalBounds)
      rectPath.append(ovalPath)
      
      let maskLayer: CAShapeLayer = CAShapeLayer()
      maskLayer.frame = bounds
      maskLayer.path = rectPath.cgPath
      
      self.layer.mask = maskLayer
   }
   
}



extension UITextField {
   
   //MARK:- Set Image on the right of text fields
   
   func setupRightImage(imageName:String){
      let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
      imageView.image = UIImage(named: imageName)
      let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: 40))
      imageContainerView.addSubview(imageView)
      rightView = imageContainerView
      rightViewMode = .always
      self.tintColor = .lightGray
   }
   
   //MARK:- Set Image on left of text fields
   
   func setupLeftImage(imageName:String){
      let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
      imageView.image = UIImage(named: imageName)
      let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
      imageContainerView.addSubview(imageView)
      leftView = imageContainerView
      leftViewMode = .always
      self.tintColor = .lightGray
   }
   
}
extension UIView {
    
    func addConstraintsWithFormatString(formate: String, views: UIView...) {
        
        var viewsDictionary = [String: UIView]()
        
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: formate, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
        
    }
}


extension UIColor {
    
    static func rgbColor(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        
        return UIColor.init(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
    }
    
    static func colorFromHex(_ hex: String) -> UIColor {
        
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hexString.hasPrefix("#") {
            
            hexString.remove(at: hexString.startIndex)
        }
        
        if hexString.count != 6 {
            
            return UIColor.magenta
        }
        
        var rgb: UInt32 = 0
        Scanner.init(string: hexString).scanHexInt32(&rgb)
        
        return UIColor.init(red: CGFloat((rgb & 0xFF0000) >> 16)/255,
                            green: CGFloat((rgb & 0x00FF00) >> 8)/255,
                            blue: CGFloat(rgb & 0x0000FF)/255,
                            alpha: 1.0)
    }
}
