//
//  CommonMethods.swift
//  Wapp
//
//  Created by hassan on 04/06/2020.
//  Copyright © 2020 Hassan. All rights reserved.
//

import UIKit
import Lottie
import MaterialComponents.MaterialSnackbar
import MaterialComponents.MaterialDialogs
class CommonMethods: NSObject {
   
   static var isDeleteClicked = Bool()
   static var isCancelClicked = Bool()
   
   
   
   
   
   
   static func setUpNavigationBar(navigationItem : UINavigationItem)
   {
      
      let rightItem = UIBarButtonItem()
      var btnLeaderBoard: UIButton?
      var btnPoints: UIButton?
      btnLeaderBoard = UIButton(frame: CGRect(x: 0, y: 0, width: 45, height: 44))
      btnLeaderBoard?.setImage(UIImage(named: "Leader_Board"), for: .normal)
      
      btnPoints = UIButton(frame: CGRect(x: 45, y: 10, width: 45, height: 24))
      btnPoints?.layer.cornerRadius = 12
      //   btnPoints?.backgroundColor = Colors.APP_BLUE_COLOR
      btnPoints?.titleLabel?.font = UIFont.init(name: "Montserrat-Bold", size: 15)
      btnPoints?.setTitle("0", for: .normal)
      
      let rightCustomView = UIView(frame: CGRect(x: 0, y: 0, width: 90, height: 44))
      rightCustomView.addSubview(btnLeaderBoard!)
      rightCustomView.addSubview(btnPoints!)
      rightItem.customView = rightCustomView
      
      navigationItem.rightBarButtonItems  = [rightItem]
   }
   static func showErrorAlertView(title:String, description:String, view:UIViewController) -> Void
   {
      //        let alert = UIAlertController(title: title,
      //                                      message: description,
      //                                      preferredStyle: .alert)
      //        let defaultButton = UIAlertAction(title: "OK",
      //                                          style: .default) {(_) in
      //                                            // your defaultButton action goes here
      //        }
      //
      //        alert.addAction(defaultButton)
      //        view.present(alert, animated: true) {
      //            // completion goes here
      //        }
      
      let alertController = MDCAlertController(title: title, message: description)
      let action = MDCAlertAction(title:"OK") { (action) in print("OK") }
      alertController.addAction(action)
      
      view.present(alertController, animated:true){
         
      }
      
      
   }
   
   
   
   
   static func doSomething(view:UIViewController ,actionClosure: @escaping () -> Void) {
      
      
      
      //        let dialogMessage = UIAlertController(title: "No internet Connection", message: "Please Try Again!", preferredStyle: .alert)
      //
      //          // Create Cancel button with action handlder
      //          let cancel = UIAlertAction(title: "Retry!", style: .cancel)  {(action: UIAlertAction!) in actionClosure()
      //              print("Retry button tapped")
      //           // self.getAllServices()
      //
      //          }
      //
      //          //Add OK and Cancel button to dialog message
      //
      //          dialogMessage.addAction(cancel)
      //
      //          // Present dialog message to user
      //          view.present(dialogMessage, animated: true, completion: nil)
      
      let action = MDCSnackbarMessageAction()
      let actionHandler = {() in
         
         actionClosure()
         
      }
      
      action.handler = actionHandler
      action.title = "Try Again"
      let message = MDCSnackbarMessage()
      message.action = action
      message.text = "please check your internet!"
      message.duration = 5.0
      MDCSnackbarManager.default.show(message)
      MDCSnackbarManager.default.snackbarMessageViewBackgroundColor = #colorLiteral(red: 0.8953306675, green: 0.3427555561, blue: 0.1417167187, alpha: 1)
      
      
      
      
   }
   
   //MARK:- Custom Alert
   
   static func customAlert(view:UIViewController ,title :String? , description : String?,actionClosure: @escaping () -> Void) {
      
      let alertController = MDCAlertController(title: title, message: description)
      alertController.addAction(MDCAlertAction(title:"OK") { (action) in
         actionClosure()
      
      })
      
      alertController.addAction( MDCAlertAction(title:"Cancel") { (action) in
                                    
                                    print("OK") })
      view.present(alertController, animated: true, completion: nil)
      
      
      
   }
   
   
   
   //    static func showInternetErrorAlertView(){
   //    let dialogMessage = UIAlertController(title: "No internet Connection", message: "Please Try Again!", preferredStyle: .alert)
   //
   //      // Create Cancel button with action handlder
   //      let cancel = UIAlertAction(title: "Retry!", style: .cancel) { (action) -> Void in
   //          print("Retry button tapped")
   //        self.getAllServices()
   //      }
   //
   //      //Add OK and Cancel button to dialog message
   //
   //      dialogMessage.addAction(cancel)
   //
   //      // Present dialog message to user
   //      self.present(dialogMessage, animated: true, completion: nil)
   //
   //    }
   static func isValidEmail(email:String) -> Bool {
      // print("validate calendar: \(testStr)")
      let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
      
      let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
      return emailTest.evaluate(with: email)
   }
   
   static func setValueInUserDefault(key:String, value:String)
   {
      let defaults = UserDefaults.standard;
      defaults.setValue(value, forKey: key);
      defaults.synchronize();
   }
   
