//
//  UserProfileView.swift
//  DailyReport V1
//
//  Created by Satoshi Mitsumori on 5/2/24.
//

import Foundation
import SwiftUI
import Firebase
import GoogleSignIn

struct UserProfileView: View {
    @StateObject var viewModel = CurrentUserProfileViewModel()
    @State private var showEditProfile: Bool = false
    
    @AppStorage("log_Status") var log_Status: Bool = false
    
    private var currentUser: UserModel? {
        return viewModel.currentUser
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                        HStack(alignment: .top) {
                            VStack(alignment: .leading, spacing: 12) {
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    
                                     Text(currentUser?.username ?? "")
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                }
                            }
                            
                            Spacer()
                            
                            CircularProfileImageView(user: currentUser)
                        }
                    
                    
                    Button(action: {
                        showEditProfile.toggle()
                    }, label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.black)
                            .frame(width: 352, height: 36)
                            .background(.white)
                            .cornerRadius(10)
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(.systemGray4), lineWidth: 1)
                            }
                    })
                    
                    // User Content List View
                    if let currentUser = currentUser {
              //        ProfileContentView()
                    //    UserContentListView(user: currentUser)
                    }
                }
  //      })
            .sheet(isPresented: $showEditProfile, content: {
                if let user = currentUser {
        //            EditProfileView(user: user)
                }
            })
            .padding(.horizontal)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        AuthService.shared.signOut()
                        
                        // MARK: Signing out user using google autentication token
                            
                            GIDSignIn.sharedInstance.signOut()
                            try? Auth.auth().signOut()
                            
                            withAnimation {
                                log_Status = false
                            }
                        
                        
                    }, label: {
                        HStack {
                            Text("Sign Out")
                            Image(systemName: "line.3.horizontal")
                        }
                    })
                    .font(.subheadline)
                    .foregroundColor(Color.black)
                }
        }
        }
    }
                }
            }
 
