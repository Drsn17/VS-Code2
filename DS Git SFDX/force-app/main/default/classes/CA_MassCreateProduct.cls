public with sharing class CA_MassCreateProduct {
	public String currentRecordId {get;set;}
    // public List newProductInsert {get;set;}
    list<Product2> productlist=new list<Product2>();
    Public String getValue{get;set;}   
    public Product2 pd;
        
    public CA_MassCreateProduct(ApexPages.StandardController controller)
    {
    	currentRecordId=ApexPages.currentPage().getParameters().get('Id');        		
        pd=new Product2();	
        pd = [select id, name, family,Description from Product2 where Id =: currentRecordId limit 1];				
    }	 
                     
    public void Check()
    {
    	//List newProductInsert = new List();  
        if(pd.Description!=null)
        {
            if(pd.Family=='COG PPE Scrap' && getValue=='Yes')
            {                     
                Product2 pr = new Product2();           
                pr.Name=pd.Name;     
                pr.family=pd.family;
                pr.Description=pd.Description+'- Scrap';          
                Insert pr; 
                    
                Product2 pr2 = new Product2();  
                pr2.Name=pd.Name+'-scrap';  
                pr2.family=pd.family;
                pr2.Description=pd.Description+'- Scrap';     
                Insert pr2; 
        	}
        	else if(pd.Family=='COG PPE Scrap' && getValue=='No')
        	{                  
                Product2 pr = new Product2();           
                pr.Name=pd.Name+'- scrap';    
                pr.family=pd.family;
                pr.Description=pd.Description+'- Scrap';           
                Insert pr;       
        	}              
        	else if(pd.Family=='COG PPE' && (getValue=='No' || getValue=='Yes'))
        	{                      
                Product2 pr = new Product2();          
                pr.Name=pd.Name;    
                pr.family=pd.family;
                pr.Description=pd.Description+'- Scrap';         
                Insert pr;  
        	}
        }
        else
        {
        	if(pd.Family=='COG PPE Scrap' && getValue=='Yes')
            {                     
                Product2 pr = new Product2();           
                pr.Name=pd.Name;     
                pr.family=pd.family;
                pr.Description='Scrap';          
                Insert pr; 
                    
                Product2 pr2 = new Product2();  
                pr2.Name=pd.Name+'scrap';  
                pr2.family=pd.family;
                pr2.Description='Scrap';   
                Insert pr2; 
            }
            else if(pd.Family=='COG PPE Scrap' && getValue=='No')
            {                  
                Product2 pr = new Product2();           
                pr.Name=pd.Name+'- scrap';    
                pr.family=pd.family;
                pr.Description='Scrap';           
                Insert pr;       
        	}              
            else if(pd.Family=='COG PPE' && (getValue=='No' || getValue=='Yes'))
            {                      
                Product2 pr = new Product2();          
                pr.Name=pd.Name;    
                pr.family=pd.family;
                pr.Description='Scrap';         
                Insert pr;  
        	}
        }
    }
}