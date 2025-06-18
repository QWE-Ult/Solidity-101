// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

// Contract base1: Defines a state variable 'num' and a function 'foo'
contract base1 {
    uint num; // Declares an unsigned integer 'num'
    
    // 'foo' function is virtual, meaning it can be overridden in derived contracts
    function foo() virtual public returns (uint) {
        num = 8; // Sets the 'num' variable to 8
        return num; // Returns the value of 'num', which is 8
    }
}

// Contract base2: Another base contract with a 'foo' function
contract base2 {
    
    // 'foo' function is also virtual, can be overridden in derived contracts
    function foo() virtual public returns (uint) {
        return 0; // Returns 0 (this is a simple function that just returns 0)
    }
}

// Contract base3: Inherits from both base1 and base2, and overrides 'foo'
contract base3 is base1, base2 {
    
    // Overriding the 'foo' function inherited from both base1 and base2
    // The override keyword tells Solidity that we're intentionally overriding the function
    function foo() override(base1, base2) public returns (uint) {
        num = 2; // Sets 'num' to 2 (overrides the value set in base1)
        return num; // Returns the new value of 'num', which is 2
    }
}
