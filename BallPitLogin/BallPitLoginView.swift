//
//  BallPitLoginView.swift
//  BallPitLogin
//
//  Created by Joey on 2/5/16.
//  Copyright © 2016 NelsonJE. All rights reserved.
//

import UIKit

let screenSize: CGRect = UIScreen.mainScreen().bounds

class BallPitLoginView: UIView{
    
    // MARK: Subviews
    var welcomeLabel = UILabel()
    var loginButton = UIButton()
    var loginLabel = UILabel()
    var signupButton = UIButton()
    var signLabel = UILabel()
    var upLabel = UILabel()
    var GObutton = GHButton()
    
    // TextFields
    let username = BallTextField()
    let password = BallTextField()
    let email = BallTextField()

    // MARK: Inits
    convenience init() {
        self.init(frame: CGRectZero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        self.addGestureRecognizer(tap)
        tap.cancelsTouchesInView = false
        
        self.setNeedsUpdateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func DismissKeyboard(){
        self.endEditing(true)
    }
    
    // MARK: View Construction
    override func updateConstraints() {
        
        configureSubviews()
        
        let buttonHeight: CGFloat = 0.6 * 312
        let buttonWidth: CGFloat = 0.6 * 280
        
        welcomeLabel.constrainUsing(constraints: [
            Constraint.CenterXToCenterX : (of: self, offset: 0),
            Constraint.TopToTop : (of: self, offset: 60),
            Constraint.Width : (of: nil, offset: self.frame.width),
            Constraint.Height : (of: nil, offset: 200)])
        
        loginButton.constrainUsing(constraints: [
            Constraint.CenterXToCenterX : (of: self, offset: -75),
            Constraint.CenterYToCenterY : (of: self, offset: 0),
            Constraint.Width : (of: nil, offset: buttonWidth),
            Constraint.Height : (of: nil, offset: buttonHeight)])
        
        loginLabel.constrainUsing(constraints: [
            Constraint.CenterXToCenterX : (of: self, offset: -75),
            Constraint.BottomToBottom : (of: self.loginButton, offset: -30),
            Constraint.Width : (of: nil, offset: buttonWidth),
            Constraint.Height : (of: nil, offset: 40)])
        
        signupButton.constrainUsing(constraints: [
            Constraint.CenterXToCenterX : (of: self, offset: 75),
            Constraint.CenterYToCenterY : (of: self, offset: 0),
            Constraint.Width : (of: nil, offset: buttonWidth),
            Constraint.Height : (of: nil, offset: buttonHeight)])
        
        signLabel.constrainUsing(constraints: [
            Constraint.CenterXToCenterX : (of: self, offset: 75),
            Constraint.TopToTop : (of: self.signupButton, offset: 30),
            Constraint.Width : (of: nil, offset: 70),
            Constraint.Height : (of: nil, offset: 40)])
        
        upLabel.constrainUsing(constraints: [
            Constraint.CenterXToCenterX : (of: self.signLabel, offset: 0),
            Constraint.TopToBottom : (of: self.signLabel, offset: 0),
            Constraint.Width : (of: nil, offset: 70),
            Constraint.Height : (of: nil, offset: 30)])
        
        super.updateConstraints()
    }
    
    func configureSubviews(){
        
        backgroundColor = UIColor.whiteColor()
        
        
        welcomeLabel.font = UIFont(name: "Avenir-Heavy", size: 45)
        welcomeLabel.textColor = UIColor.blackColor()
        welcomeLabel.textAlignment = .Center
        welcomeLabel.numberOfLines = 2
        welcomeLabel.lineBreakMode = .ByWordWrapping
        
        loginLabel.font = UIFont(name: "Avenir-Heavy", size: 25)
        loginLabel.text = "login"
        loginLabel.textColor = UIColor.whiteColor()
        loginLabel.textAlignment = .Center
        
        signLabel.font = UIFont(name: "Avenir-Heavy", size: 25)
        signLabel.text = "sign"
        signLabel.textColor = UIColor.whiteColor()
        signLabel.textAlignment = .Center
        
        upLabel.font = UIFont(name: "Avenir-Heavy", size: 25)
        upLabel.text = "up"
        upLabel.textColor = UIColor.whiteColor()
        upLabel.textAlignment = .Center
        
        loginButton.setImage(UIImage(named: "loginTri"), forState: .Normal)
        
        signupButton.setImage(UIImage(named: "signUpTri"), forState: .Normal)
        
        self.addSubview(welcomeLabel)
        self.addSubview(loginButton)
        self.addSubview(signupButton)
        self.addSubview(signLabel)
        self.addSubview(upLabel)
        self.addSubview(loginLabel)
    }
    
    // MARK: UITextFields
    
    func addLoginTextFields(){
        
        self.addSubview(username)
        self.addSubview(password)
        self.addSubview(GObutton)
        
        let shrink = CGAffineTransformMakeScale(0.0001, 0.0001)
        let grow = CGAffineTransformMakeScale(1.0, 1.0)
        
        username.textField.placeholder = "username"
        username.constrainUsing(constraints: [
            Constraint.CenterXToCenterX : (of: self, offset: -screenSize.width/4),
            Constraint.TopToTop : (of: self, offset: 50),
            Constraint.Width : (of: nil, offset: 150),
            Constraint.Height : (of: nil, offset: 150)])
        username.layer.zPosition = CGFloat(MAXFLOAT)
        
        password.textField.placeholder = "password"
        password.textField.secureTextEntry = true
        password.constrainUsing(constraints: [
            Constraint.CenterXToCenterX : (of: self, offset: -20),
            Constraint.TopToTop : (of: self, offset: 200),
            Constraint.Width : (of: nil, offset: 150),
            Constraint.Height : (of: nil, offset: 150)])
        password.layer.zPosition = CGFloat(MAXFLOAT)
        
        GObutton.backgroundColor = UIColor.fromHex(0xE73E2E, alpha: 0.83)
        GObutton.setTitle("GO", forState: .Normal)
        GObutton.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 25)
        GObutton.layer.cornerRadius = 50
        GObutton.constrainUsing(constraints: [
            Constraint.CenterXToCenterX : (of: self, offset: -120),
            Constraint.TopToTop : (of: self, offset: 350),
            Constraint.Width : (of: nil, offset: 100),
            Constraint.Height : (of: nil, offset: 100)])
        GObutton.layer.zPosition = CGFloat(MAXFLOAT)
        
        username.transform = shrink
        password.transform = shrink
        GObutton.transform = shrink
        
        
        UIView.animateWithDuration(0.5, delay: 0.25, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .CurveEaseIn, animations: {
                self.username.transform = grow
                self.password.transform = grow
                self.GObutton.transform = grow
            }, completion: nil)
    }
    
    func addSignUpTextFields(){

        self.addSubview(username)
        self.addSubview(password)
        self.addSubview(email)
        self.addSubview(GObutton)
        
        let shrink = CGAffineTransformMakeScale(0.0001, 0.0001)
        let grow = CGAffineTransformMakeScale(1.0, 1.0)
        
        username.textField.placeholder = "username"
        username.constrainUsing(constraints: [
            Constraint.CenterXToCenterX : (of: self, offset: screenSize.width/4),
            Constraint.TopToTop : (of: self, offset: 50),
            Constraint.Width : (of: nil, offset: 150),
            Constraint.Height : (of: nil, offset: 150)])
        username.layer.zPosition = CGFloat(MAXFLOAT)
        
        password.textField.placeholder = "password"
        password.textField.secureTextEntry = true
        password.constrainUsing(constraints: [
            Constraint.CenterXToCenterX : (of: self, offset: -80),
            Constraint.TopToTop : (of: self, offset: 140),
            Constraint.Width : (of: nil, offset: 150),
            Constraint.Height : (of: nil, offset: 150)])
        password.layer.zPosition = CGFloat(MAXFLOAT)
        
        email.textField.placeholder = "email"
        email.constrainUsing(constraints: [
            Constraint.CenterXToCenterX : (of: self, offset: 100),
            Constraint.TopToTop : (of: self, offset: 260),
            Constraint.Width : (of: nil, offset: 150),
            Constraint.Height : (of: nil, offset: 150)])
        email.layer.zPosition = CGFloat(MAXFLOAT)
        
        GObutton.backgroundColor = UIColor.fromHex(0xE73E2E, alpha: 0.83)
        GObutton.setTitle("GO", forState: .Normal)
        GObutton.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 25)
        GObutton.layer.cornerRadius = 50
        GObutton.constrainUsing(constraints: [
            Constraint.CenterXToCenterX : (of: self, offset: -20),
            Constraint.TopToTop : (of: self, offset: 350),
            Constraint.Width : (of: nil, offset: 100),
            Constraint.Height : (of: nil, offset: 100)])
        GObutton.layer.zPosition = CGFloat(MAXFLOAT)
        
        username.transform = shrink
        password.transform = shrink
        email.transform = shrink
        GObutton.transform = shrink
        
        
        UIView.animateWithDuration(0.5, delay: 0.25, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .CurveEaseIn, animations: {
            self.username.transform = grow
            self.password.transform = grow
            self.email.transform = grow
            self.GObutton.transform = grow
            }, completion: nil)
        
    }

