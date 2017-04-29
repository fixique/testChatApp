//
//  Helper.swift
//  TutorChatApp
//
//  Created by Vlad Krupenko on 29.04.17.
//  Copyright © 2017 JaneSV. All rights reserved.
//

import Foundation
import FirebaseAuth
import GoogleSignIn
import UIKit

class Helper {
    static let helper = Helper()
    
    func loginAnonymously() {
        
        FIRAuth.auth()?.signInAnonymously(completion: { (anonymousUser: FIRUser?, error: Error?) in
            if error == nil {
                print("UserID \(anonymousUser!.uid)")
                
                self.switchToNavigationViewController()
            } else {
                print(error!.localizedDescription)
                return
            }
        })
    }
    
    func loginWithGoogle(authentication: GIDAuthentication) {
        let credential = FIRGoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
        
        FIRAuth.auth()?.signIn(with: credential, completion: { (user: FIRUser?, error: Error?) in
            if error != nil {
                print(error!.localizedDescription)
                return
            } else {
//                print(user?.email as? String)
//                print(user?.displayName as? String)
                self.switchToNavigationViewController()
            }
        })
    }

    private func switchToNavigationViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let naviVC = storyboard.instantiateViewController(withIdentifier: "NavigationVC") as! UINavigationController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = naviVC
    }
}
