//
//  StadiumTableViewCell.swift
//  POI_APP
//
//  Created by Alex Lin on 8/2/23.
//

import UIKit

class StadiumTableViewCell: UITableViewCell, ReusableCell {
    
    private(set) var stadiumImage: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 8
        image.layer.masksToBounds = true
        
        return image
    }()
    
    private(set) var stadiumName: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .regular)
        
        return label
    }()
    
    func configureWith(model: StadiumTableViewCellModel) {
        self.stadiumName.text = model.name
        fetchRemoteImage(with: URL(string: model.image))
        
        setupView()
        contentView.layoutIfNeeded()
    }
    
    private func setupView() {
        contentView.addSubview(stadiumImage)
        contentView.addSubview(stadiumName)
        
        setupConstraints()
    }
    
    private func fetchRemoteImage(with url: URL?) {
        if let url = url {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async {
                    self.stadiumImage.image = UIImage(data: data)
                }
            }
            
            task.resume()
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stadiumImage.widthAnchor.constraint(equalToConstant: 84),
            stadiumImage.heightAnchor.constraint(equalToConstant: 84),
            stadiumImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stadiumImage.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: 8),
            stadiumImage.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8),
            
            stadiumName.topAnchor.constraint(equalTo: contentView.topAnchor),
            stadiumName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stadiumName.leadingAnchor.constraint(equalTo: stadiumImage.trailingAnchor, constant: 16),
            stadiumName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
