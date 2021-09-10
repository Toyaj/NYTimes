//
//  NYArticleModel.swift
//  NYTimes
//
//  Created by Toyaj Nigam on 10/09/21.
//

import Foundation

// MARK: - NYArticleModel
struct NYArticleModel: Codable {
    let results: [ArcticleDetails]
    enum CodingKeys: String, CodingKey {
        case results
    }
}

// MARK: - ArcticleDetails
struct ArcticleDetails: Codable {
    let assetID: Int
    let publishedDate, section, subsection: String
    let title, abstract: String
    let media: [Media]
    let etaID: Int
    
    enum CodingKeys: String, CodingKey {
        case assetID = "asset_id"
        case publishedDate = "published_date"
        case section, subsection
        case title, abstract
        case media
        case etaID = "eta_id"
    }
}

// MARK: - Media
struct Media: Codable {
    let mediaMetadata: [MediaMetadatum]
    
    enum CodingKeys: String, CodingKey {
        case mediaMetadata = "media-metadata"
    }
}

// MARK: - MediaMetadatum
struct MediaMetadatum: Codable {
    let url: String
}
