// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Member.swift instead.

import CoreData

public enum MemberAttributes: String {
    case active = "active"
    case agreedToPhotoAndVideo = "agreedToPhotoAndVideo"
    case comment = "comment"
    case createdby = "createdby"
    case createddate = "createddate"
    case customer_id = "customer_id"
    case desc = "desc"
    case end_date = "end_date"
    case end_time = "end_time"
    case entity_id = "entity_id"
    case event_id = "event_id"
    case eventname = "eventname"
    case is_arrive = "is_arrive"
    case is_leave = "is_leave"
    case medicalHistory = "medicalHistory"
    case member_id = "member_id"
    case modified_date = "modified_date"
    case modifiedby = "modifiedby"
    case name = "name"
    case organiser_name = "organiser_name"
    case start_date = "start_date"
    case start_time = "start_time"
    case type = "type"
    case value = "value"
}

public class _Member: NSManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "Member"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _Member.entity(managedObjectContext) else { return nil }
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var active: NSNumber?

    @NSManaged public
    var agreedToPhotoAndVideo: NSNumber?

    @NSManaged public
    var comment: String?

    @NSManaged public
    var createdby: NSNumber?

    @NSManaged public
    var createddate: String?

    @NSManaged public
    var customer_id: NSNumber?

    @NSManaged public
    var desc: String?

    @NSManaged public
    var end_date: String?

    @NSManaged public
    var end_time: String?

    @NSManaged public
    var entity_id: NSNumber?

    @NSManaged public
    var event_id: NSNumber?

    @NSManaged public
    var eventname: String?

    @NSManaged public
    var is_arrive: NSNumber?

    @NSManaged public
    var is_leave: NSNumber?

    @NSManaged public
    var medicalHistory: String?

    @NSManaged public
    var member_id: NSNumber?

    @NSManaged public
    var modified_date: String?

    @NSManaged public
    var modifiedby: NSNumber?

    @NSManaged public
    var name: String?

    @NSManaged public
    var organiser_name: String?

    @NSManaged public
    var start_date: String?

    @NSManaged public
    var start_time: String?

    @NSManaged public
    var type: String?

    @NSManaged public
    var value: String?

    // MARK: - Relationships

}

