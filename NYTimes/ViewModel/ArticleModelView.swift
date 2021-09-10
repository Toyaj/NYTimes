//
//  ArticleModelView.swift
//  NYTimes
//
//  Created by Toyaj Nigam on 10/09/21.
//

import Foundation

class ArticleModelView {
    
    var model: ArcticleDetails?
    
    var title: String {
        getTitleOfArticle()
    }
    
    var publishDate: String {
        getPublishDate()
    }
    
    var sectionName: String {
        getSectionName()
    }

    var subSectionName: String {
        getSubSectionName()
    }
    
    var thumnailUrl: String? {
        getThumbnailImageURL()
    }
    
    var imageURl: String? {
        getImageURL()
    }
    
    var description: String {
        getDescriptionOFArticle()
    }
    
    func getTitleOfArticle() -> String {
        let title = model?.title ?? ""
        return title
    }
 
    func getPublishDate() -> String {
        let publishDate = model?.publishedDate ?? ""
        return publishDate
    }
    
    func getSectionName() -> String {
        let sectionName = model?.section ?? ""
        return sectionName
    }
    
    func getSubSectionName() -> String {
        let subSectionName = model?.subsection ?? ""
        return  subSectionName
    }
    
    func getThumbnailImageURL() -> String? {
        return  model?.media.count ?? 0 > 0 ? model?.media[0].mediaMetadata[0].url ?? nil : nil
    }
    
    // MARK: - Arcticle Detail Screen Methods
    
    func getImageURL() -> String? {
        
        guard model?.media.count ?? 0 > 0 else {
            return nil
        }
        if model?.media[0].mediaMetadata.count ?? 0 > 2 {
            guard let url = model?.media[0].mediaMetadata[2].url else {
                return nil
            }
            return  url
        } else {
            guard let url = model?.media[0].mediaMetadata[0].url else {
                return nil
            }
            return  url
        }
    }
    
    func getDescriptionOFArticle() -> String {
        let description = model?.abstract ?? ""
        return description
    }
    
}
