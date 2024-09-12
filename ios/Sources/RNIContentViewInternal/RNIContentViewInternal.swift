//
//  RNIContentViewInternal.swift
//  react-native-ios-utilities
//
//  Created by Dominic Go on 9/10/24.
//

import Foundation
import DGSwiftUtilities


public protocol RNIContentViewInternal: RNIContentView, ValueInjectable
  where Events: RNIViewInternalEvents {
    
  // empty requirements
  
};

// MARK: - RNIContentViewInternal+Helpers
// --------------------------------------

public extension RNIContentViewInternal {
  
  func dispatchRawNativeEvent(
    eventName: String,
    eventPayload: Dictionary<String, Any>,
    shouldPropagate: Bool
   ) throws {
   
    guard let parentReactView = self.parentReactView else {
      throw RNIUtilitiesError(
        errorCode: .unexpectedNilValue,
        description: "Could not get `parentReactView`"
      );
    };
      
    parentReactView.dispatchViewEvent(
      forEventName: eventName,
      withPayload: eventPayload
    );
  };
};

// MARK: - RNIContentViewInternal+ValueInjectable
// ----------------------------------------------

fileprivate enum PropertyKeys: String {
  case rawDataForNative;
};

public extension RNIContentViewInternal {

  var rawDataForNative: NSDictionary? {
    get {
      self.getInjectedValue(
        forKey: PropertyKeys.rawDataForNative
      );
    }
    set {
      self.setInjectedValue(
        forKey: PropertyKeys.rawDataForNative,
        value: newValue
      );
    }
  };
};

// MARK: - RNIContentViewInternal+RNIViewPropHandling
// --------------------------------------------------

public extension RNIContentViewInternal {
  
  static var propKeyPathMap: PropKeyPathMap {
    return [
      "rawDataForNative": \KeyPathRoot.rawDataForNative,
    ];
  };
};
