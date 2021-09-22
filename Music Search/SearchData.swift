//
//	SearchData.swift
//
//
//  Created by John D. Jackson on 9/22/21.
//
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class SearchData : NSObject, NSCoding{

    var aCount : String!
    var bCount : String!
    var cCount : String!
    var catalogNbr : String!
    var courseDescription : String!
    var dCount : String!
    var dropCount : String!
    var fCount : String!
    var id : Int!
    var instructorFirst : String!
    var instructorLast : String!
    var percentA : String!
    var satisfactory : String!
    var subject : String!
    var term : String!


    /**
     * Overiding init method
     */
    init(fromDictionary dictionary: NSDictionary)
    {
        super.init()
        parseJSONData(fromDictionary: dictionary)
    }

    /**
     * Overiding init method
     */
    override init(){
    }

    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    @objc func parseJSONData(fromDictionary dictionary: NSDictionary)
    {
        aCount = dictionary["aCount"] as? String == nil ? "" : dictionary["aCount"] as? String
        bCount = dictionary["bCount"] as? String == nil ? "" : dictionary["bCount"] as? String
        cCount = dictionary["cCount"] as? String == nil ? "" : dictionary["cCount"] as? String
        catalogNbr = dictionary["catalogNbr"] as? String == nil ? "" : dictionary["catalogNbr"] as? String
        courseDescription = dictionary["courseDescription"] as? String == nil ? "" : dictionary["courseDescription"] as? String
        dCount = dictionary["dCount"] as? String == nil ? "" : dictionary["dCount"] as? String
        dropCount = dictionary["dropCount"] as? String == nil ? "" : dictionary["dropCount"] as? String
        fCount = dictionary["fCount"] as? String == nil ? "" : dictionary["fCount"] as? String
        id = dictionary["id"] as? Int == nil ? 0 : dictionary["id"] as? Int
        instructorFirst = dictionary["instructorFirst"] as? String == nil ? "" : dictionary["instructorFirst"] as? String
        instructorLast = dictionary["instructorLast"] as? String == nil ? "" : dictionary["instructorLast"] as? String
        percentA = dictionary["percentA"] as? String == nil ? "" : dictionary["percentA"] as? String
        satisfactory = dictionary["satisfactory"] as? String == nil ? "" : dictionary["satisfactory"] as? String
        subject = dictionary["subject"] as? String == nil ? "" : dictionary["subject"] as? String
        term = dictionary["term"] as? String == nil ? "" : dictionary["term"] as? String
    }

    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if aCount != nil{
            dictionary["aCount"] = aCount
        }
        if bCount != nil{
            dictionary["bCount"] = bCount
        }
        if cCount != nil{
            dictionary["cCount"] = cCount
        }
        if catalogNbr != nil{
            dictionary["catalogNbr"] = catalogNbr
        }
        if courseDescription != nil{
            dictionary["courseDescription"] = courseDescription
        }
        if dCount != nil{
            dictionary["dCount"] = dCount
        }
        if dropCount != nil{
            dictionary["dropCount"] = dropCount
        }
        if fCount != nil{
            dictionary["fCount"] = fCount
        }
        if id != nil{
            dictionary["id"] = id
        }
        if instructorFirst != nil{
            dictionary["instructorFirst"] = instructorFirst
        }
        if instructorLast != nil{
            dictionary["instructorLast"] = instructorLast
        }
        if percentA != nil{
            dictionary["percentA"] = percentA
        }
        if satisfactory != nil{
            dictionary["satisfactory"] = satisfactory
        }
        if subject != nil{
            dictionary["subject"] = subject
        }
        if term != nil{
            dictionary["term"] = term
        }
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         aCount = aDecoder.decodeObject(forKey: "aCount") as? String
         bCount = aDecoder.decodeObject(forKey: "bCount") as? String
         cCount = aDecoder.decodeObject(forKey: "cCount") as? String
         catalogNbr = aDecoder.decodeObject(forKey: "catalogNbr") as? String
         courseDescription = aDecoder.decodeObject(forKey: "courseDescription") as? String
         dCount = aDecoder.decodeObject(forKey: "dCount") as? String
         dropCount = aDecoder.decodeObject(forKey: "dropCount") as? String
         fCount = aDecoder.decodeObject(forKey: "fCount") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         instructorFirst = aDecoder.decodeObject(forKey: "instructorFirst") as? String
         instructorLast = aDecoder.decodeObject(forKey: "instructorLast") as? String
         percentA = aDecoder.decodeObject(forKey: "percentA") as? String
         satisfactory = aDecoder.decodeObject(forKey: "satisfactory") as? String
         subject = aDecoder.decodeObject(forKey: "subject") as? String
         term = aDecoder.decodeObject(forKey: "term") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    public func encode(with aCoder: NSCoder)
    {
        if aCount != nil{
            aCoder.encode(aCount, forKey: "aCount")
        }
        if bCount != nil{
            aCoder.encode(bCount, forKey: "bCount")
        }
        if cCount != nil{
            aCoder.encode(cCount, forKey: "cCount")
        }
        if catalogNbr != nil{
            aCoder.encode(catalogNbr, forKey: "catalogNbr")
        }
        if courseDescription != nil{
            aCoder.encode(courseDescription, forKey: "courseDescription")
        }
        if dCount != nil{
            aCoder.encode(dCount, forKey: "dCount")
        }
        if dropCount != nil{
            aCoder.encode(dropCount, forKey: "dropCount")
        }
        if fCount != nil{
            aCoder.encode(fCount, forKey: "fCount")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if instructorFirst != nil{
            aCoder.encode(instructorFirst, forKey: "instructorFirst")
        }
        if instructorLast != nil{
            aCoder.encode(instructorLast, forKey: "instructorLast")
        }
        if percentA != nil{
            aCoder.encode(percentA, forKey: "percentA")
        }
        if satisfactory != nil{
            aCoder.encode(satisfactory, forKey: "satisfactory")
        }
        if subject != nil{
            aCoder.encode(subject, forKey: "subject")
        }
        if term != nil{
            aCoder.encode(term, forKey: "term")
        }

    }

}
