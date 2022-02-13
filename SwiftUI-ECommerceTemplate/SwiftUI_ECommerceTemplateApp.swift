//
//  SwiftUI_ECommerceTemplateApp.swift
//  SwiftUI-ECommerceTemplate
//
//  Created by Ryan J. W. Kim on 2022/02/13.
//

import SwiftUI

@main
struct SwiftUI_ECommerceTemplateApp: App {
    
    // AppLock
    @StateObject var appLockVM = AppLockViewModel()
    @Environment(\.scenePhase) var scenePhase
    @State var blurRadius: CGFloat = 0
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
            ContentView()
                .environmentObject(appLockVM)
                .blur(radius: blurRadius)
                .onChange(of: scenePhase, perform: { value in
                    switch value {
                    case .active :
                        blurRadius = 0
                    case .background:
                        appLockVM.isAppUnLocked = false
                    case .inactive:
                        blurRadius = 5
                    @unknown default:
                        print("unknown")
                    }
                })
            }
        }
    }
}
