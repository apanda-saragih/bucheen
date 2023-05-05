////
////  AffirmationViewModel.swift
////  Bucheen
////
////  Created by Abraham Putra Lukas on 01/05/23.
////
//
//import Foundation
//import CoreData
//
//class AffirmationManager {
//    static let affirmInstance = AffirmationManager()
//    let affirmContainer : NSPersistentContainer
//    let affirmContext : NSManagedObjectContext
//
//    init(){
//        affirmContainer = NSPersistentContainer(name: "Bucheen")
//        affirmContainer.loadPersistentStores { (description, error) in
//            if let error = error {
//                print("error loading coredata! \(error)")
//            } else {
//                print("succesfully loaded core data!")
//            }
//        }
//        affirmContext = affirmContainer.viewContext
//    }
//
//    func saveData(){
//        do {
//            try affirmContext.save()
//        } catch let error {
//            print("Error saving.\(error)")
//        }
//    }
//}
//
//class AffirmationViewModel: ObservableObject {
//
//    let affirmManager = AffirmationManager.affirmInstance
//    @Published var listOfAffirmations : [AffirmationEntity] = []
//
//    init(){
//        fetchAffirmations()
//    }
//    func fetchAffirmations() {
//        let request = NSFetchRequest<AffirmationEntity>(entityName: "AffirmationEntity")
//
//        do {
//            listOfAffirmations = try affirmManager.affirmContext.fetch(request)
//        }catch let error {
//            print ("Error fetching \(error)")
//        }
//    }
//
//    func addAffirmations(name : String, image: String, partnerCode : String){
//        let newAffirmation = AffirmationEntity(context: affirmManager.affirmContext)
//        newAffirmation.partnerCode = partnerCode
//        newAffirmation.name = name
//        newAffirmation.image = image
//        newAffirmation.time = Date()
//        saveData()
//    }
//
//    func saveData(){
//        affirmManager.saveData()
//        fetchAffirmations()
//        print("affirm is saved")
//        print(listOfAffirmations.count)
//    }
//
//
//}
