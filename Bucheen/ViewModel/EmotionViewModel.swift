//
//  EmotionViewModel.swift
//  cobaBucheen
//
//  Created by Jonathan Axel Benaya on 26/04/23.
//


import Foundation
import CoreData
import SwiftUI


class EmotionViewModel: ObservableObject {
    
    @AppStorage("code") var code : String?
    @AppStorage("partner_code") var partnerCode : String?


    let manager = PersistenceController.shared
    @Published var listOfEmotions : [EmotionEntity] = []
    @Published var listOfPartnerEmotions : [EmotionEntity] = []

    init(){
        fetchEmotions(userCode: code ?? "00000", partnerCode: partnerCode ?? "partner")
    }
    func fetchEmotions(userCode : String, partnerCode: String) {
        let predicate = NSPredicate(format: "userCode == %@ OR userCode == %@", userCode, partnerCode)
        let request: NSFetchRequest<EmotionEntity> = EmotionEntity.fetchRequest()
        request.predicate = predicate

        do {
            listOfEmotions = try manager.viewContext.fetch(request)
        }catch let error {
            print ("Error fetching \(error)")
        }
    }
    

    func addEmotions(userCode: String, name : String, image: String, color:String){
        let newEmotion = EmotionEntity(context: manager.viewContext)
        newEmotion.userCode = userCode
        newEmotion.name = name
        newEmotion.image = image
        newEmotion.color = color
        newEmotion.time = Date()
        saveData()
    }

    func saveData(){
        manager.saveData()
        fetchEmotions(userCode: code ?? "00000", partnerCode: partnerCode ?? "partner")
        print("emotion is saved")
        print(listOfEmotions)
    }


}
