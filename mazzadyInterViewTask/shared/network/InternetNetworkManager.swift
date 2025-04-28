//
//  InternetNetworkManager.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 28/04/2025.
//

import Foundation
import SystemConfiguration

class InternetetworkManager {
    
    static let shared = InternetetworkManager()
    
    private init() {}
    
    func isConnectedToInternet() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            let isReachable = flags.contains(.reachable)
            let needsConnection = flags.contains(.connectionRequired)
            return isReachable && !needsConnection
        }
        
        return false
    }
}
