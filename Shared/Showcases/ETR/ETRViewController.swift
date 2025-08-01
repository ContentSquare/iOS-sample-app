
import UIKit
import ContentsquareModule

class ETRViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func triggerETRScreen(_ sender: UIButton) {
        Contentsquare.triggerReplayForCurrentScreen(name: "Replay Screen Event")
    }
    
    @IBAction func triggerETRSession(_ sender: UIButton) {
        Contentsquare.triggerReplayForCurrentSession(name: "Replay Session Event")
    }
}
