//
//  Struct.swift
//  
//
//  Created by Kevin Klaebe on 13.01.21.
//

extension Analytics {
    /**
     A shared instance of [Analytics](s-source-tag://Analytics). Call [bootstrap](x-source-tag://bootstrap) before accessing this variable or else the provided instance will log to no handler.
     */
    public static var shared: Analytics = Analytics(handlers: [])
    
    /**
     Bootstraps the shared instance of Analytics.
     - Tag: bootstrap
     - Parameters:
        - handlers: An array of handlers that will be passed to the shared instance of Analytics
     */
    public static func bootstrap(_ handlers: [AnalyticsHandler]) {
        Analytics.shared = Analytics(handlers: handlers)
    }
}
