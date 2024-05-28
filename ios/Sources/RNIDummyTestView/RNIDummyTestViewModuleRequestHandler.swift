//
//  RNIDummyTestViewModuleRequestHandler.swift
//  react-native-ios-utilities
//
//  Created by Dominic Go on 5/25/24.
//

import Foundation
import DGSwiftUtilities


final class RNIDummyTestViewModuleRequestHandler: RNIModuleCommandRequestHandling {

  static let moduleName = "RNIDummyTestViewModule";

  static let commandMapPromise = [
   "somePromiseCommandThatWillAlwaysResolve":
      ClassType.somePromiseCommandThatWillAlwaysResolve,
      
   "somePromiseCommandThatWillAlwaysReject":
      ClassType.somePromiseCommandThatWillAlwaysReject,
  ];
  
  static var initialSharedValues: [String : Any] {
    return [
      "someNumber": 1,
    ];
  };
  
  static let shared: ClassType = .init();
  
  init(){
    let _ = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
    
      let rawValue = self.getSharedValue(forKey: "someNumber");
      let someNumber = (rawValue as? NSNumber) ?? 0.0;
        
      print(
        "NATIVE - RNIDummyTestViewModuleRequestHandler.getSharedValue",
        "\n - key: someNumber",
        "\n - rawValue:", rawValue,
        "\n - someNumber:", someNumber,
        "\n"
      );
        
      self.setSharedValue(
        forKey: "someNumber",
        withValue: someNumber.doubleValue + 1.0
      );
    }
  };

  func somePromiseCommandThatWillAlwaysResolve(
    commandArgs: CommandArguments,
    resolve: Resolve
  ) throws {
  
    let someString: String =
      try commandArgs.getValueFromDictionary(forKey: "someString");
      
    let someNumber: Double =
      try commandArgs.getValueFromDictionary(forKey: "someNumber");
      
    let someBool: Bool =
      try commandArgs.getValueFromDictionary(forKey: "someBool");
      
    let someObject: Dictionary<String, Any> =
      try commandArgs.getValueFromDictionary(forKey: "someObject");
      
    let someArray: NSArray =
      try commandArgs.getValueFromDictionary(forKey: "someArray");
      
    let someStringOptional: String? =
      try? commandArgs.getValueFromDictionary(forKey: "someStringOptional");
    
    resolve([
      "message": "Command received",
      "someString": someString,
      "someNumber": someNumber,
      "someBool": someBool,
      "someObject": someObject,
      "someArray": someArray,
      "someStringOptional": someStringOptional as Any,
    ]);
  };
  
  func somePromiseCommandThatWillAlwaysReject(
    commandArgs: CommandArguments,
    resolve: Resolve
  ) throws {
  
    throw RNIUtilitiesError(
      sender: self,
      errorCode: .runtimeError,
      description: "Invoking this command will always fail xx",
      extraDebugValues: [
        "commandArgs": commandArgs,
      ]
    );
  };
};
