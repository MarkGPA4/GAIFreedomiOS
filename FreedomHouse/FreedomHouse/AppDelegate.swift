//
//  AppDelegate.swift
//  FreedomHouse
//
//  Created by Mark Li  on 11/10/15.
//  Copyright © 2015 Mark Li . All rights reserved.
//

import UIKit
import Parse
import Bolts
import FBSDKCoreKit
import ParseFacebookUtilsV4

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // [Optional] Power your app with Local Datastore. For more info, go to
        
        Parse.enableLocalDatastore()
        
        // Initialize Parse.
        Parse.setApplicationId("FijKavREcmUcIHiKFxwQ2Ke1iwqDyUsan2CLlbUp",
            clientKey: "uN0I6pkbyyqeaFRv8jmkyYyMU7ZJUHPp2Hb0sI5n")
        
        // [Optional] Track statistics around application opens.
        PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
        PFFacebookUtils.initializeFacebookWithApplicationLaunchOptions(launchOptions);
        
       

        return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    
    func application(application: UIApplication,
        openURL url: NSURL,
        sourceApplication: String?,
        annotation: AnyObject) -> Bool {
            return FBSDKApplicationDelegate.sharedInstance().application(application,
                openURL: url,
                sourceApplication: sourceApplication,
                annotation: annotation)
    }
 
    

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
        print("applicationWillResignActive")
    }

    func applicationDidEnterBackground(application: UIApplication) {
        print("applicationDidEnterBackground")
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        print("applicationWillEnterForeground")
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        print("applicationDidBecomeActive")
        FBSDKAppEvents.activateApp()
        
        
        
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        print("applicationWillTerminate")
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    


}

