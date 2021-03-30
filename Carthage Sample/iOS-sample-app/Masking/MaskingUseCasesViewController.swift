import UIKit

class MaskingUseCasesViewController: UIViewController {

    @IBOutlet private weak var maskingTableView: UITableView!

    override func loadView() {
        super.loadView()

        maskingTableView.delegate = self
        maskingTableView.dataSource = self
        maskingTableView.register(UITableViewCell.self, forCellReuseIdentifier: "maskingIdentifier")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "maskingSegue",
           let indexPath = maskingTableView.indexPathForSelectedRow {
            let useCase = allUseCases[indexPath.item]
            if let maskingVC = segue.destination as? MaskingViewController {
                maskingVC.useCase = useCase
            }
        }
    }
}

enum MaskingUseCase: String {
    case defaultMasking
    case fullyUnmasked
    case maskImages
    case unmaskPublicLabel
}

fileprivate let allUseCases: [MaskingUseCase] = [
    .defaultMasking,
    .fullyUnmasked,
    .maskImages,
    .unmaskPublicLabel
]

extension MaskingUseCasesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allUseCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "maskingIdentifier", for: indexPath)
        cell.textLabel?.text = "\(allUseCases[indexPath.item].rawValue.localizedCapitalized)"
        return cell
    }
}

extension MaskingUseCasesViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "maskingSegue", sender: self)
    }
}
