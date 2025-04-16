//
//  ContentView.swift
//  AppleFeatures
//
//  Created by Fabricio Padua on 3/26/25.
//

import SwiftUI

struct ContentView: View {
    // Data model using Identifiable
    struct ListItem: Identifiable {
        let id = UUID()
        let title: String
    }
    
    // Sample list of items
    let items: [ListItem] = [
        ListItem(title: "ApplePay"),
        ListItem(title: "GymKit"),
        ListItem(title: "Wi-Fi, Bluetooth"),
        ListItem(title: "CoreNFC"),
        ListItem(title: "Core Data"),
        ListItem(title: "Core Animation"),
        ListItem(title: "Core Memory"),
        ListItem(title: "Core Graphics"),
        ListItem(title: "Apple Login"),
        ListItem(title: "Memory Management"),
        ListItem(title: "Multi-threading"),
        ListItem(title: "Performance Optimization")
    ]
    
    var body: some View {
        NavigationView {
            List(items) { item in
                NavigationLink(destination: DetailView(item: item)) {
                    Text(item.title)
                }
            }
            .navigationTitle("Apple Features Swift")
        }
    }
}

struct DetailView: View {
    let item: ContentView.ListItem
    @State private var isExamplePresented = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Button to run the sample code/example
               
                
                // Descriptive text showing code explanation
                Text(description(for: item.title))
                    .font(.body)
                    .padding(.top, 5)
            }
            .padding()
            Button(action: {
                isExamplePresented = true
            }) {
                Text("Run Example")
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.bottom, 10)
            .padding()
            
        }
        .navigationTitle(item.title)
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $isExamplePresented) {
            ExampleView(featureTitle: item.title)
        }
    }
    
    // Function to return a descriptive text for each item
    func description(for title: String) -> String {
        switch title {
        case "ApplePay":
            return "Example implementation of Apple Pay using the PassKit framework. It sets up a payment request and presents the Apple Pay view."
        case "GymKit":
            return "GymKit is a private API for integrating fitness data, especially for Apple Watch and gym equipment, and is not available for external developers."
        case "Wi-Fi, Bluetooth":
            return "Demonstrates using CoreBluetooth to scan for nearby Bluetooth devices. This example prints the names of discovered devices."
        case "CoreNFC":
            return "Example of starting an NFC reading session with CoreNFC to detect and connect to NFC tags."
        case "Core Data":
            return "Shows how to initialize Core Data using NSPersistentContainer to manage local storage in your app."
        case "Core Animation":
            return "A simple animation example using UIView.animate to move a view (e.g., a square) across the screen."
        case "Core Memory":
            return "Discusses basic memory management in Swift using ARC and weak references to avoid retain cycles."
        case "Core Graphics":
            return "Illustrates custom drawing using Core Graphics to draw a line on a custom UIView subclass."
        case "Apple Login":
            return "Example implementation of Sign in with Apple using AuthenticationServices to authenticate users."
        case "Memory Management":
            return "A code snippet demonstrating memory management techniques in Swift, using weak references to prevent retain cycles."
        case "Multi-threading":
            return "Shows how to perform heavy tasks on a background thread with DispatchQueue and update the UI on the main thread."
        case "Performance Optimization":
            return "Demonstrates performance optimization by using NSCache to cache images, reducing redundant downloads and improving app efficiency."
        default:
            return "Detailed content and code examples will be provided soon."
        }
    }
}

struct ExampleView: View {
    let featureTitle: String
    @Environment(\.presentationMode) var presentationMode
    
    // A helper function to simulate "running" the example for each feature.
    func exampleOutput(for title: String) -> String {
        switch title {
        case "ApplePay":
            return "Running Apple Pay example... Setting up payment request."
        case "GymKit":
            return "GymKit is not accessible for external developers."
        case "Wi-Fi, Bluetooth":
            return "Scanning for Bluetooth devices..."
        case "CoreNFC":
            return "Starting NFC session and awaiting tag detection..."
        case "Core Data":
            return "Initializing Core Data persistent container..."
        case "Core Animation":
            return "Animating view across the screen..."
        case "Core Memory":
            return "Demonstrating ARC with weak references..."
        case "Core Graphics":
            return "Drawing custom graphics on UIView..."
        case "Apple Login":
            return "Performing Sign in with Apple flow..."
        case "Memory Management":
            return "Managing memory with ARC and avoiding retain cycles..."
        case "Multi-threading":
            return "Running heavy computation on background thread..."
        case "Performance Optimization":
            return "Caching images to optimize app performance..."
        default:
            return "Example not available."
        }
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Example for \(featureTitle)")
                .font(.title2)
                .bold()
            Text(exampleOutput(for: featureTitle))
                .padding()
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Dismiss")
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
