//
//  Album.swift
//  MusicPlay
//
//  Created by 曲波 on 2020/01/12.
//  Copyright © 2020 曲波. All rights reserved.
//

import Foundation

struct FileRoot: Codable {
    let albums: [Album]
}

struct Album: Codable {
    let name:  String
    let artist: String
    let publish: String
    let cover: String
    let brief: String
    let songs: [Song]
}

struct Song: Codable {
    let name: String
}
