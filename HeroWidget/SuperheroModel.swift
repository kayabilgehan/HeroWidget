import Foundation

struct SuperHero: Identifiable, Codable {
    let image: String
    let name: String
    let realName: String
    var id: String {name}
}

let ironman = SuperHero(image: "ironman", name: "Ironman", realName: "Tony Stark")
let batman = SuperHero(image: "batman", name: "Batman", realName: "Bruce Wayne")
let superman = SuperHero(image: "superman", name: "Superman", realName: "Clark Kent")

