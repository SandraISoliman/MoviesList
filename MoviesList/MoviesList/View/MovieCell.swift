import SwiftUI

struct MovieCell: View {
    var movie: Movie
    var body: some View {
        HStack (spacing: 12) {
            ImageView(withURL: "https://image.tmdb.org/t/p/w500" + (movie.posterPath ?? ""))
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            articleInfo()
        }
        .padding(4)
    }
    
    @ViewBuilder func articleInfo() -> some View{
        VStack (alignment: .leading, spacing: 8) {
            Text(movie.title ?? "")
                .font(.system(size: 16))
                .bold()
            if let date = getReleaseYear(dateString: movie.releaseDate){
                Text(String(date))
            }
        }
    }
    
    func getReleaseYear(dateString: String?) -> Int?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'"
        let date = dateFormatter.date(from: dateString ?? "")
        if let date = date{
            let components = Calendar.current.dateComponents([.year], from: date)
            return components.year
        }
        return nil
    }
}
