
import SwiftUI

extension Color {
    public static let brandPrimary = Color(red: 153/255, green: 101/255, blue: 20/255)
    public static let textPrimary = Color(red: 60/255, green: 40/255, blue: 40/255)
    public static let textSecondary = Color(red: 110/255, green: 90/255, blue: 70/255)
    public static let actionPrimary = Color(red: 190/255, green: 150/255, blue: 30/255)
    public static let actionSecondary = Color(red: 234/255, green: 67/255, blue: 53/255)
    public static let backgroundSolid = Color(red: 225/255, green: 205/255, blue: 165/255)
}

extension LinearGradient {
    public static let background = LinearGradient(
        colors: [Color.actionPrimary.opacity(0.5), Color.white],
        startPoint: .top,
        endPoint: .bottom
    )
}

struct Colors_Previews: PreviewProvider {
    struct ColorPreview<T>: View where T: ShapeStyle {
        let fill: T
        let name: String
        var body: some View {
            HStack {
                Circle().fill(fill).frame(width: 44)
                Text(name).font(.headline)
            }
        }
    }
    
    static var previews: some View {
        NavigationView {
            List {
                ColorPreview(fill: Color.brandPrimary, name: "Brand primary")
                ColorPreview(fill: Color.textPrimary, name: "Text primary")
                ColorPreview(fill: Color.textSecondary, name: "Text secondary")
                ColorPreview(fill: Color.actionPrimary, name: "Action primary")
                ColorPreview(fill: Color.actionSecondary, name: "Action secondary")
                ColorPreview(fill: Color.backgroundSolid, name: "Background solid")
                ColorPreview(fill: LinearGradient.background, name: "Background")
            }
            .navigationTitle("Colors")
        }
    }
}
