//a special constructor method that defines the initial state of the contracts data storage
// constructor name always same as contract
// constructor is run only once when the contract is created, and never again.

contract richoCoin {          
	
	string public name;
	string public symbol;
	uint8 public decimals;
	
	    
//a simple function that checks that the sender has a large enough balance
    
    mapping (address => uint) balances;         //will live forever on the Ethereum network, immutable, and backed by millions of nodes insuring it returns the expected results every time. 
                                                //Line 9: creates mapping in storage for key value pairs and balances of type address and unified integer             
    

    function richoCoin(uint256 initialSupply, string tokenName, uint8 decimalUnits, string tokenSymbol) {                      //Initiation of contract
        
            balances[msg.sender] = initialSupply;       //msg.sender is used to lookup the public address of transaction sender (160 bit number PK)
                                              		 //balances mapping used to access contract storage (32 bytes)
                                              		 //intialSupply is passed as a parameter
		
		    name = tokenName;
			symbol = tokenSymbol;
			decimals = decimalUnits;
				
    }
    
    
// SendCoin function will be executed everytime richoCoin contract is called
    
    function sendCoin(address receiver, uint amount) returns (bool sufficient) {     //receiver 160 bit public address of receipient 
                                                                                     //amount # of coins to be sent
            
            if (balances[msg.sender] < amount || balances[receiver] + amount < balances[receiver]) throw;             //Check current balance of msg.sender is less than amount to send if yes, then dont execute 
            
			balances[msg.sender] -= amount;                              //If msg.sender is greater than amount then subtract the # of coins from sender account
            balances[receiver] += amount;                                           // and add the # of coins to receiver account
            return true;
		
		//event sendCoin(address indexed sender, address indexed receiver, uint256 amount); 
		//sendCoin(msg.sender, receiver, amount)
	  
        
    }
    
}