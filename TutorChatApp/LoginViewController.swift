//
//  LoginViewController.swift
//  TutorChatApp
//
//  Created by Vlad Krupenko on 29.04.17.
//  Copyright © 2017 JaneSV. All rights reserved.
//

import UIKit
import GoogleSignIn

class LoginViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {


    @IBOutlet weak var anonymouslyBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        anonymouslyBtn.layer.borderWidth = 2.0
        anonymouslyBtn.layer.borderColor = UIColor.white.cgColor
        GIDSignIn.sharedInstance().clientID = "147918491606-mdo5ijpq3r09ml2gn89pd9slsneg2ga0.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginAnonymouslyDidTapped(_ sender: Any) {
        print("Login Anonymously did tapped")
        
        Helper.helper.loginAnonymously()
    }
    
    @IBAction func googleLoginDidTapped(_ sender: Any) {
    
        print("Google login did tapped")
        
        GIDSignIn.sharedInstance().signIn()

    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error != nil {
            print(error!.localizedDescription)
            return
        }
        
        print(user.authentication)
        Helper.helper.loginWithGoogle(authentication: user.authentication)
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
