//
//  ArticleDetailViewController.swift
//  NYTimes
//
//  Created by Toyaj Nigam on 10/09/21.
//

import UIKit

final class ArticleDetailViewController: UIViewController {
    
    let mdlView: ArticleViewModel = ArticleViewModel()
    
    @IBOutlet weak var ib_ImageView: UIImageView!
    @IBOutlet weak var ib_TittleLabel: UILabel!
    @IBOutlet weak var ib_SectionSubSectionLabel: UILabel!
    @IBOutlet weak var ib_ArticleDescLabel: UILabel!
    @IBOutlet weak var ib_PublishDateLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = Constant.ViewControllerTitle.articleTitle.rawValue
        self.updateUI()
        
    }
}

extension ArticleDetailViewController {
    
    // MARK: - Update User Interface
    
    func updateUI() {
        
        ib_TittleLabel.text = mdlView.title
        ib_SectionSubSectionLabel.text = "\(mdlView.sectionName), \(mdlView.subSectionName)"
        ib_PublishDateLabel.text = mdlView.publishDate
        ib_ArticleDescLabel.text = mdlView.description
        guard let imageURL = mdlView.imageURl else { return }
        setImage(url: imageURL)

    }
    
    // MARK: - set Image
    
    func setImage(url: String) {
        
        ib_ImageView.sd_setImage(with: URL(string: url),
                                 placeholderImage: UIImage(named: Constant.ImagePlaceholder.image.rawValue),
                                 options: [], completed: nil)
        
    }
}
