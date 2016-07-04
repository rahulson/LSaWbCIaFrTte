import Foundation
import MagicalRecord
import FastEasyMapping
@objc(EventStatistics)
public class EventStatistics: _EventStatistics {
    class func defaultMapping() -> FEMMapping{
        let mapping = FEMMapping.init(entityName: EventStatistics.entityName());
        let dict = CDHelper.mappingforclass(NSClassFromString(EventStatistics.entityName())!).mutableCopy() as! NSMutableDictionary;
        dict.removeObjectForKey("totalArrivedMember");
        dict.removeObjectForKey("totalLeftMember");
        dict.removeObjectForKey("totalRegisteredMember");
        mapping.addAttribute(EventStatistics.intAttributeFor("totalArrivedMember", keypath: "TotalArrivedMember"));
        mapping.addAttribute(EventStatistics.intAttributeFor("totalLeftMember", keypath: "TotalLeftMember"));
        mapping.addAttribute(EventStatistics.intAttributeFor("totalRegisteredMember", keypath: "TotalRegisteredMember"));
        return mapping
    
}
    class func getAll() ->NSMutableArray{
        let arr =  EventStatistics.MR_findAll()! as NSArray
        return arr.mutableCopy() as! NSMutableArray
    }
    class func getEventStatistics() ->EventStatistics{
        let arr =  EventStatistics.MR_findAll()! as NSArray
        return arr.objectAtIndex(0) as! EventStatistics;
    }

}