  //
//  DocumentDirectoryManager.swift
//  ManagersDemo
//
//  Created by iOS Developer on 15/03/18.
//  Copyright © 2018 MobileCoderz. All rights reserved.
//

import UIKit

class DocumentDirectoryManager: NSObject {

   
     class func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    class func directoryExistsAtPath(_ path: String) -> Bool {
        var isDirectory = ObjCBool(false)
        let exists = FileManager.default.fileExists(atPath: path, isDirectory: &isDirectory)
        return exists && isDirectory.boolValue
    }
    
    
    
     class func createNewDirectory(folderName:String, success successBlock: @escaping ((_ isExist:Bool) -> ())) {
        
        let folderPath =  DocumentDirectoryManager.getDocumentsDirectory().appendingPathComponent("\(folderName)")
        if DocumentDirectoryManager.directoryExistsAtPath(folderPath.path) {
           
            // folder exist
            successBlock(false)
   
        }else{
            // create 
            do {
                try FileManager.default.createDirectory(atPath: folderPath.path, withIntermediateDirectories: true, attributes: nil)
                 successBlock(true)
                
            } catch {
                print("Couldn't create document directory")
            }
        }
    }
    
    
    class func deleteDirectory(folderName:String, success deleteBlock: @escaping ((_ isDeleted:Bool) -> ())) {
        
        let folderPath = DocumentDirectoryManager.getDocumentsDirectory().appendingPathComponent("\(folderName)")
        if DocumentDirectoryManager.directoryExistsAtPath(folderPath.path) {
            do {
                // folder delete
                try FileManager.default.removeItem(atPath: folderPath.path)
                deleteBlock(true)
                
            } catch {
                print("Couldn't delete document directory")
            }
            
        }else{
            //  not exist
            deleteBlock(false)
        }
    }
    
    
    
    class func deleteFileFromDocumentDirectory(fileName:String, success deleteBlock: @escaping ((_ isDeleted:Bool) -> ())) {
        
        let filePath =  DocumentDirectoryManager.getDocumentsDirectory().appendingPathComponent(fileName)
        if DocumentDirectoryManager.directoryExistsAtPath(filePath.path) {
            do {
                // file delete
                try FileManager.default.removeItem(atPath: filePath.path)
                deleteBlock(true)
                
            } catch {
                print("Couldn't delete file")
            }
        }else{
            // file not exist
            deleteBlock(false)
        }
    }
    
    
}