    func hideTextFields(){
        
        username.removeFromSuperview()
        password.removeFromSuperview()
        email.removeFromSuperview()
        GObutton.removeFromSuperview()
        
        username.textField.text = ""
        password.textField.text = ""
        email.textField.text = ""
        
        let shrink = CGAffineTransformMakeScale(0.0001, 0.0001)
        UIView.animateWithDuration(0.5, delay: 0.25, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .CurveEaseIn, animations: {
            self.username.transform = shrink
            self.password.transform = shrink
            self.email.transform = shrink
            self.GObutton.transform = shrink
            }, completion: nil)
    }
    
    // -----------------Falling boxes!---------------------------------------
    
    var maxX : CGFloat = 320;
    var maxY : CGFloat = 320;
    let boxSize : CGFloat = 30.0
    var boxes : Array<UIView> = []
    var ballTimer = NSTimer()
    
    func ballDrop(){
        maxX = bounds.size.width - boxSize;
        maxY = bounds.size.height - boxSize;
        // Do any additional setup after loading the view, typically from a nib.
        createAnimatorStuff()
        
        ballTimer = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: "generateBoxes", userInfo: nil, repeats: true)
    }
    
    func randomColor() -> UIColor {
        let red = CGFloat(CGFloat(arc4random()%100000)/100000);
        let green = CGFloat(CGFloat(arc4random()%100000)/100000);
        let blue = CGFloat(CGFloat(arc4random()%100000)/100000);
        
        return UIColor(red: red, green: green, blue: blue, alpha: 0.85);
    }
    
    func doesNotCollide(testRect: CGRect) -> Bool {
        for box : UIView in boxes {
            let viewRect = box.frame;
            if(CGRectIntersectsRect(testRect, viewRect)) {
                return false
            }
        }
        return true
    }
    
    func randomFrame() -> CGRect {
        var guess = CGRectMake(9, 9, 9, 9)
        
        repeat {
            let guessX = CGFloat(arc4random()) % maxX / 3
            let guessY: CGFloat = -15
            //let guessY = CGFloat(arc4random()) % maxY;
            guess = CGRectMake(guessX, guessY, boxSize, boxSize);
        } while(!doesNotCollide(guess))
        
        return guess
    }
    
    func addBox(location: CGRect, color: UIColor) -> UIView {
        let newBox = UIView(frame: location)
        newBox.backgroundColor = color
        newBox.layer.cornerRadius = 15.0
        newBox.userInteractionEnabled = false
        
//        let behavior = UIDynamicItemBehavior(items: [newBox])
//        //behavior.density = 0.1
//        behavior.elasticity = 0.1
        
        
        addSubview(newBox)
        self.sendSubviewToBack(newBox)
        
        addBoxToBehaviors(newBox)
        boxes.append(newBox)
        return newBox
    }
    
    func generateBoxes() {
        
        if boxes.count > 150 {ballTimer.invalidate()}
        
        let frame = randomFrame()
        let color = randomColor()
        addBox(frame, color: color)
    }
    
    var animator:UIDynamicAnimator? = nil;
    let gravity = UIGravityBehavior()
    let behavior = UIDynamicBehavior()
    
    let collider = UICollisionBehavior()
    
    func createAnimatorStuff() {
        animator = UIDynamicAnimator(referenceView:self);
        
        gravity.gravityDirection = CGVectorMake(0.05, 0.5)
        animator?.addBehavior(gravity);
        
        // We're bouncin' off the walls
        collider.translatesReferenceBoundsIntoBoundary = true
        animator?.addBehavior(collider)
    }
    
    func addBoxToBehaviors(box: UIView) {
        gravity.addItem(box)
        collider.addItem(box)
    }
    
    
}
