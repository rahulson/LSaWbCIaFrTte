// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to EventStatistics.swift instead.

import CoreData

public enum EventStatisticsAttributes: String {
    case totalArrivedMember = "totalArrivedMember"
    case totalLeftMember = "totalLeftMember"
    case totalRegisteredMember = "totalRegisteredMember"
}

public class _EventStatistics: NSManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "EventStatistics"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _EventStatistics.entity(managedObjectContext) else { return nil }
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var totalArrivedMember: NSNumber?

    @NSManaged public
    var totalLeftMember: NSNumber?

    @NSManaged public
    var totalRegisteredMember: NSNumber?

    // MARK: - Relationships

}

