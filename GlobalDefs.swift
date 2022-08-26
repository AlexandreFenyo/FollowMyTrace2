import SwiftUI

public enum COLORS {
    static let standard_background = UIColor(red: 123/255, green: 136/255, blue: 152/255, alpha: 1)
    
    //UIColor.yellow
    static let top_down_background =
    UIColor(red: 242/255, green: 140/255, blue: 135/255, alpha: 1)
}

// Code from https://stackoverflow.com/questions/56586055/how-to-get-rgb-components-from-color-in-swiftui
extension Color {
    var components: (hue: Double, saturation: Double, brightness: Double, opacity: Double) {
        var h: CGFloat = 0
        var s: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        guard UIColor(self).getHue(&h, saturation: &s, brightness: &b, alpha: &a) else {
            fatalError("getHue()")
        }
        
        return (hue: Double(h), saturation: Double(s), brightness: Double(b), opacity: Double(a))
    }
}

extension Color {
    public func darker() -> Color {
        return Color(hue: components.hue, saturation: components.saturation, brightness: components.brightness * 0.9, opacity: components.opacity)
    }
}
