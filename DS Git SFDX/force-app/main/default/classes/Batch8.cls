global class Batch8 implements Schedulable {
	
    global static Void ScheduleRun(){
      System.schedule('Count No Of Contact in Account 55','0 0 * * * ?', new Batch8());
      System.schedule('Count No Of Contact in Account 0','0 5 * * * ?', new Batch8());
      System.schedule('Count No Of Contact in Account 5','0 10 * * * ?', new Batch8());
      System.schedule('Count No Of Contact in Account 10','0 15 * * * ?', new Batch8());
      System.schedule('Count No Of Contact in Account 15','0 20 * * * ?', new Batch8());
      System.schedule('Count No Of Contact in Account 20','0 25 * * * ?', new Batch8());
      System.schedule('Count No Of Contact in Account 25','0 30 * * * ?', new Batch8());
      System.schedule('Count No Of Contact in Account 30','0 35 * * * ?', new Batch8());
      System.schedule('Count No Of Contact in Account 35','0 40 * * * ?', new Batch8());
      System.schedule('Count No Of Contact in Account 40','0 45 * * * ?', new Batch8());
      System.schedule('Count No Of Contact in Account 45','0 50 * * * ?', new Batch8());
      System.schedule('Count No Of Contact in Account 50','0 55 * * * ?', new Batch8());
      
        }
    global void execute(SchedulableContext sc){ 
        Batch7 b7 = new Batch7();
        Database.executeBatch(b7);  
    }
   }