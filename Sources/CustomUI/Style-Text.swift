
import SwiftUI

extension Text {
    public func style(_ style: Style) -> some View {
        self.font(style.font)
            .textCase(style.textCase)
            .foregroundColor(style.color)
            .lineSpacing(style.lineSpacing)
    }
    
    public enum Style {
        case titleLarge, titleMedium, titleSmall
        case bodyLarge, bodyRegular, bodyRegularSpaced, bodySmall
        case button, buttonSmall
        case labelLarge, label, sectionTitle, caption
        
        public var font: Font {
            switch self {
            case .titleLarge:
                return .system(size: 32).weight(.heavy)
            case .titleMedium:
                return .system(size: 20).weight(.heavy)
            case .titleSmall:
                return .system(size: 17).weight(.bold)
            case .bodyLarge:
                return .system(size: 18)
            case .bodyRegular:
                return .system(size: 17)
            case .bodyRegularSpaced:
                return .system(size: 17)
            case .bodySmall:
                return .system(size: 14)
            case .button:
                return .system(size: 17).weight(.semibold)
            case .buttonSmall:
                return .system(size: 13).weight(.semibold)
            case .labelLarge:
                return .system(size: 12).weight(.semibold)
            case .label:
                return .system(size: 10).weight(.semibold)
            case .sectionTitle:
                return .system(size: 13).weight(.semibold)
            case .caption:
                return .system(size: 13)
            }
        }
        
        var color: Color? {
            switch self {
            case .titleLarge, .titleMedium, .titleSmall:
                return .textSecondary
            case .bodyLarge, .bodyRegular, .bodyRegularSpaced, .bodySmall:
                return .textPrimary
            case .button, .buttonSmall:
                return .actionPrimary
            case .labelLarge, .label:
                return nil
            case .sectionTitle, .caption:
                return .textPrimary
            }
        }
        
        var textCase: Text.Case? {
            switch self {
            case .labelLarge, .label:
                return .uppercase
            default:
                return nil
            }
        }
        
        var lineSpacing: CGFloat {
            switch self {
            case .bodyLarge, .bodyRegular, .bodySmall:
                return 3
            case .bodyRegularSpaced:
                return 7
            default:
                return 1
            }
        }
    }
}

struct TextStyle_Previews: PreviewProvider {
    static var previews: some View {
        List {
            Section {
                Text("Title Large").style(.titleLarge)
                Text("Title Medium").style(.titleMedium)
                Text("Title Small").style(.titleSmall)
            }
            
            Section {
                Text("Body Large").style(.bodyLarge)
                Text("Body Regular").style(.bodyRegular)
            }
            
            Section {
                Text("Button").style(.button)
                Text("Button Small").style(.buttonSmall)
            }
            
            Section {
                Text("Label Large").style(.labelLarge)
                Text("Label").style(.label)
                Text("Section Title").style(.sectionTitle)
                Text("Caption").style(.caption)
            }
        }
    }
}
