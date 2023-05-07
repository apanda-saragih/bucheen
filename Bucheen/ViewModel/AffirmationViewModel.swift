import Foundation
import CoreData
import SwiftUI

class AffirmationViewModel: ObservableObject {
    
    @AppStorage("code") var code : String?
    @AppStorage("partner_code") var partnerCode : String?


    let manager = PersistenceController.shared
    @Published var listOfAffirmation: [AffirmationEntity] = []

    init(){
        fetchAffirmation(userCode: code ?? "00000", partnerCode: partnerCode ?? "partner")
    }
    func fetchAffirmation(userCode : String, partnerCode: String) {
        let predicate = NSPredicate(format: "userCode == %@ OR userCode == %@", userCode, partnerCode)
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
        newAffirmation.userCode = partnerCode
        newAffirmation.time = Date()
        saveData()
    }

    func saveData(){
        manager.saveData()
        fetchAffirmation(userCode: code ?? "00000", partnerCode: partnerCode ?? "partner")
        print("emotion is saved")
        print(listOfAffirmation)
    }
}
