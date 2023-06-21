

import UIKit

class VideosListViewController: UITableViewController {
    var videosList: [Video] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        let videosRepository = VideosRepository()
        videosList = videosRepository.getVideos()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videosList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "meuIdentificador") as! VideoTableViewCell
        cell.tittleVideoLabel.text = videosList[indexPath.row].title
        cell.thumbnailImageView.image = UIImage(named: videosList[indexPath.row].thumbName)
        cell.channelLogoImageView.layer.cornerRadius = 25
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 318
    }
    
    @IBAction func onLoginButtonTapped(_ sender: Any) {
        navigationController?.pushViewController(LoginViewController(), animated: true)
    }
}


