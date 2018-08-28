//
//  GoogleAnalyticsFunctions.swift
//  MERP-NSD
//
//  Created by Suman on 6/11/18.
//  Copyright © 2018 Veenus Chhabra. All rights reserved.
//

import Foundation

//struct Analytics {
//    static func trackEvent(withScreen screen: String, category: String, label: String, action:String, value: Int? = nil) {
//        guard
//            let tracker = GAI.sharedInstance().defaultTracker,
//            let builder = GAIDictionaryBuilder.createEvent(withCategory: category, action: action, label: label, value: NSNumber(integerLiteral: value ?? 0))
//            else { return }
//
//        tracker.set(kGAIScreenName, value: screen)
//        tracker.send(builder.build() as [NSObject : AnyObject])
//
//    }
//
//    static func trackPageView(withScreen screen: String) {
//        guard
//            let tracker = GAI.sharedInstance().defaultTracker,
//            let builder = GAIDictionaryBuilder.createScreenView()
//            else { return }
//
//        tracker.set(kGAIScreenName, value: screen)
//        tracker.send(builder.build() as [NSObject : AnyObject])
//    }
//
////    enum Actions: String {
////        case search = "Search"
////        case tap = "Tap"
////        case toggle = "Toggle"
////    }
////
////    enum Screen: String {
////        case exampleScreenName = "exampleScreenName"
////    }
//}
