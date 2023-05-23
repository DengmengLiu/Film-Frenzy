
import SwiftUI

struct TabItem: Identifiable {
    let id = UUID()
    var name: String
    var icon: String
    var selection: Tab
}

var tabItems = [
    TabItem(name: "Now Playing", icon: "play.rectangle", selection: .nowPlaying),
    TabItem(name: "Top Rate", icon: "light.ribbon", selection: .comingSoon)
    ]

enum Tab: String {
    case nowPlaying
    case comingSoon
}
