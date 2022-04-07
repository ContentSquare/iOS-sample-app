import UIKit
import ContentsquareModule

class MaskingViewController: UIViewController {

    @IBOutlet private weak var publicLabel: UILabel!
    @IBOutlet private weak var privateLabel: UILabel!

    var useCase: MaskingUseCase = .defaultMasking
    private let defaultMaskedTypes = [UITextField.self,
                              UILabel.self,
                              UITextView.self,
                              UIButton.self,
                              UIPickerView.self,
                              UIImageView.self]

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        switch useCase {
        case .defaultMasking:
            resetDefaultMasking()
        case .fullyUnmasked:
            unmaskAll()
        case .maskImages:
            unmaskAll()
            Contentsquare.mask(viewsOfType: UIImageView.self)
        case .unmaskPublicLabel:
            resetDefaultMasking()
            Contentsquare.unmask(view: publicLabel)
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        resetDefaultMasking()
    }

    // MARK: - Private

    private func resetDefaultMasking() {
        defaultMaskedTypes.forEach {
            Contentsquare.mask(viewsOfType: $0)
        }
    }

    private func unmaskAll() {
        defaultMaskedTypes.forEach {
            Contentsquare.unmask(viewsOfType: $0)
        }
    }
}
