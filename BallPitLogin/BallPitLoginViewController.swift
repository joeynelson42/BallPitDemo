//
//  BallPitLoginViewController.swift
//  BallPitLogin
//
//  Created by Joey on 2/5/16.
//  Copyright © 2016 NelsonJE. All rights reserved.
//

import UIKit

class BallPitLoginViewController: UIViewController{
    
    
    // MARK: Properties
    var ballPitView = BallPitLoginView()
    var hasAnimated = false
    let welcomes = ["welcome", "välkommen", "ようこそ", "bienvenido", "bem vinda", "tervetuloa", "خوش آمدی", "Добро пожаловат"]
    var welcomeIndex = 0
    
    
    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view = ballPitView
        addTargets()
        
        ballPitView.welcomeLabel.text = "welcome"
    }
    
    override func viewDidAppear(animated: Bool) {
        ballPitView.ballDrop()
    }
    
    func addTargets(){
        self.ballPitView.loginButton.addTarget(self, action: "growLogin", forControlEvents: .TouchUpInside)
        self.ballPitView.signupButton.addTarget(self, action: "growSignUp", forControlEvents: .TouchUpInside)
        self.ballPitView.GObutton.addTarget(self, action: "resetButtons", forControlEvents: .TouchUpInside)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    // MARK: Triangle Animations
    
    func growLogin(){
        ballPitView.addLoginTextFields()
        
        if hasAnimated{
            resetButtons(growLogin)
            return
        }
        
        UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.5, options: [], animations: {
            self.ballPitView.welcomeLabel.alpha = 0.0001
            
            self.ballPitView.loginButton.transform = CGAffineTransformMakeScale(5, 5)
            let labelT1 = CGAffineTransformMakeTranslation(0, 125)
            let labelT2 = CGAffineTransformMakeScale(2, 2)
            self.ballPitView.loginLabel.transform = CGAffineTransformConcat(labelT1, labelT2)
            
            let signUpTranslate = screenSize.height/2 - self.ballPitView.signupButton.frame.height/2
            self.ballPitView.signupButton.transform = CGAffineTransformMakeTranslation(-6, -signUpTranslate)
            self.ballPitView.signLabel.transform = CGAffineTransformMakeTranslation(-6, -signUpTranslate)
            self.ballPitView.upLabel.transform = CGAffineTransformMakeTranslation(-6, -signUpTranslate)
            
            }, completion: nil)
        
        hasAnimated = true
        self.ballPitView.loginButton.enabled = false
    }
    
    func growSignUp(){
        ballPitView.addSignUpTextFields()
        
        if hasAnimated{
            resetButtons(growSignUp)
            return
        }
    
        UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.5, options: [], animations: {
            self.ballPitView.welcomeLabel.alpha = 0.0001
            
            self.ballPitView.signupButton.transform = CGAffineTransformMakeScale(5, 5)
            let signLabelT1 = CGAffineTransformMakeTranslation(0, 150)
            let upLabelT1 = CGAffineTransformMakeTranslation(0, 155)
            let labelT2 = CGAffineTransformMakeScale(2, 2)
            self.ballPitView.signLabel.transform = CGAffineTransformConcat(signLabelT1, labelT2)
            self.ballPitView.upLabel.transform = CGAffineTransformConcat(upLabelT1, labelT2)
            
            
            let loginTranslate = screenSize.height/2 - self.ballPitView.loginButton.frame.height/2
            self.ballPitView.loginButton.transform = CGAffineTransformMakeTranslation(6, loginTranslate)
            self.ballPitView.loginLabel.transform = CGAffineTransformMakeTranslation(6, loginTranslate)
            
            }, completion: nil)
        
        hasAnimated = true
        self.ballPitView.signupButton.enabled = false
    }
    
    // revert buttons and labels back to their origin, then call whichever animation was selected (i.e. completion)
    func resetButtons(completion: () -> ()){
        
        ballPitView.signupButton.enabled = true
        ballPitView.loginButton.enabled = true
        
        ballPitView.hideTextFields()
        
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.5, options: [], animations: {
            self.ballPitView.welcomeLabel.alpha = 1.0
            
            let T1 = CGAffineTransformMakeTranslation(0, 0)
            let T2 = CGAffineTransformMakeScale(1, 1)
            
            self.ballPitView.signupButton.transform = CGAffineTransformConcat(T1, T2)
            self.ballPitView.signLabel.transform = CGAffineTransformConcat(T1, T2)
            self.ballPitView.upLabel.transform = CGAffineTransformConcat(T1, T2)
            self.ballPitView.loginButton.transform = CGAffineTransformConcat(T1, T2)
            self.ballPitView.loginLabel.transform = CGAffineTransformConcat(T1, T2)
            
            }, completion: {finished in
                completion()
        })
        
        changeWelcome()
        hasAnimated = false
    }
    
    func resetButtons(){
        
        ballPitView.signupButton.enabled = true
        ballPitView.loginButton.enabled = true
        
        ballPitView.hideTextFields()
        
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.5, options: [], animations: {
            self.ballPitView.welcomeLabel.alpha = 1.0
            
            let T1 = CGAffineTransformMakeTranslation(0, 0)
            let T2 = CGAffineTransformMakeScale(1, 1)
            
            self.ballPitView.signupButton.transform = CGAffineTransformConcat(T1, T2)
            self.ballPitView.signLabel.transform = CGAffineTransformConcat(T1, T2)
            self.ballPitView.upLabel.transform = CGAffineTransformConcat(T1, T2)
            self.ballPitView.loginButton.transform = CGAffineTransformConcat(T1, T2)
            self.ballPitView.loginLabel.transform = CGAffineTransformConcat(T1, T2)
            
            }, completion: nil)
        
        changeWelcome()
        hasAnimated = false
    }
    
    func changeWelcome(){
        welcomeIndex++
        if welcomeIndex > welcomes.count - 1 {welcomeIndex = 0}
        self.ballPitView.welcomeLabel.text = welcomes[welcomeIndex]
    }
    
}
