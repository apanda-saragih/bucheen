////
////  EmotionViewModel.swift
////  cobaBucheen
////
////  Created by Jonathan Axel Benaya on 26/04/23.
////
//
//
//import Foundation
//import CoreData
//
////singleton
//class EmotionManager {
//    static let instance = EmotionManager()
//    let container : NSPersistentContainer
//    let context : NSManagedObjectContext
//
//    init(){
//        container = NSPersistentContainer(name: "BucheenCoreData")
//        container.loadPersistentStores { (description, error) in
//            if let error = error {
//                print("error loading coredata! \(error)")
//            } else {
//                print("succesfully loaded core data!")
//            }
//        }
//        context = container.viewContext
//    }
//
//    func saveData(){
//        do {
//            try context.save()
//        } catch let error {
//            print("Error saving.\(error)")
//        }
//    }
//}
//
//class EmotionViewModel: ObservableObject {
//
//    let manager = EmotionManager.instance
//    @Published var listOfEmotions : [EmotionEntity] = []
//
//    init(){
//        fetchEmotions()
//    }
//    func fetchEmotions() {
//        let request = NSFetchRequest<EmotionEntity>(entityName: "EmotionEntity")
//
//        do {
//            listOfEmotions = try manager.context.fetch(request)
//        }catch let error {
//            print ("Error fetching \(error)")
//        }
//    }
//
//    func addEmotions(user: String, name : String, image: String, color:String){
//        let newEmotion = EmotionEntity(context: manager.context)
//        newEmotion.user = user
//        newEmotion.name = name
//        newEmotion.image = image
//        newEmotion.color = color
//        newEmotion.time = Date()
//        saveData()
//    }
//
//    func saveData(){
////        listOfEmotions.removeAll()
//
//        manager.saveData()
//        fetchEmotions()
//        print("emotion is saved")
//        print(listOfEmotions.count)
//    }
//
//
//}
