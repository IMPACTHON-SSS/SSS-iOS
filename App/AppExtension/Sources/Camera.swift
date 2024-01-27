//
//  Camera.swift
//  Camera
//
//  Created by Mercen on 1/28/24.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        var entries: [SimpleEntry] = []

        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct CameraEntryView: View {

    var body: some View {
        VStack(alignment: .leading) {
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(width: 76, height: 67)
                .opacity(0.6)
            Spacer()
            Text("일기 만들기")
                .foregroundStyle(Color.black)
                .font(.system(size: 24, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding(12)
        .background(LinearGradient(colors: [Color("TopColor"), Color("BottomColor")],
                                   startPoint: .top,
                                   endPoint: .bottom).ignoresSafeArea())
        .widgetURL(URL(string: "widget://camera")!)
    }
}

struct Camera: Widget {
    let kind: String = "Camera"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                CameraEntryView()
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                CameraEntryView()
                    .background()
            }
        }
        .configurationDisplayName("일기 만들기")
        .description("일기를 만들어보세요.")
        .contentMarginsDisabled()
        .supportedFamilies([.systemSmall])
    }
}

#Preview(as: .systemSmall) {
    Camera()
} timeline: {
    SimpleEntry(date: .now)
}
