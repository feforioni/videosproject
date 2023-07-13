

import UIKit

class HomeViewController: UITableViewController {
    var videosList: [Video] = []
    let videosRepository = VideosRepository.init()
    let loadingView = LoadingView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loadingView)
        showLoading()
        let baseUrl = "https://www.googleapis.com/youtube/v3/videos"
        let parameters = "?part=snippet,statistics&chart=mostPopular&key=AIzaSyBKAadctzYEKlHs3GbS4NtkCD4mxD4OhrE"
        guard let url = URL(string: baseUrl + parameters) else {
            showAlert(message: "Invalid URL")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                self.showAlert(message: error?.localizedDescription ?? "")
                return
            }
            guard let data = data else {
                DispatchQueue.main.sync {
                    self.showAlert(message: "No data")
                }
                return
            }
            // items[0] --> snippet --> thumbnails --> highDefinitionVersion --> url
            //print(String(decoding: data, as: UTF8.self))
            let decoder = JSONDecoder()
            do {
               let videoListResponse = try decoder.decode(YoutubeVideoListResponse.self, from: data)
                let snippet = videoListResponse.items[0].snippet
                let video1 = Video(
                    title: snippet.title,
                    thumbUrlString: snippet.thumbnails.highDefinitionVersion.url,
                    channelName: snippet.channelTitle,
                    views: Int(videoListResponse.items[0].statistics.viewCount) ?? 0,
                    channelImageUrlString: "")
                self.videosList.append(video1)
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
        }.resume()
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
        let videoAtual = videosList[indexPath.row]
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "meuIdentificador") as! VideoTableViewCell
        cell.configure(with: videoAtual)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(PlayerViewController(), animated: true)
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