   static func getValueFromUserDefault(key:String) -> AnyObject?
   {
      let defaults = UserDefaults.standard;
      if(defaults.value(forKey: key) != nil)
      {
         return defaults.value(forKey: key) as AnyObject;
      }
      return nil
   }
   
   
   
   
   static func removeValueFromUserDefault(key:String)
   {
      let defaults = UserDefaults.standard;
      defaults.removeObject(forKey: key);
      defaults.synchronize();
   }
   
   static func swipeRightToLeft(view:UIView)
   {
      let screenRect = UIScreen.main.bounds
      // Animate the transition.
      UIView.animate(withDuration: 0.25, animations: { () -> Void in
         view.frame = CGRect(x:-screenRect.size.width, y:view.frame.origin.y, width:view.frame.size.width,height:view.frame.size.height)
      }) { (Finished) -> Void in
         view.alpha=0
      }
   }
   
   static func startAnimation(animation: AnimationView , view : UIView){
      
      view.isHidden = false
    animation.frame = view.bounds 
      animation.animation = Animation.named("loder")
      animation.contentMode = .scaleAspectFit
      animation.backgroundColor = .white
      animation.loopMode = .loop
    if animation.isAnimationPlaying == false {
        animation.play()
       }
     // animation.play()
      view.addSubview(animation)
      // self.sendSubviewToBack(view: animationView)
      // self.view.sendSubviewToBack(animationView)
      view.sendSubviewToBack(animation)
      //   perform(#selector(LoginSignupViewController.playVideo), with: self, afterDelay: 2)
      //   self.navigationController?.popViewController(animated: true)
   }
   //animation for splash screen
   static func startAnimationForSplash(animation: AnimationView , view : UIView){
      
      view.isHidden = false
      animation.frame = view.bounds
      animation.animation = Animation.named("splash")
      animation.contentMode = .scaleAspectFit
      animation.backgroundColor = .clear
      animation.loopMode = .loop
      animation.play()
      view.addSubview(animation)
      // self.sendSubviewToBack(view: animationView)
      // self.view.sendSubviewToBack(animationView)
      view.sendSubviewToBack(animation)
      //   perform(#selector(LoginSignupViewController.playVideo), with: self, afterDelay: 2)
      //   self.navigationController?.popViewController(animated: true)
   }
   
   static func swipeLeftToRight(view:UIView)
   {
      let screenRect = UIScreen.main.bounds
      view.frame = CGRect(x:-screenRect.size.width, y:view.frame.origin.y, width:view.frame.size.width,height:view.frame.size.height)
      // Animate the transition.
      UIView.animate(withDuration: 0.25, animations: { () -> Void in
         view.frame = CGRect(x:0, y:view.frame.origin.y, width:view.frame.size.width,height:view.frame.size.height)
      }) { (Finished) -> Void in
      }
   }
   
   static func fadeIn(view:UIView)
   {
      view.alpha=0
      // Animate the transition.
      UIView.animate(withDuration: 0.5, animations: { () -> Void in
         view.alpha=1
      }) { (Finished) -> Void in
      }
   }
   static func localizeString(simpleStr:String) -> String
   {
      let localizedStr = NSLocalizedString(simpleStr, comment: "")
      return localizedStr
   }
   
   static func secondsToHoursMinutesSeconds (seconds : Int) -> (String) {
      let hours = Int(seconds/3600)
      
      let minutes = Int((seconds%3600)/60)
      var newMinutes = String()
      if(minutes < 10)
      {
         newMinutes = "0\(minutes)"
      }
      else
      {
         newMinutes = "\(minutes)"
      }
      
      
      let secondsI = Int((seconds % 3600) % 60)
      var newsecondsI = String()
      if(secondsI < 10)
      {
         newsecondsI = "0\(secondsI)"
      }
      else
      {
         newsecondsI = "\(secondsI)"
      }
      
      
      var newhours = String()
      if(hours < 10)
      {
         newhours = "0\(hours)"
      }
      else
      {
         newhours = "\(hours)"
      }
      if(hours == 0)
      {
         return "\(newMinutes):\(newsecondsI)"
      }
      else
      {
         return "\(newhours):\(minutes):\(secondsI)"
      }
   }
   static func timeStampToTime(unixTimestamp : Int) -> String
   {
      var localTimeZoneAbbreviation: String { return TimeZone.current.abbreviation() ?? "" }
      
      let date = Date(timeIntervalSince1970: TimeInterval(unixTimestamp))
      
      let dateFormatter = DateFormatter()
      dateFormatter.timeZone = TimeZone(abbreviation: localTimeZoneAbbreviation)
      dateFormatter.locale = NSLocale.current
      dateFormatter.dateFormat = "HH:mm"
      let strDate = dateFormatter.string(from: date)
      return strDate
   }
   
   static func convertDateFormater(_ givenDate: String, givenFormate : String, reqFormate : String) -> String
   {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = givenFormate
      let date = dateFormatter.date(from: givenDate)
      dateFormatter.dateFormat = reqFormate
      if(givenDate == "0")
      {
         return "Jan 01, 1970"
      }
      return  dateFormatter.string(from: date!)
   }
   static func generateQRCode(from string: String) -> UIImage? {
      let data = string.data(using: String.Encoding.ascii)
      
      if let filter = CIFilter(name: "CIQRCodeGenerator") {
         filter.setValue(data, forKey: "inputMessage")
         let transform = CGAffineTransform(scaleX: 3, y: 3)
         
         if let output = filter.outputImage?.transformed(by: transform) {
            return UIImage(ciImage: output)
         }
      }
      return nil
   }
}
