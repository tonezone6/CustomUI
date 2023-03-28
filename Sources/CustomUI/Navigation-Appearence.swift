
import SwiftUI

extension NavigationView {
    public func changeAppearence() -> some View {
        modifier(NavigationBarAppearenceModifier())
    }
}

@available(iOS 16.0, *)
extension NavigationStack {
    public func changeAppearence() -> some View {
        modifier(NavigationBarAppearenceModifier())
    }
}

private struct NavigationBarAppearenceModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .onAppear {
                let appearence = UINavigationBar.appearance()
                appearence.standardAppearance = .opaque
                appearence.scrollEdgeAppearance = .transparent
                appearence.compactAppearance = .opaque
            }
            .tint(.brandPrimary)
    }
}

/// Hide back button title
extension UINavigationController {
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navigationBar.topItem?.backButtonDisplayMode = .minimal
    }
}

extension UINavigationBarAppearance {
    static var base: UINavigationBarAppearance {
        let insets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        let backImage = UIImage(systemName: "arrow.backward")!
            .withAlignmentRectInsets(insets)
            .withTintColor(UIColor(.brandPrimary))
        
        let appearence = UINavigationBarAppearance()
        appearence.largeTitleTextAttributes = [
            .foregroundColor : UIColor(.brandPrimary)
        ]
        appearence.titleTextAttributes = [
            .foregroundColor : UIColor(.brandPrimary)
        ]
        appearence.setBackIndicatorImage(backImage, transitionMaskImage: backImage)
        return appearence
    }
    
    
    public static var transparent: UINavigationBarAppearance {
        let appearence = base
        appearence.configureWithTransparentBackground()
        return appearence
    }
    
    public static var opaque: UINavigationBarAppearance {
        let appearence = base
        appearence.configureWithOpaqueBackground()
        appearence.backgroundColor = UIColor(.backgroundSolid)
        return appearence
    }
}
