public with sharing class dynamicapex {
  @AuraEnabled
  public static List<EntityDefinition> getAllObjects() {
    try {
      return [
        SELECT MasterLabel, QualifiedApiName
        FROM EntityDefinition
        WHERE IsCustomizable = TRUE AND IsDeprecatedAndHidden = FALSE
        ORDER BY MasterLabel ASC
      ];
    } catch (Exception e) {
      throw new AuraHandledException(e.getMessage());
    }
  }
  @AuraEnabled
  public static List<sObject> retrieveRecords(String objectType) {
    List<String> fieldslist = new List<String>();
    Schema.SObjectType objType = Schema.getGlobalDescribe().get(objectType);
    Schema.DescribeSObjectResult objDescribe = objType.getDescribe();
    for (Schema.SObjectField field : objDescribe.fields.getMap().values()) {
      fieldslist.add(field.getDescribe().getName());
    }

    String fields = String.join(fieldslist, ',');
    String query = 'SELECT ' + fields + ' FROM ' + objectType;
    System.debug(query);
    return Database.query(query);
  }
  @AuraEnabled
  public static List<sObject> getSObjectTypeById(Id recordId) {
    Schema.SObjectType objectType = recordId.getSObjectType();
    String objapi= objectType.getDescribe().getName();
        List<String> fieldslist = new List<String>();
    Schema.SObjectType objType = Schema.getGlobalDescribe().get(objapi);
    Schema.DescribeSObjectResult objDescribe = objType.getDescribe();
    for (Schema.SObjectField field : objDescribe.fields.getMap().values()) {
      fieldslist.add(field.getDescribe().getName());
    }

    String fields = String.join(fieldslist, ',');
    String query = 'SELECT ' + fields + ' FROM ' + objectType +' WHERE Id = \'' + recordId + '\'';
    System.debug(query);
    return Database.query(query);
  }
}
