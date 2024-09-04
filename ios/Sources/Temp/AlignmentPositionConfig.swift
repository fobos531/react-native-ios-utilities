//
//  AlignmentPositionConfig.swift
//  react-native-ios-utilities
//
//  Created by Dominic Go on 9/5/24.
//

import Foundation
import DGSwiftUtilities


public struct AlignmentPositionConfig {

  public var horizontalAlignment: HorizontalAlignmentPosition;
  public var verticalAlignment: VerticalAlignmentPosition;
  
  public var preferredHeight: CGFloat?;
  public var preferredWidth: CGFloat?;
  
  public var marginTop: CGFloat?;
  public var marginBottom: CGFloat?;
  public var marginLeading: CGFloat?;
  public var marginTrailing: CGFloat?;
  
  public var shouldPreferHeightAnchor: Bool?;
  public var shouldPreferWidthAnchor: Bool?;
  
  // MARK: - Init
  // ------------
  
  public init(
    horizontalAlignment: HorizontalAlignmentPosition,
    verticalAlignment: VerticalAlignmentPosition,
    preferredHeight: CGFloat? = nil,
    preferredWidth: CGFloat? = nil,
    marginTop: CGFloat? = nil,
    marginBottom: CGFloat? = nil,
    marginLeading: CGFloat? = nil,
    marginTrailing: CGFloat? = nil,
    shouldPreferHeightAnchor: Bool? = nil,
    shouldPreferWidthAnchor: Bool? = nil
  ) {
    self.horizontalAlignment = horizontalAlignment;
    self.verticalAlignment = verticalAlignment;
    self.preferredHeight = preferredHeight;
    self.preferredWidth = preferredWidth;
    self.marginTop = marginTop;
    self.marginBottom = marginBottom;
    self.marginLeading = marginLeading;
    self.marginTrailing = marginTrailing;
    self.shouldPreferHeightAnchor = shouldPreferHeightAnchor;
    self.shouldPreferWidthAnchor = shouldPreferWidthAnchor;
  };
  
  // MARK: Functions
  // ---------------
  
  public func createConstraints(
    forView view: UIView,
    attachingTo targetView: UIView,
    enclosingView: UIView
  ) -> [NSLayoutConstraint] {
    
    var constraints: [NSLayoutConstraint] = [];
    
    constraints += self.horizontalAlignment.createHorizontalConstraints(
      forView: view,
      attachingTo: targetView,
      enclosingView: enclosingView,
      preferredWidth: self.preferredWidth,
      marginLeading: self.marginLeading ?? 0,
      marginTrailing: self.marginTrailing ?? 0,
      shouldPreferWidthAnchor: self.shouldPreferWidthAnchor ?? false
    );
    
    constraints += self.verticalAlignment.createVerticalConstraints(
      forView: view,
      attachingTo: targetView,
      enclosingView: enclosingView,
      preferredHeight: self.preferredHeight,
      marginTop: self.marginTop ?? 0,
      marginBottom: self.marginBottom ?? 0,
      shouldPreferHeightAnchor: self.shouldPreferHeightAnchor ?? false
    );
    
    return constraints;
  };
};

// MARK: - AlignmentPositionConfig+StaticAlias
// -------------------------------------------

public extension AlignmentPositionConfig {
  
  static var `default`: Self {
    .init(
      horizontalAlignment: .stretch,
      verticalAlignment: .stretch
    );
  };
};

// MARK: - AlignmentPositionConfig+
// -------------------------------------------

extension AlignmentPositionConfig: InitializableFromDictionary {
  
  public init(fromDict dict: Dictionary<String, Any>) throws {
    self.horizontalAlignment =
      try dict.getEnumFromDictionary(forKey: "horizontalAlignment");
      
    self.verticalAlignment =
      try dict.getEnumFromDictionary(forKey: "verticalAlignment");
      
    self.preferredHeight =
      try? dict.getValueFromDictionary(forKey: "preferredHeight");
      
    self.preferredWidth =
      try? dict.getValueFromDictionary(forKey: "preferredWidth");
      
    self.marginTop =
      try? dict.getValueFromDictionary(forKey: "marginTop");
      
    self.marginBottom =
      try? dict.getValueFromDictionary(forKey: "marginBottom");
      
    self.marginLeading =
      try? dict.getValueFromDictionary(forKey: "marginLeading");
      
    self.marginTrailing =
      try? dict.getValueFromDictionary(forKey: "marginTrailing");
      
    self.shouldPreferHeightAnchor =
      try? dict.getValueFromDictionary(forKey: "shouldPreferHeightAnchor");
      
    self.shouldPreferWidthAnchor =
      try? dict.getValueFromDictionary(forKey: "shouldPreferWidthAnchor");
  };
};

