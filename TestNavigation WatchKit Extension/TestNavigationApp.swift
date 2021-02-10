//
//  TestNavigationApp.swift
//  TestNavigation WatchKit Extension
//
//  Created by admin on 10.02.2021.
//

import SwiftUI

@main
struct TestNavigationApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
