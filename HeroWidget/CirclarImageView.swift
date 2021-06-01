import SwiftUI

struct CirclarImageView: View {
    var image: Image
    var body: some View {
        image.resizable().aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.purple, lineWidth: 5))
            .shadow(radius: 15)
    }
}

struct CirclarImageView_Previews: PreviewProvider {
    static var previews: some View {
        CirclarImageView(image: Image("ironman"))
    }
}
