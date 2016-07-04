// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Club.swift instead.

import CoreData

public enum ClubAttributes: String {
    case active = "active"
    case clubtypeId = "clubtypeId"
    case clubtypename = "clubtypename"
    case createdby = "createdby"
    case createddate = "createddate"
    case customerid = "customerid"
    case desc = "desc"
    case enddate = "enddate"
    case entity_id = "entity_id"
    case modifiedby = "modifiedby"
    case modifieddate = "modifieddate"
    case name = "name"
    case organizationdid = "organizationdid"
    case startdate = "startdate"
}

public class _Club: NSManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "Club"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _Club.entity(managedObjectContext) else { return nil }
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var active: NSNumber?

    @NSManaged public
    var clubtypeId: NSNumber?

    @NSManaged public
    var clubtypename: String?

    @NSManaged public
    var createdby: NSNumber?

    @NSManaged public
    var createddate: String?

    @NSManaged public
    var customerid: NSNumber?

    @NSManaged public
    var desc: String?

    @NSManaged public
    var enddate: String?

    @NSManaged public
    var entity_id: NSNumber?

    @NSManaged public
    var modifiedby: NSNumber?

    @NSManaged public
    var modifieddate: String?

    @NSManaged public
    var name: String?

    @NSManaged public
    var organizationdid: NSNumber?

    @NSManaged public
    var startdate: String?

    // MARK: - Relationships

}

