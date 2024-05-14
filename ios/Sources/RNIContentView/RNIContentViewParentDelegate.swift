//
//  RNIContentViewParentDelegate.swift
//  react-native-ios-utilities
//
//  Created by Dominic Go on 4/30/24.
//

import UIKit
import React


#if RCT_NEW_ARCH_ENABLED
public typealias RNIContentViewParent = UIView
#else
public typealias RNIContentViewParent = RCTView;
#endif

@objc
public protocol RNIContentViewParentDelegate where Self: RNIContentViewParent {

  var cachedLayoutMetrics: RNILayoutMetrics { get };
  
  func setSize(_ size: CGSize);
  
  // MARK: Fabric Only
  // -----------------
  
  #if RCT_NEW_ARCH_ENABLED
  func setPadding(_ insets: UIEdgeInsets);
  
  func setPositionType(_ positionType: RNILayoutMetrics.RNIPositionType);
  #endif
};
