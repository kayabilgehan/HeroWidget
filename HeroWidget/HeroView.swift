import SwiftUI

struct HeroView: View {
    
    let hero: SuperHero
    
    var body: some View {
        HStack {
            CirclarImageView(image: Image(hero.image))
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding()
            Spacer()
            VStack {
                Text(hero.name).font(.largeTitle).bold().foregroundColor(.purple)
                Text(hero.realName)
            }.padding()
            Spacer()
        }.frame(width: UIScreen.main.bounds.width, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView(hero: ironman)
    }
}
