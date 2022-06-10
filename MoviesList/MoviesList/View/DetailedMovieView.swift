import SwiftUI

struct DetailedMovieView: View {
    let movie: Movie
    
    var body: some View {
        ScrollView{
                VStack(spacing: 12){
                    Text(movie.title ?? "")
                        .font(.title3)
                        .bold()
                    ImageView(withURL: "https://image.tmdb.org/t/p/w500" + (movie.posterPath ?? ""))
                    Text(publishedDate(dateString: movie.releaseDate ?? "") + " " + (movie.originCountry ?? ""))
                    .font(.caption)
                    Text(movie.overview ?? "")
                }
                .navigationBarTitle(movie.title ?? "", displayMode: .inline)
                .padding(16)
        }
    }
    
    func publishedDate(dateString: String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'"
        let date = dateFormatter.date(from: dateString)
        if let date = date{
            let components = Calendar.current.dateComponents([.year], from: date)
            if let year = components.year{
                return String(year)
            }
        }
        return ""
    }
}
