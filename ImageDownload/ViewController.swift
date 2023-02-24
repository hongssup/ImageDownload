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
        return button
    }()
    
    let images = ["1", "2", "3", "4", "5"]
    
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
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ImageDownloadCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84
    }
}
