//
//  Log.swift
//  MainApp
//
//  Created by William Inx on 01/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

final class Log {
    
    enum LogEvent: String{
        case error = "[‼️]"
        case info = "[📌]"
        case debug = "[🔍]"
        case warning = "[⚠️]"
        case progress = "[🕑]"
    }
    
    private static var isDebug: Bool {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }
    
    private class func sourceFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        guard let lastComponent = components.last else {return ""}
        return components.isEmpty ? "" : lastComponent
    }
    
    class func error(message: Any, taskRef: String = "", event: LogEvent = .error, fileName: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        if isDebug {
            Swift.print(
                #"""
                |🟥| \#(event.rawValue) - [\#(taskRef)]
                |🟥| [\#(funcName)] :
                |🟥| Line   - [\#(line)] || Column - [\#(column)]
                |🟥| [\#(sourceFileName(filePath: fileName))]
                |🟥| Message:
                |🟥| [\#(message)]
                
                """#
            )
        }
    }
    
    class func info(message: Any, taskRef: String = "", event: LogEvent = .info, fileName: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        if isDebug {
            Swift.print(
                #"""
                |🟦| \#(event.rawValue) - [\#(taskRef)]
                |🟦| [\#(funcName)] :
                |🟦| Line   - [\#(line)] || Column - [\#(column)]
                |🟦| [\#(sourceFileName(filePath: fileName))]
                |🟦| Message:
                |🟦| [\#(message)]
                
                """#
            )
        }
    }
    
    class func debug(message: Any, taskRef: String = "", event: LogEvent = .debug, fileName: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        if isDebug {
            Swift.print(
                #"""
                |🟪| \#(event.rawValue) - [\#(taskRef)]
                |🟪| [\#(funcName)] :
                |🟪| Line - [\#(line)] || Column - [\#(column)]
                |🟪| [\#(sourceFileName(filePath: fileName))]
                |🟪| Message:
                |🟪| [\#(message)]
                
                """#
            )
        }
    }
    
    class func warning(message: Any, taskRef: String = "", event: LogEvent = .warning, fileName: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        if isDebug {
            Swift.print(
                #"""
                |🟨| \#(event.rawValue) - [\#(taskRef)]
                |🟨| [\#(funcName)] :
                |🟨| Line   - [\#(line)] || Column - [\#(column)]
                |🟨| [\#(sourceFileName(filePath: fileName))]
                |🟨| Message:
                |🟨| [\#(message)]
                
                """#
            )
        }
    }
    
    class func progress(message: Any, taskRef: String = "", event: LogEvent = .progress, fileName: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        if isDebug {
            Swift.print(
                #"""
                
                |🟩| \#(event.rawValue) - [\#(taskRef)]
                |🟩| [\#(funcName)] :
                |🟩| Line   - [\#(line)] || Column - [\#(column)]
                |🟩| [\#(sourceFileName(filePath: fileName))]
                |🟩| Message:
                |🟩| [\#(message)]
                
                """#
            )
        }
    }
}
