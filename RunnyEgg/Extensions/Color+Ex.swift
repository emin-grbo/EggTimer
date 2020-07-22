import SwiftUI

extension Color {
    
    static var RBpurple: Color { return Color(hex: "#3804B6") }
    
    init(hex: String) {
        let r, g, b: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    b = CGFloat((hexNumber & 0x0000ff)) / 255

                    self.init(.displayP3, red: Double(r), green: Double(g), blue: Double(b), opacity: 1)
                    return
                }
            }
        }
        self.init(.displayP3, red: 1, green: 1, blue: 1, opacity: 1)
    }
}
