//
//  ContentView.swift
//  SwiftUI-ECommerceTemplate
//
//  Created by Ryan J. W. Kim on 2022/02/13.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @EnvironmentObject private var appLockVM: AppLockViewModel
    @SceneStorage("selectedTab") var currentTab: Int = 2
    // MARK: - Body
    var body: some View {
        ZStack() {
            if !appLockVM.isAppLockEnabled || appLockVM.isAppUnLocked {
                TabView(selection: $currentTab, content: {
                    Color.red
                        .ignoresSafeArea()
                })
                    .navigationViewStyle(StackNavigationViewStyle())
                    .onAppear(perform: {
                        // with tab bar shown, it leaves tiny marks on background
                        UITabBar.appearance().isHidden = true
                    })
                    .safeAreaInset(edge: .bottom, content: {
                        TabBarView(selectedTab: $currentTab)
                    })
                    .ignoresSafeArea(edges: .bottom)
                    .navigationBarHidden(true)
            } else {
                LockedView()
                    .navigationBarHidden(true)
            }
        } //: ZStack
        
        .onAppear {
            // if 'isAppLockEnabled' value true, then immediately do the app lock validation
            if appLockVM.isAppLockEnabled {
                appLockVM.appLockValidation()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
                .environmentObject(AppLockViewModel())
                .preferredColorScheme(.dark)
        }
    }
}
