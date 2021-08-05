//
//  UIWindowTransitionsManager.swift
//  Daniele Margutti
//
//  Created by Daniele Margutti on 31/10/2017.
//  Copyright © 2017 Daniele Margutti. All rights reserved.
//

import Foundation
import UIKit

public extension UIWindow {
	
	/// Transition Options
	public struct TransitionOptions {
		
		/// Curve of animation
		///
		/// - linear: linear
		/// - easeIn: ease in
		/// - easeOut: ease out
		/// - easeInOut: ease in - ease out
		public enum Curve {
			case linear
			case easeIn
			case easeOut
			case easeInOut
			
			/// Return the media timing function associated with curve
			internal var function: CAMediaTimingFunction {
//                let key: String!
				switch self {
                case .linear:
                    return CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear) //convertFromCAMediaTimingFunctionName(CAMediaTimingFunctionName.linear)
				case .easeIn:
                    return CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn) // convertFromCAMediaTimingFunctionName(CAMediaTimingFunctionName.easeIn)
				case .easeOut:
                    return CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
//                    convertFromCAMediaTimingFunctionName(CAMediaTimingFunctionName.easeOut)
				case .easeInOut:
                    return CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//                    convertFromCAMediaTimingFunctionName(CAMediaTimingFunctionName.easeInEaseOut)
				}
//                return CAMediaTimingFunction(name: convertToCAMediaTimingFunctionName(key))
			}
		}
		
		/// Direction of the animation
		///
		/// - fade: fade to new controller
		/// - toTop: slide from bottom to top
		/// - toBottom: slide from top to bottom
		/// - toLeft: pop to left
		/// - toRight: push to right
		public enum Direction {
			case fade
			case toTop
			case toBottom
			case toLeft
			case toRight
			
			/// Return the associated transition
			///
			/// - Returns: transition
			internal func transition() -> CATransition {
				let transition = CATransition()
                transition.type = CATransitionType.push
				switch self {
				case .fade:
                    transition.type = CATransitionType.fade
					transition.subtype = nil
				case .toLeft:
                    transition.subtype = CATransitionSubtype.fromLeft
				case .toRight:
                    transition.subtype = CATransitionSubtype.fromRight
				case .toTop:
                    transition.subtype = CATransitionSubtype.fromTop
				case .toBottom:
                    transition.subtype = CATransitionSubtype.fromBottom
				}
				return transition
			}
		}
		
		/// Background of the transition
		///
		/// - solidColor: solid color
		/// - customView: custom view
		public enum Background {
			case solidColor(_: UIColor)
			case customView(_: UIView)
		}
		
		/// Duration of the animation (default is 0.20s)
		public var duration: TimeInterval = 0.20
		
		/// Direction of the transition (default is `toRight`)
		public var direction: TransitionOptions.Direction = .toRight
		
		/// Style of the transition (default is `linear`)
		public var style: TransitionOptions.Curve = .linear
		
		/// Background of the transition (default is `nil`)
		public var background: TransitionOptions.Background? = nil
		
		/// Initialize a new options object with given direction and curve
		///
		/// - Parameters:
		///   - direction: direction
		///   - style: style
		public init(direction: TransitionOptions.Direction = .toRight, style: TransitionOptions.Curve = .linear) {
			self.direction = direction
			self.style = style
		}
		
		public init() { }
		
		/// Return the animation to perform for given options object
		internal var animation: CATransition {
			let transition = self.direction.transition()
			transition.duration = self.duration
			transition.timingFunction = self.style.function
			return transition
		}
	}
	
	
	/// Change the root view controller of the window
	///
	/// - Parameters:
	///   - controller: controller to set
	///   - options: options of the transition
	public func setRootViewController(_ controller: UIViewController, options: TransitionOptions = TransitionOptions()) {
		
		var transitionWnd: UIWindow? = nil
		if let background = options.background {
			transitionWnd = UIWindow(frame: UIScreen.main.bounds)
			switch background {
			case .customView(let view):
				transitionWnd?.rootViewController = UIViewController.newController(withView: view, frame: transitionWnd!.bounds)
                
			case .solidColor(let color):
				transitionWnd?.backgroundColor = color
			}
            
			transitionWnd?.makeKeyAndVisible()
		}
		
		// Make animation
		self.layer.add(options.animation, forKey: kCATransition)
		self.rootViewController = controller
		self.makeKeyAndVisible()
		
		if let wnd = transitionWnd {
			DispatchQueue.main.asyncAfter(deadline: (.now() + 1 + options.duration), execute: {
				wnd.removeFromSuperview()
                
			})
		}
	}
}

internal extension UIViewController {
	
	/// Create a new empty controller instance with given view
	///
	/// - Parameters:
	///   - view: view
	///   - frame: frame
	/// - Returns: instance
	static func newController(withView view: UIView, frame: CGRect) -> UIViewController {
		view.frame = frame
    
		let controller = UIViewController()
		controller.view = view
		return controller
	}
	
}

// Helper function inserted by Swift 4.2 migrator.
//fileprivate func convertFromCAMediaTimingFunctionName(_ input: CAMediaTimingFunctionName) -> String {
//    return input.rawValue
//}
//
//// Helper function inserted by Swift 4.2 migrator.
//fileprivate func convertToCAMediaTimingFunctionName(_ input: String) -> CAMediaTimingFunctionName {
//    return CAMediaTimingFunctionName(rawValue: input)
//}