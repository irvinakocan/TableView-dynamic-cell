//
//  TextTableViewCell.swift
//  TableView dynamic cell
//
//  Created by Macbook Air 2017 on 22. 2. 2024..
//

import UIKit

class TextTableViewCell: UITableViewCell {
    
    static let identifier = "TextTableViewCell"
    
    private let paragraphLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .darkText
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .systemPink
        addSubview(paragraphLabel)
        
        paragraphLabel.translatesAutoresizingMaskIntoConstraints = false
        paragraphLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        paragraphLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        paragraphLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
        paragraphLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive = true
    }
    
    /*  It's very important when having dynamic cell height to set constraints inside
        initializer, so the cell can stratch and know it's height.
        If we do that inside layoutSubviews method, it will layout subviews just inside
        regular given cell height, not dynamic one.
     */
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(text: String) {
        paragraphLabel.text = text
    }
    
    override func prepareForReuse() {
        paragraphLabel.text = nil
    }
}
