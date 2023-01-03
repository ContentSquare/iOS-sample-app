
import ContentsquareErrorAnalysisModule
import UIKit

/// This class showcases how to use Error Analysis to trace HTTP network errors
class ErrorAnalysisViewController: UIViewController {

    @IBOutlet private weak var manualMonitoringButton: UIButton!
    @IBOutlet private weak var csAsyncMonitoringButton: UIButton!

    private var task: URLSessionDataTask?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if #available(iOS 15, *) {
            manualMonitoringButton.isEnabled = true
            csAsyncMonitoringButton.isEnabled = true
        } else {
            manualMonitoringButton.isEnabled = false
            csAsyncMonitoringButton.isEnabled = false
        }
    }

    // MARK: - Buttons actions

    @IBAction private func automaticMonitoring(_ sender: UIButton) {
        let request: URLRequest = urlRequest(method: "GET")
        task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            self?.printResponse(data: data)
        }
        task?.resume()
    }

    @available(iOS 15, *)
    @IBAction private func manualMonitoring(_ sender: UIButton) {
        Task {
            let request: URLRequest = urlRequest(method: "GET")
            let metric = HTTPMetric(request: request)
            let session = URLSession(configuration: .default)
            let response = try? await session.data(for: request)
            if let httpResponse = response?.1 as? HTTPURLResponse {
                metric.setStatusCode(httpResponse.statusCode)
                printResponse(data: response?.0)
            }
            metric.stop()
        }
    }

    @available(iOS 15, *)
    @IBAction private func contentsquareAsyncMonitoring(_ sender: UIButton) {
        Task {
            let request: URLRequest = urlRequest(method: "GET")
            let session = URLSession(configuration: .default)
            let response = try? await session.cs.data(for: request)
            printResponse(data: response?.0)
        }
    }

    private func urlRequest(method: String) -> URLRequest {
        let url = URL(string: "https://httpstat.us/500/")!
        var urlComps = URLComponents(string: url.absoluteString)!
        if method == "GET" {
            urlComps.queryItems = [
                URLQueryItem(name: "param1", value: "value1"),
                URLQueryItem(name: "param2", value: "value2")
            ]
        }
        var request = URLRequest(url: urlComps.url!)
        request.httpMethod = method
        return request
    }

    private func printResponse(data: Data?) {
        guard let data = data, let dataString = String(data: data, encoding: .utf8) else {
            return
        }
        NSLog("ErrorAnalysis: Response, \(dataString)")
    }

}
