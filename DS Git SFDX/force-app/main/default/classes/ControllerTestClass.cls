public class ControllerTestClass {
    List<Contact> contacts;
    public List<Contact> getContacts() {
        if(contacts == null)
		contacts = [SELECT FirstName, Lastname FROM Contact LIMIT 100];
        return contacts;
    } 
}