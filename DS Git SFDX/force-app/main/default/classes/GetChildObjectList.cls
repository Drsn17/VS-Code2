/*
 * Created by Cloud Analogy on 3/27/2019.
 */
public class GetChildObjectList {
	public static Map<String,String> getAllChildObjectsForAnObject(String objectName){
		try {
			System.debug('objectName--> '+objectName);

			Map<String,String> childObjectsLabelVsValue = new Map<String,String>();

			List<String> ChildObj = new List<String>();
			//List<String> ChildObjNew = new List<String>();
			Set<String> ChildObject = new Set<String>();
			//Set<String> ChildObjectNew = new Set<String>();
			if (objectName != null && objectName != '') {
				Schema.DescribeSObjectResult R = Schema.getGlobalDescribe().get(objectName).getDescribe();
				for (Schema.ChildRelationship cr : R.getChildRelationships()) {
					Schema.SObjectType sObjType = cr.getChildSObject();
					Schema.DescribeSObjectResult ObjDesc = sObjType.getDescribe();
					Schema.SObjectField Field = cr.getField();
					Schema.DescribeFieldResult FldDesc = Field.getDescribe();
					if (ObjDesc.isCreateable() && FldDesc.isAccessible() && FldDesc.isCreateable()) {
						ChildObject.add(ObjDesc.getName());
					}
				}
			}
			ChildObj.addAll(ChildObject);
			Schema.DescribeSobjectResult[] results = Schema.describeSObjects(ChildObj);
			for (Schema.DescribeSobjectResult describeResult : results) {
				if (describeResult.getChildRelationships() != null) {
					for (Schema.ChildRelationship s : describeResult.getChildRelationships()) {
						if (s.getRelationshipName () != null && (s.getRelationshipName().equalsIgnoreCase('NotesAndAttachments') || s.getRelationshipName().equalsIgnoreCase('Attachments') || (describeResult.getName() == 'Case' && s.getRelationshipName().endsWithIgnoreCase('Attachments')))) {
							String objName = describeResult.getName();
							String objLabel = describeResult.getLabel();
							system.debug('ObjLabel: '+objLabel+' ObjName: '+objName);
							//ChildObjectNew.add(objName);
							childObjectsLabelVsValue.put(objName,objLabel);
						}
					}
				}
			}
			if (childObjectsLabelVsValue.size() > 0) {
				//ChildObjNew.addAll(ChildObjectNew);
				//ChildObjNew.sort();
				System.debug('childObjectsLabelVsValue>>>>>: ' + childObjectsLabelVsValue);
				return childObjectsLabelVsValue;
			}
		}
		catch (Exception ex){
			System.debug('Exception:: '+ex.getMessage()+' At Line No:: '+ex.getLineNumber());
		}
		return null;
	}
}