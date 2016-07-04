import Foundation
import MagicalRecord
import FastEasyMapping

@objc(Club)
public class Club: _Club {
    
    
    class func defaultMapping() -> FEMMapping{
        let mapping = FEMMapping.init(entityName: Club.entityName());
        let dict = CDHelper.mappingforclass(NSClassFromString(Club.entityName())!).mutableCopy() as! NSMutableDictionary;
        dict.removeObjectForKey("active");
        dict.removeObjectForKey("clubtypeId");
        dict.removeObjectForKey("createdby");
        dict.removeObjectForKey("customerid");
        dict.removeObjectForKey("entity_id");
        dict.removeObjectForKey("modifiedby");
        dict.removeObjectForKey("organizationdid");
        mapping.addAttributesFromDictionary(dict as [NSObject : AnyObject]);
        mapping.addAttribute(Club.boolAttributeFor("active", keypath: "Active"));
        mapping.addAttribute(Club.intAttributeFor("clubtypeId", keypath: "ClubTypeID"));
        mapping.addAttribute(Club.intAttributeFor("createdby", keypath: "CreatedBy"));
        mapping.addAttribute(Club.intAttributeFor("customerid", keypath: "CustomerID"));
        mapping.addAttribute(Club.intAttributeFor("entity_id", keypath: "Id"));
        mapping.addAttribute(Club.intAttributeFor("modifiedby", keypath: "ModifiedBy"));
        mapping.addAttribute(Club.intAttributeFor("organizationdid", keypath: "OrganizationId"));
        mapping.primaryKey = "entity_id";
        return mapping;
    }
    
    class func newEntity() -> Club{
        let club:Club = Club.MR_createEntityInContext(NSManagedObjectContext.MR_defaultContext())!;
        return club;
    }
    
     class func getAll() ->NSMutableArray{
         let arr =  Club.MR_findAll()! as NSArray
        return arr.mutableCopy() as! NSMutableArray
    }
    
}
