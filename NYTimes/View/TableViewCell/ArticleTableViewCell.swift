//
//  ArticleTableViewCell.swift
//  NYTimes
//
//  Created by Toyaj Nigam on 10/09/21.
//

import UIKit
import SDWebImage

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ib_ThumImgView: UIImageView!
    @IBOutlet weak var ib_TittleLabel: UILabel!
    @IBOutlet weak var ib_DateLabel: UILabel!
    @IBOutlet weak var ib_SectionLabel: UILabel!
    @IBOutlet weak var ib_SubSectionLabel: UILabel!
    var item: String?
    let viewModel: ArticleViewModel = ArticleViewModel()
    
    // MARK: - Cell setup
    
    func prepareForCell() {
        
        ib_TittleLabel.text = viewModel.title
        ib_DateLabel.text = viewModel.publishDate
        ib_SectionLabel.text = viewModel.sectionName
        ib_SubSectionLabel.text = viewModel.subSectionName
        guard let imageURl = viewModel.thumnailUrl else { return }
        self.setImage(url: imageURl)
        
    }
    
    // MARK: - Set thumbnail Image
    
    func setImage(url: String) {
        
        ib_ThumImgView.sd_setImage(with: URL(string: url),
                                   placeholderImage: UIImage(named: Constant.ImagePlaceholder.image.rawValue),
                                   options: [],
                                   completed: nil)
        
    }
}
