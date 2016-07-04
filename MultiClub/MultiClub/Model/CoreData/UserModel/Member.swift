import Foundation
import MagicalRecord
import FastEasyMapping
@objc(Member)
public class Member: _Member {
    class func defaultMapping() -> FEMMapping{
        let mapping = FEMMapping.init(entityName: Member.entityName());
        let dict = CDHelper.mappingforclass(NSClassFromString(Member.entityName())!).mutableCopy() as! NSMutableDictionary;
        dict.removeObjectForKey("active");
        dict.removeObjectForKey("is_arrive");
        dict.removeObjectForKey("is_leave");
        dict.removeObjectForKey("customer_id");
        dict.removeObjectForKey("entity_id");
        dict.removeObjectForKey("modifiedby");
        dict.removeObjectForKey("createdby");
        dict.removeObjectForKey("event_id");
        dict.removeObjectForKey("member_id");
        dict.removeObjectForKey("agreedToPhotoAndVideo");
        //dict.removeObjectForKey("value");
        mapping.addAttributesFromDictionary(dict as [NSObject : AnyObject]);
        mapping.addAttribute(Member.boolAttributeFor("active", keypath: "Active"));
        mapping.addAttribute(Member.boolAttributeFor("is_arrive", keypath: "IsArive"));
        mapping.addAttribute(Member.boolAttributeFor("is_leave", keypath: "IsLeave"));
        mapping.addAttribute(Member.intAttributeFor("customer_id", keypath: "CustomerID"));
        mapping.addAttribute(Member.intAttributeFor("createdby", keypath: "CreatedBy"));
        mapping.addAttribute(Member.intAttributeFor("entity_id", keypath: "Id"));
        mapping.addAttribute(Member.intAttributeFor("event_id", keypath: "EventId"));
        mapping.addAttribute(Member.intAttributeFor("modifiedby", keypath: "ModifiedBy"));
        mapping.addAttribute(Member.intAttributeFor("member_id", keypath: "MemberId"));
        mapping.addAttribute(Member.boolAttributeFor("agreedToPhotoAndVideo", keypath: "AgreedToPhotoAndVideo"));
        //mapping.addAttribute(Member.intAttributeFor("value", keypath: "Value"));
        //mapping.primaryKey = "entity_id";
        return mapping;
    }
    
    class func getAll() ->NSMutableArray{
        let arr =  Member.MR_findAllSortedBy("name", ascending: true, inContext: (NSManagedObjectContext.MR_defaultContext()))! as NSArray
        return arr.mutableCopy() as! NSMutableArray
    }
	// Custom logic goes here.
}
