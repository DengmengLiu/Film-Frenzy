//
//  AccountView.swift
//  IOS_A3App
//
//  Created by shihao lin on 23/5/2023.
//
import SwiftUI

struct AccountView: View {
    @State var isPinned = false
    @State var isDeleted = false
    
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isLogged") var isLogged = false
    @AppStorage("isLiteMode") var isLiteMode = true
    @State var address: Address = Address(id: 1, country: "Australia")
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    profile
                }
                
                Section {
                    NavigationLink {} label: {
                        Label("Settings", systemImage: "gear")
                    }
                    
                    NavigationLink {} label: {
                        Label("Billing", systemImage: "creditcard")
                    }
                    
                    NavigationLink {} label: {
                        Label("Help", systemImage: "questionmark.circle")
                    }
                }
                .listRowSeparator(.automatic)
                
                Section {
                    Toggle(isOn: $isLiteMode) {
                        Label("Lite Mode", systemImage: isLiteMode ? "tortoise" : "hare")
                    }
                }
                
                linksSection
                
                Button {} label: {
                    Text("Sign out")
                        .frame(maxWidth: .infinity)
                }
                .tint(.red)
                .onTapGesture {
                    isLogged = false
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
        }
    }
    
    var linksSection: some View {
        Section {
            if !isDeleted {
                Link(destination: URL(string: "https://designcode.io")!) {
                    HStack {
                        Label("Website", systemImage: "house")
                            .tint(.primary)
                        Spacer()
                        Image(systemName: "link")
                            .tint(.secondary)
                    }
                }
                .swipeActions(edge: .leading) {
                    Button {
                        withAnimation {
                            isPinned.toggle()
                        }
                    } label: {
                        if isPinned {
                            Label("Unpin", systemImage: "pin.slash")
                        } else {
                            Label("Pin", systemImage: "pin")
                        }
                    }
                    .tint(isPinned ? .gray : .yellow)
                }
                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                    Button {
                        withAnimation {
                            isDeleted.toggle()
                        }
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                    .tint(.red)
                }
            }
            
        }
        .listRowSeparator(.automatic)
    }
    
    var profile: some View {
        VStack {
            Image(systemName: "person.crop.circle.fill.badge.checkmark")
                .symbolVariant(.circle.fill)
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue, .blue.opacity(0.3), .red)
                .font(.system(size: 32))
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
            Text("Dengmeng Liu")
                .font(.title.weight(.semibold))
            Text(address.country)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    func fetchAddress() async {
        do {
            let url = URL(string: "https://random-data-api.com/api/address/random_address")!
            let (data, _) = try await URLSession.shared.data(from: url)
            address = try JSONDecoder().decode(Address.self, from: data)
        } catch {
            address = Address(id: 1, country: "Error fetching")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}

struct Address: Identifiable, Decodable {
    var id: Int
    var country: String
}
