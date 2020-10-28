//
//  BuildConfiguration.swift
//  MainApp
//
//  Created by William Inx on 08/07/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

/// Consist of TabBar and NavBar
public protocol BuildConfiguration {}
/// Build the app using tab bar
public enum TabBar: BuildConfiguration {}
/// Build the app using nav bar
public enum NavBar: BuildConfiguration {}
