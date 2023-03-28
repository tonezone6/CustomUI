
import SwiftUI

extension ButtonStyle where Self == RoundedCornersWhite {
    public static var roundedWhite: RoundedCornersWhite {
        RoundedCornersWhite()
    }
}

public struct RoundedCornersWhite: ButtonStyle {
    @Environment(\.isEnabled) private var enabled: Bool

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 17, weight: .semibold))
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .foregroundColor(.actionPrimary)
            .background(Color.white)
            .disabled(!enabled)
            .opacity((configuration.isPressed || !enabled) ? 0.7 : 1.0)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .contentShape(Rectangle())
            .shadow(color: .gray.opacity(0.15), radius: 10, y: 10)
    }
}
