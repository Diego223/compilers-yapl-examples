class Factorial {
  	var: Int <- 0;
	var2: Bool <- true;
  	
  	factorial(n: Int) : Int {
		{ 
			let f : Int in
				if n=0 then 
					f<-0 
				else if n=1 then 
					f<-1 
				else
					f<-n*factorial(n-1)
				
		}
    };
  
  };


def visitMethodDeclaration(self, ctx: YAPLGrammarParser.MethodDeclarationContext):
        name = ctx.methodName().getText()
        symbol_type = ctx.type_().getText()

        if self.current_class:
            if ctx:
                method_name = ctx.methodName().getText()
                method_type = ctx.type_().getText()
                self.symbol_table[f"{self.current_class}.{method_name}"] = {
                    "type": method_type,
                    "class": self.current_class,
                    "inherits_from": self.inheritance_map.get(self.current_class),
                }
        else:
            self.symbol_table[name] = symbol_type


class Fibonacci {
  	
  	fibonacci(n: Int) : Int {
		{ 
			let f : Int in
				if n=1 then 
					f<-1 
				else if n=2 then 
					f<-1 
				else
					f<-fibonacci(n-1)+fibonacci(n-2)
			
		}
    };
  
  };

class Main inherits IO {
    n: Int <- 10;
  	facto: String;
  	fibo: Fibonacci;
  
  	main() : SELF_TYPE {
	{
	    facto <- new Factorial;
      	fibo <- new Fibonacci;
      	--out_int(facto.factorial(n));
      	out_int(fibo.fibonacci(n));
      	self;
	}
    };
};