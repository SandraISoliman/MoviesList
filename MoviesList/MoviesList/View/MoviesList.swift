import Combine
import SwiftUI

public struct MoviesList: View {
    @ObservedObject var moviesViewModel: MoviesViewModel
    
    public var body: some View {
        NavigationView {
            List {
                ForEach(moviesViewModel.movies, id: \.id) { movie in
                    NavigationLink(
                        destination: DetailedMovieView(movie: movie)) {
                          MovieCell(movie: movie)
                    }
                }
                if moviesViewModel.cuurentPage < moviesViewModel.totalNumberOfPages{
                    LoaderView(isFailed: moviesViewModel.isRequestFailed)
                        .onAppear(perform: fetchData)
                        .onTapGesture(perform: onTapLoadView)
                }
 
                if moviesViewModel.movies.isEmpty{
                    loader()
                }
            }
            .navigationTitle("Movies List")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    @ViewBuilder func loader() -> some View{
        LoaderView(isFailed: moviesViewModel.isRequestFailed)
            .onAppear(perform: fetchData)
            .onTapGesture(perform: onTapLoadView)
    }
    
    private func fetchData() {
        moviesViewModel.fetchMovies()
    }
    
    private func onTapLoadView() {
        if moviesViewModel.isRequestFailed {
            moviesViewModel.isRequestFailed = false
            fetchData()
        }
    }
}

