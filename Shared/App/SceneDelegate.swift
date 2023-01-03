import UIKit
import ContentsquareModule

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        // Handle incoming urls to monitor CS in-app activation
        if let url = URLContexts.first?.url {
            Contentsquare.handle(url: url)
        }
    }
}
