public with sharing class StringArrayTest {
       public static list<string> generateStringArray(Integer n)
    {
        list<string> myArray = new list<string>();
        for(integer i=0;i<n;i++)
        {
            myArray.add('Test '+i);
            system.debug(myArray[i]);
        }
        return myArray;  
    }
}