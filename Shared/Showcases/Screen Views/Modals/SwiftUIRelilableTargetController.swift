import UIKit
import SwiftUI

class SwiftUIRelilableTargetController: UIViewController {
    
    private let hostingController = UIHostingController(rootView: ContentView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChild(hostingController)
        hostingController.willMove(toParent: self)
        view.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.accessibilityIdentifier = "my_nature_views"
        NSLayoutConstraint.activate([
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
            
    struct ContentView: View {
        
        let items: [String] = [
            "hare",
            "tortoise",
            "dog",
            "cat",
            "lizard",
            "fish",
            "bird",
            "ant",
            "ladybug",
            "tree",
        ]
        
        var body: some View {
            ScrollView {
                LazyVGrid(columns: [.init(.flexible()), .init(.flexible())], spacing: 50) {
                    ForEach(Array(items.enumerated()), id: \.self.offset) { index, item in
                        cell(imageName: item, text: item.capitalized)
                            .overlay(AccessibleView(accessibilityIdentifier: "element \(index)"))
                    }
                }
                .padding()
            }
        }
        
        @ViewBuilder func cell(imageName: String, text: String) -> some View {
            VStack(spacing: 10) {
                Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                Text(text)
            }
            .contentShape(Rectangle())
        }
    }
}

/// A utility SwiftUI view that inserts an invisible `UIView` with a custom accessibility identifier as an overlay.
///
/// Use this view as an `.overlay()` on your SwiftUI elements to mark them with a specific
/// `accessibilityIdentifier`. This enables reliable tracking by the Contentsquare SDK.
///
/// - Important: Do not overlay `AccessibleView` on top of interactive elements (such as buttons or controls),
///   as it may block user interactions. Place it only on non-interactive views or ensure it does not interfere
///   with touch handling.
///
/// - Note: This view is not part of the Contentsquare SDK.
///   Add it to your project manually if there are issues with default tracking of SwiftUI views by the SDK.
struct AccessibleView: UIViewRepresentable {

    let accessibilityIdentifier: String

    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.accessibilityIdentifier = accessibilityIdentifier
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        uiView.accessibilityIdentifier = accessibilityIdentifier
    }
}

#Preview {
    SwiftUIRelilableTargetController.ContentView()
}
