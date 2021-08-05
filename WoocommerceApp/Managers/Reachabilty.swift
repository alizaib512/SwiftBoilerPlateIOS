//
//  Reachabilty.swift
//  AdamsGroup
//
//  Created by Waseem Nasir on 12/21/18.
//  Copyright © 2018 narsun. All rights reserved.
//

import Foundation
import Alamofire
import CoreTelephony
import SystemConfiguration

public class Reachability {
    
    class func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }
        
        /* Only Working for WIFI
         let isReachable = flags == .reachable
         let needsConnection = flags == .connectionRequired
         
         return isReachable && !needsConnection
         */
        
        // Working for Cellular and WIFI
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        let ret = (isReachable && !needsConnection)
        
        return ret
        
    }
}

class InternetkManager {
    
    enum NetworkType : String {
        case g4 = "4G"
        case g3 = "3G"
        case g2 = "2G"
    }
    
    private var currentNetwork = NetworkType.g4
    
    //shared instance
    static let shared = InternetkManager()
    let reachabilityManager = Alamofire.NetworkReachabilityManager(host: "https://www.google.com")
    
//    func startNetworkReachabilityObserver() {
//        reachabilityManager?.listener = { status in
//            switch status {
//            case .notReachable:
////                Log("The network is not reachable")
//                NotificationCenter.default.post(name: .networknotreachable, object: nil)
//            case .unknown :
////                Log("It is unknown whether the network is reachable")
//                NotificationCenter.default.post(name: .networknotreachable, object: nil)
//            case .reachable(.ethernetOrWiFi):
////                Log("The network is reachable over the WiFi connection")
//                NotificationCenter.default.post(name: .networkisreachable, object: nil)
//            case .reachable(.wwan):
//                NotificationCenter.default.post(name: .networkisreachable, object: nil)
////                Log("The network is reachable over the WWAN connection")
//                
//                let netinfo = CTTelephonyNetworkInfo();
//                if netinfo.currentRadioAccessTechnology == CTRadioAccessTechnologyGPRS {
//                     self.currentNetwork = .g2
//                    NotificationCenter.default.post(name: .lownetworkreachable, object: nil)
//                } else if netinfo.currentRadioAccessTechnology == CTRadioAccessTechnologyEdge {
//                    self.currentNetwork = .g2
//                    NotificationCenter.default.post(name: .lownetworkreachable, object: nil)
//                } else if netinfo.currentRadioAccessTechnology == CTRadioAccessTechnologyCDMA1x {
//                    self.currentNetwork = .g2
//                    NotificationCenter.default.post(name: .lownetworkreachable, object: nil)
//                } else if netinfo.currentRadioAccessTechnology == CTRadioAccessTechnologyWCDMA {
//                    self.currentNetwork = .g3
//                } else if netinfo.currentRadioAccessTechnology == CTRadioAccessTechnologyHSDPA {
//                    self.currentNetwork = .g3
//                } else if netinfo.currentRadioAccessTechnology == CTRadioAccessTechnologyHSUPA {
//                    self.currentNetwork = .g3
//                }  else if netinfo.currentRadioAccessTechnology == CTRadioAccessTechnologyCDMAEVDORev0 {
//                    self.currentNetwork = .g3
//                } else if netinfo.currentRadioAccessTechnology == CTRadioAccessTechnologyCDMAEVDORevA {
//                    self.currentNetwork = .g3
//                } else if netinfo.currentRadioAccessTechnology == CTRadioAccessTechnologyCDMAEVDORevB {
//                    self.currentNetwork = .g3
//                } else if netinfo.currentRadioAccessTechnology == CTRadioAccessTechnologyeHRPD {
//                    self.currentNetwork = .g3
//                } else if netinfo.currentRadioAccessTechnology == CTRadioAccessTechnologyLTE {
//                    self.currentNetwork = .g4
//                    NotificationCenter.default.post(name: .highnetworkreachable, object: nil)
//                }
//            }
//        }
//        reachabilityManager?.startListening()
//    }
    
    var isReachable: Bool {
        get {
            return reachabilityManager?.isReachable ?? false
        }
    }
    
    var currentNetworkType: NetworkType {
        get {
            return self.currentNetwork
        }
    }
}



