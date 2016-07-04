// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ClubMember.swift instead.

import CoreData

public enum ClubMemberAttributes: String {
    case active = "active"
    case agreedToPhotoAndVideo = "agreedToPhotoAndVideo"
    case agreedToPromotional = "agreedToPromotional"
    case club_location_id = "club_location_id"
    case created_by = "created_by"
    case created_date = "created_date"
    case customer_id = "customer_id"
    case desc = "desc"
    case dob = "dob"
    case email = "email"
    case end_date = "end_date"
    case entity_id = "entity_id"
    case firstname = "firstname"
    case fullname = "fullname"
    case lastname = "lastname"
    case leaveReasonId = "leaveReasonId"
    case medicalHistory = "medicalHistory"
    case memberId = "memberId"
    case modified_by = "modified_by"
    case modified_date = "modified_date"
    case name = "name"
    case phone = "phone"
    case previous_experience = "previous_experience"
    case start_date = "start_date"
}

public class _ClubMember: NSManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "ClubMember"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _ClubMember.entity(managedObjectContext) else { return nil }
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var active: NSNumber?

    @NSManaged public
    var agreedToPhotoAndVideo: NSNumber?

    @NSManaged public
    var agreedToPromotional: NSNumber?

    @NSManaged public
    var club_location_id: NSNumber?

    @NSManaged public
    var created_by: NSNumber?

    @NSManaged public
    var created_date: String?

    @NSManaged public
    var customer_id: NSNumber?

    @NSManaged public
    var desc: String?

    @NSManaged public
    var dob: String?

    @NSManaged public
    var email: String?

    @NSManaged public
    var end_date: String?

    @NSManaged public
    var entity_id: NSNumber?

    @NSManaged public
    var firstname: String?

    @NSManaged public
    var fullname: String?

    @NSManaged public
    var lastname: String?

    @NSManaged public
    var leaveReasonId: NSNumber?

    @NSManaged public
    var medicalHistory: String?

    @NSManaged public
    var memberId: NSNumber?

    @NSManaged public
    var modified_by: NSNumber?

    @NSManaged public
    var modified_date: String?

    @NSManaged public
    var name: String?

    @NSManaged public
    var phone: String?

    @NSManaged public
    var previous_experience: String?

    @NSManaged public
    var start_date: String?

    // MARK: - Relationships

}

