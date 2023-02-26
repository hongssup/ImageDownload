//
//  ViewController.swift
//  ImageDownload
//
//  Created by SeoYeon Hong on 2023/02/24.
//

import UIKit

class ViewController: UIViewController {

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(ImageDownloadCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    lazy var loadAllBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Load All Images", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(loadAllImages), for: .touchUpInside)
        return button
    }()
    
    var loadAll: Bool = false
    let imageDownloadCell = ImageDownloadCell()
    
    let images = ["https://images.mubicdn.net/images/film/28295/cache-19491-1445874015/image-w1280.jpg",
                  "https://64.media.tumblr.com/1a9ef21e3248dd3dc084793ef91f63c9/tumblr_plawj3VnSQ1vxlpwio1_1280.png",
                  "https://s3.amazonaws.com/criterion-production/editorial_content_posts/hero/766-/v19h2JVw1zLNC2e1ylU5zqkuPabDq4_original.jpg",
                  "https://assets.mubicdn.net/images/film/281688/image-w1280.jpg?1651137929",
                  "https://assets.deutschlandfunk.de/FILE_063e088fcfba3712e12192504964105d/1920x1080.jpg?t=1597486159439"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }

    private func setupView() {
        self.view.addSubview(tableView)
        self.view.addSubview(loadAllBtn)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        loadAllBtn.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = self.view.safeAreaLayoutGuide
        
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16).isActive = true
        tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16).isActive = true
        tableView.bottomAnchor.constraint(equalTo: loadAllBtn.topAnchor, constant: -16).isActive = true
        
        loadAllBtn.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16).isActive = true
        loadAllBtn.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16).isActive = true
        loadAllBtn.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -16).isActive = true
        loadAllBtn.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    @objc func loadAllImages() {
        debugPrint("loadAllImages")
        self.loadAll = true
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ImageDownloadCell else {
            return UITableViewCell()
        }
        cell.imageLoad = {
            if let url = URL(string: self.images[indexPath.row]) {
                cell.thumbnail.load(url: url)
            }
        }
        if loadAll {
            cell.thumbnail.image = UIImage(systemName: "photo")
            if let url = URL(string: self.images[indexPath.row]) {
                cell.thumbnail.load(url: url)
                if indexPath.row == images.count - 1 {
                    debugPrint("end")
                }
                //self.loadAll = false
            }
        }
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84
    }
}
