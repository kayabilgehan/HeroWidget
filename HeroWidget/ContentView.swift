import SwiftUI
import WidgetKit

let superHeroArray = [superman, batman, ironman]


///Uygulama ayarlari -> SignIn&capabilities'den App Group u ekliyoruz.
struct ContentView: View {
    
    @AppStorage("hero", store: UserDefaults(suiteName: "group.com.thedruid.HeroWidget"))
    var heroData: Data = Data()
    
    var body: some View {
        VStack {
            ForEach(superHeroArray) { hero in
                HeroView(hero: hero).onTapGesture {
                    saveToDefaults(hero: hero)
                }
            }
        }
    }
    
    func saveToDefaults(hero: SuperHero){
        //print("Hero: \(hero.name)")
        if let heroData = try? JSONEncoder().encode(hero) {
            self.heroData = heroData
            print(hero.name)
            WidgetCenter.shared.reloadTimelines(ofKind: "WidgetHero")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
