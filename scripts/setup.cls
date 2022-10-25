private static void enable_sales_rep_api_class_on_public_apis_profile() {
    ApexClass apxCls = [SELECT Id FROM ApexClass WHERE Name = 'SalesRepAPI'][0];
    PermissionSet pms = [SELECT Id FROM PermissionSet WHERE IsOwnedByProfile = TRUE AND Profile.Name = 'Public APIs Profile'][0];

    List<SetupEntityAccess> existingMatchingSetupEntityAccesses = [
        SELECT id, parentid, parent.name, setupentityid, setupentitytype 
        FROM SetupEntityAccess 
        WHERE SetupEntityId = :apxCls.Id
        AND ParentId = :pms.Id
    ];

    if (existingMatchingSetupEntityAccesses.size() > 0) {
        return;
    }

    INSERT new SetupEntityAccess(SetupEntityId = apxCls.Id, ParentId = pms.Id);
}