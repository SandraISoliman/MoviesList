//
//  MoviesListApp.swift
//  MoviesList
//
//  Created by Sandra on 10/06/2022.
//

import SwiftUI

@main
struct MoviesListApp: App {
    var body: some Scene {
        WindowGroup {
            MoviesList(moviesViewModel: MoviesViewModel(apiService: APIService()))
        }
    }
}
