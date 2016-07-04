import Foundation
import MagicalRecord
import FastEasyMapping
@objc(Event)
public class Event: _Event {
    class func defaultMapping() -> FEMMapping{
        let mapping = FEMMapping.init(entityName: Event.entityName());
        let dict = CDHelper.mappingforclass(NSClassFromString(Event.entityName())!).mutableCopy() as! NSMutableDictionary;
        dict.removeObjectForKey("active");
        dict.removeObjectForKey("is_arrive");
        dict.removeObjectForKey("is_leave");
        dict.removeObjectForKey("customer_id");
        dict.removeObjectForKey("entity_id");
        dict.removeObjectForKey("modifiedby");
        dict.removeObjectForKey("createdby");
        dict.removeObjectForKey("event_id");
        dict.removeObjectForKey("member_id");
        dict.removeObjectForKey("value");
        mapping.addAttributesFromDictionary(dict as [NSObject : AnyObject]);
        mapping.addAttribute(Event.boolAttributeFor("active", keypath: "Active"));
        mapping.addAttribute(Event.boolAttributeFor("is_arrive", keypath: "IsArive"));
        mapping.addAttribute(Event.boolAttributeFor("is_leave", keypath: "IsLeave"));
        mapping.addAttribute(Event.intAttributeFor("customer_id", keypath: "CustomerID"));
        mapping.addAttribute(Event.intAttributeFor("createdby", keypath: "CreatedBy"));
        mapping.addAttribute(Event.intAttributeFor("entity_id", keypath: "Id"));
        mapping.addAttribute(Event.intAttributeFor("event_id", keypath: "EventId"));
        mapping.addAttribute(Event.intAttributeFor("modifiedby", keypath: "ModifiedBy"));
        mapping.addAttribute(Event.intAttributeFor("value", keypath: "Value"));
        mapping.primaryKey = "entity_id";
        return mapping;
    }
    
    class func getAll() ->NSMutableArray{
        let arr =  Event.MR_findAll()! as NSArray
        return arr.mutableCopy() as! NSMutableArray
    }
	// Custom logic goes here.
}
