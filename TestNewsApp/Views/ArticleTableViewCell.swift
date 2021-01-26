//
//  ArticleTableViewCell.swift
//  TestNewsApp
//
//  Created by Balnur Sakhybekova on 1/26/21.
//  Copyright © 2021 Balnur Sakhybekova. All rights reserved.
//

import UIKit
import SnapKit

class ArticleTableViewCell: UITableViewCell {
    private lazy var articleSource: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.gray
        label.font = App.Font.light(size: 22)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var articleTitle: UILabel = {
        let label = UILabel()
        label.font = App.Font.bold(size: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    public var photoView : UIImageView = UIImageView()
    
    let container: UIView = {
      let view = UIView()
      view.clipsToBounds = true
      return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setup(){
        photoView.layer.cornerRadius = 20
        photoView.clipsToBounds = true
        photoView.layer.masksToBounds = true
        
        contentView.addSubview(container)
        
        contentView.backgroundColor = .systemGray6
        container.backgroundColor = .white
        container.layer.borderWidth = 1
        container.layer.borderColor = UIColor.systemGray5.cgColor
        
        container.addSubview(articleTitle)
        container.addSubview(articleSource)
        container.addSubview(photoView)
        
        container.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(3)
            make.bottom.equalToSuperview().offset(-3)
            make.left.equalToSuperview().offset(6)
            make.right.equalToSuperview().offset(-6)
        }
        
        articleSource.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(10)
        }
        photoView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(120)
            make.width.equalTo(150)
        }
        articleTitle.snp.makeConstraints { make in
            make.top.equalTo(articleSource).offset(40)
            make.left.equalToSuperview().offset(10)
            make.right.equalTo(photoView).offset(-150)
        }
    }
    
    var articles: Article? {
            didSet{
                if let a = articles {
                    articleTitle.text = a.title
                    articleSource.text = a.source.name
                    photoView.setImageFromUrl(a.urlToImage)
                }
            }
        }
}
