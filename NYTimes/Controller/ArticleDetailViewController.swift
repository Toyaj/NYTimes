//
//  ArticleDetailViewController.swift
//  NYTimes
//
//  Created by Toyaj Nigam on 10/09/21.
//

import UIKit

final class ArticleDetailViewController: UIViewController {
    
    let mdlView: ArticleModelView = ArticleModelView()
    
    @IBOutlet weak var ib_ImageView: UIImageView!
    @IBOutlet weak var ib_TittleLabel: UILabel!
    @IBOutlet weak var ib_SectionSubSectionLabel: UILabel!
    @IBOutlet weak var ib_ArticleDescLabel: UILabel!
    @IBOutlet weak var ib_PublishDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Article Details"
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
        let imgURl = mdlView.imageURl
        if imgURl != nil || imgURl != "" {
            self.setImage(url: imgURl ?? "")
        }
    }
    
    // MARK: - set Image
    func setImage(url: String) {
        ib_ImageView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "placeholder"), options: [], completed: nil)
    }
}
