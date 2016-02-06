
import Foundation
import UIKit

extension CGColor{
    class func fromHex(rgbValue:UInt32, alpha:Double=1.0) -> CGColor{
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        let color = UIColor(red: red, green: green, blue: blue, alpha: CGFloat(alpha)).CGColor
        
        return color
    }
    
    class func halfColonialWhite() -> CGColor{
        let color = CGColor.fromHex(0xF2E6C1, alpha: 1.0)
        return color
    }
    
    class func crail() -> CGColor{
        let color = CGColor.fromHex(0xBF4C41, alpha: 1.0)
        return color
    }
    
    class func springRain() -> CGColor{
        let color = CGColor.fromHex(0xA2B59D, alpha: 1.0)
        return color
    }
    
    class func lapisLazuli() -> CGColor{
        let color = CGColor.fromHex(0x2766A7, alpha: 1.0)
        return color
    }
    
    class func parchment() -> CGColor{
        let color = CGColor.fromHex(0xCDC6B0, alpha: 1.0)
        return color
    }
    
    class func nomad() -> CGColor{
        let color = CGColor.fromHex(0x9E9785, alpha: 1.0)
        return color
    }
    
}