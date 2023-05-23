
import SwiftUI

struct TabBar: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .nowPlaying
    
    var body: some View {
        HStack {
            ForEach(tabItems) { item in
                Button {
                    selectedTab = item.selection
                } label: {
                    VStack(spacing: 0) {
                        Image(systemName: item.icon)
                            .symbolVariant(.fill)
                            .font(.body.bold())
                            .frame(width: 44, height: 29)
                        Text(item.name)
                            .font(.caption2)
                            .lineLimit(1)
                    }
                    .frame(maxWidth: .infinity)
                }
                .foregroundStyle(selectedTab == item.selection ? .primary : .secondary)
            }
        }
        .padding(.horizontal, 8)
        .padding(.top, 14)
        .frame( height: 88, alignment: .top)
        .background(.ultraThinMaterial, in:
                        RoundedRectangle(cornerRadius: 34, style: .continuous))
        .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
    }
    
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
