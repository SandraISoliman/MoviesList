import SwiftUI

struct ImageView: View {
    @ObservedObject var imageLoader:ImageLoader

    init(withURL url:String) {
        imageLoader = ImageLoader(urlString:url)
    }

    var body: some View {
            Image(uiImage: imageLoader.image ?? UIImage() )
                .resizable()
                .aspectRatio(contentMode: .fill)
    }
}

