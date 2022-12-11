//
//  ProfileDataFormViewViewModel.swift
//  Twitter_
//
//  Created by Abdulmajit Kubatbekov on 11.12.22.
//

import Foundation
import Combine


final class ProfileDataFormViewViewModel: ObservableObject {
    
    @Published var displayName: String?
    @Published var username: String?
    @Published var bio: String?
    @Published var avatarPath: String?
    
}
