//
//  WidgetHero.swift
//  WidgetHero
//
//  Created by Bilgehan KAYA on 2.06.2021.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    ///Aşağıdaki 2 satır ConvertView'deki ile aynı
    @AppStorage("hero", store: UserDefaults(suiteName: "group.com.thedruid.HeroWidget"))
    var heroData: Data = Data()
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), hero: ironman)
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        /*let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)*/
        if let hero = try? JSONDecoder().decode(SuperHero.self, from: heroData){
            let entry = SimpleEntry(date: Date(), configuration: configuration, hero: hero)
            completion(entry)
        }
        
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        
        if let hero = try? JSONDecoder().decode(SuperHero.self, from: heroData){
            let entry = SimpleEntry(date: Date(), configuration: configuration, hero: hero)
            let timeline = Timeline(entries: [entry], policy: TimelineReloadPolicy.never)
            completion(timeline)
        }
        
        /*let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration, hero: )
            entries.append(entry)
        }

        //let timeline = Timeline(entries: entries, policy: .atEnd)
        let timeline = Timeline(entries: entries, policy: .never)
        completion(timeline)*/
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    
    //SuperHero class ını görmezse. O class ı seçip sağ menuden target membership checklenecek
    let hero: SuperHero
}

struct WidgetHeroEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        /*Text(entry.date, style: .time)*/
        CirclarImageView(image: Image(entry.hero.image))
    }
}

@main
struct WidgetHero: Widget {
    let kind: String = "WidgetHero"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WidgetHeroEntryView(entry: entry)
        }
        .configurationDisplayName("Hero Widget Name.")
        .description("Hero Widget Desc.")
    }
}

/*struct WidgetHero_Previews: PreviewProvider {
    static var previews: some View {
        WidgetHeroEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent(), hero: <#SuperHero#>))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}*/
