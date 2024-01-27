//
//  CameraLiveActivity.swift
//  Camera
//
//  Created by 정윤서 on 1/28/24.
//  Copyright © 2024 com.sssimpacton. All rights reserved.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct CameraAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct CameraLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: CameraAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension CameraAttributes {
    fileprivate static var preview: CameraAttributes {
        CameraAttributes(name: "World")
    }
}

extension CameraAttributes.ContentState {
    fileprivate static var smiley: CameraAttributes.ContentState {
        CameraAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: CameraAttributes.ContentState {
         CameraAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: CameraAttributes.preview) {
   CameraLiveActivity()
} contentStates: {
    CameraAttributes.ContentState.smiley
    CameraAttributes.ContentState.starEyes
}
