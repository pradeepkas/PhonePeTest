



import Foundation

protocol LocalData {
    func saveLocalPlayList(_ data: [String: [String]])
    func getLocalPlayList() -> [String: [String]]
}


class LocalHandler: LocalData {
    
    func saveLocalPlayList(_ data: [String : [String]]) {
        do {
            let finalData:Data = try JSONSerialization.data(
                withJSONObject: data,
                options: .prettyPrinted
            )
            UserDefaults.jsonData = finalData
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getLocalPlayList() -> [String : [String]] {
        guard let jsonData = UserDefaults.jsonData else {return [:]}
        do {
            let res = try JSONDecoder().decode([String : [String]].self, from: jsonData)
            return res
        }catch let error {
            print(error.localizedDescription)
            return [:]
        }
    }
    
    
    
}
