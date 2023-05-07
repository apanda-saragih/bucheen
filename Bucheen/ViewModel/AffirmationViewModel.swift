import Foundation
import CoreData
import SwiftUI

class AffirmationViewModel: ObservableObject {
    
    @AppStorage("code") var code : String?
    @AppStorage("partner_code") var partnerCode : String?


    let manager = PersistenceController.shared
    @Published var listOfAffirmation: [AffirmationEntity] = []

    init(){
        fetchAffirmation(partnerCode: partnerCode ?? "partner")
    }
    func fetchAffirmation(partnerCode: String) {
        let predicate = NSPredicate(format: "userCode == %@", partnerCode)
        let request: NSFetchRequest<AffirmationEntity> = AffirmationEntity.fetchRequest()
        request.predicate = predicate

        do {
            listOfAffirmation = try manager.viewContext.fetch(request)
        }catch let error {
            print ("Error fetching \(error)")
        }
    }
    

    func addAffirmation(name : String, image: String, userCode: String){
        let newAffirmation = AffirmationEntity(context: manager.viewContext)
        newAffirmation.name = name
        newAffirmation.image = image
        newAffirmation.userCode = code
        newAffirmation.time = Date()
        saveData()
    }

    func saveData(){
        manager.saveData()
        fetchAffirmation(partnerCode: partnerCode ?? "partner")
        print("emotion is saved")
        print(listOfAffirmation)
    }
}
