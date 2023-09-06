

import UIKit

class HomeViewController: UITableViewController {
    var videosList: [Video] = []
    let loadingView = LoadingView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loadingView)
        showLoading()
       
        guard let url = constructUrl() else {
            showAlert(message: "Invalid URL")
            return
        }
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            if self.hasErrors(error, data) {
                return
            }
            let decoder = JSONDecoder()
            do {
                let videoListResponse = try decoder.decode(YoutubeVideoListResponse.self, from: data!)
                self.populateVideosList(items: videoListResponse.items)
            } catch {
                DispatchQueue.main.sync {
                    self.showAlert(message: error.localizedDescription)
                    print(error)
                }
            }
            DispatchQueue.main.sync {
                self.tableView.reloadData()
                self.hideShowLoading()
            }
        }
        
        dataTask.resume()
    }
    
    func hasErrors(_ error: Error?, _ data: Data?) -> Bool {
        DispatchQueue.main.sync {
            if error != nil {
                self.showAlert(message: error?.localizedDescription ?? "")
                return true
            }
            if data == nil {
                self.showAlert(message: "No data")
                return true
            }
            return false
        }
    }
    func populateVideosList(items: [Item]) {
        items.forEach { item in
            let snippet = item.snippet
            let video = Video(
                id: item.id,
                title: snippet.title,
                thumbUrlString: snippet.thumbnails.highDefinitionVersion.url,
                channelName: snippet.channelTitle,
                views: Int(item.statistics.viewCount) ?? 0,
                channelImageUrlString: "")
            self.videosList.append(video)
        }
    }
    
    func constructUrl() -> URL? {
        let baseUrl = "https://www.googleapis.com/youtube/v3/videos"
        let parameters = "?part=snippet,statistics&chart=mostPopular&key=AIzaSyBKAadctzYEKlHs3GbS4NtkCD4mxD4OhrE"
        let fullString = baseUrl + parameters
        return URL(string: fullString)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
        hideShowLoading()
    }
    
    func hideShowLoading() {
        loadingView.isHidden = true
        tableView.isUserInteractionEnabled = true
    }
    
    func showLoading() {
        loadingView.isHidden = false
        tableView.isUserInteractionEnabled = false
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videosList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "meuIdentificador") as! VideoTableViewCell
        cell.configure(with: videosList[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indice = indexPath.row
        let id = videosList[indice].id
        let title = videosList[indice].title
        navigationController?.pushViewController(PlayerViewController(videoId: id, title: title ), animated: true)
    }
    
    @IBAction func onLoginButtonTapped(_ sender: Any) {
        navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(action)
        navigationController?.present(alertController, animated: true)
    }
}


