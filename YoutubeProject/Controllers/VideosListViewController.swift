

import UIKit

class VideosListViewController: UITableViewController {
    var videosList: [Video] = []
    let videosRepository = VideosRepository.init()

    override func viewDidLoad() {
        super.viewDidLoad()
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
}


