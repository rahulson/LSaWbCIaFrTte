import Foundation
import MagicalRecord
import FastEasyMapping
@objc(ClubMember)
public class ClubMember: _ClubMember {
	// Custom logic goes here.
    class func defaultMapping() -> FEMMapping{
        let mapping = FEMMapping.init(entityName: ClubMember.entityName());
        let dict = CDHelper.mappingforclass(NSClassFromString(ClubMember.entityName())!).mutableCopy() as! NSMutableDictionary;
        dict.removeObjectForKey("club_location_id");
        dict.removeObjectForKey("created_by");
        dict.removeObjectForKey("customer_id");
        dict.removeObjectForKey("leaveReasonId");
        dict.removeObjectForKey("memberId");
        dict.removeObjectForKey("modified_by");
        dict.removeObjectForKey("entity_id");
        dict.removeObjectForKey("active");
        dict.removeObjectForKey("agreedToPhotoAndVideo");
        dict.removeObjectForKey("agreedToPromotional");
        mapping.addAttributesFromDictionary(dict as [NSObject : AnyObject])
        mapping.addAttribute(ClubMember.intAttributeFor("club_location_id", keypath: ""));
        mapping.addAttribute(ClubMember.intAttributeFor("created_by", keypath: "CreatedBy"));
        mapping.addAttribute(ClubMember.intAttributeFor("customer_id", keypath: "CustomerID"));
        mapping.addAttribute(ClubMember.intAttributeFor("leaveReasonId", keypath: "LeaveReasonId"));
        mapping.addAttribute(ClubMember.intAttributeFor("memberId", keypath: "MemberId"));
        mapping.addAttribute(ClubMember.intAttributeFor("modified_by", keypath: "ModifiedBy"));
        mapping.addAttribute(ClubMember.intAttributeFor("entity_id", keypath: "Id"));
        mapping.addAttribute(ClubMember.boolAttributeFor("active", keypath: "Active"));
        mapping.addAttribute(ClubMember.boolAttributeFor("agreedToPhotoAndVideo", keypath: "AgreedToPhotoAndVideo"));
        mapping.addAttribute(ClubMember.boolAttributeFor("agreedToPromotional", keypath: "AgreedToPromotional"));
        return mapping;
    }
    class func getAll() ->NSMutableArray{
        let arr =  ClubMember.MR_findAll()! as NSArray
        return arr.mutableCopy() as! NSMutableArray
    }
}
