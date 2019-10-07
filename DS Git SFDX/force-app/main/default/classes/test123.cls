public class test123 {
public integer a=2,b=3;
    public void meth1(){
        integer c= a+b;
        system.debug('Value without params >>>>>>'+c);
        
    }
    public void methwithparams(integer x,integer y){
       // x=a;//overrides the value of this.a
       // y=b;
        system.debug('x'+x+''+'y'+y);
        //y=this.y;
        //system.debug('xxxxx'+x);
        a=x; //overrides the value of this.a
        b=y;
        
        system.debug('a'+a+''+'b'+b);
      this.a=x;
        this.b=y;
        system.debug('a'+a+''+'b'+b);
        system.debug('x'+x+''+'y'+y);
       // x=this.x;
        integer z= x+y;
        system.debug('Value with params >>>>>>'+z);
        
    }
   
}