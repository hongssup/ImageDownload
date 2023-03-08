//
//  ImageDownloadCell.swift
//  ImageDownload
//
//  Created by SeoYeon Hong on 2023/02/24.
//

import UIKit

class ImageDownloadCell: UITableViewCell {
    
    lazy var thumbnail: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = UIImage(systemName: "photo")
        return view
    }()
    
    lazy var progressBar: UIProgressView = {
        let view = UIProgressView()
        view.trackTintColor = .systemGray5
        view.progressTintColor = .systemBlue
        view.progress = 0.5
        return view
    }()
    
    lazy var loadBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Load", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(onClickLoadBtn), for: .touchUpInside)
        return button
    }()
    
    var imageLoad: (() -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        self.contentView.addSubview(thumbnail)
        self.contentView.addSubview(progressBar)
        self.contentView.addSubview(loadBtn)
        
        self.contentView.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        thumbnail.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        thumbnail.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        thumbnail.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.32).isActive = true
        thumbnail.heightAnchor.constraint(equalToConstant: 72).isActive = true
        
        loadBtn.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        loadBtn.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        loadBtn.widthAnchor.constraint(equalToConstant: 80).isActive = true
        loadBtn.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        progressBar.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        progressBar.leadingAnchor.constraint(equalTo: thumbnail.trailingAnchor, constant: 8).isActive = true
        progressBar.trailingAnchor.constraint(equalTo: loadBtn.leadingAnchor, constant: -8).isActive = true
    }
    
    @objc func onClickLoadBtn(_ sender: UIButton) {
        self.thumbnail.image = UIImage(systemName: "photo")
        debugPrint("onClick")
        self.imageLoad?()
    }
}


