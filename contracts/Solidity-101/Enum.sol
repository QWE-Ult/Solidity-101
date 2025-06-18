//An enum is a way to give names to a set of choices. It helps you pick from a limited list of options instead of using numbers.
//An enum lets you create a list of possible options with names, and then you can choose from those options.
// SPDX-License-Identifier: MIT
pragma solidity>= 0.8.0;
contract Enum{
    enum size{
        SMALL,MEDIUM,LARGE
    }
    size public choice= size.MEDIUM;
    function setSmall() public {
        choice=size.SMALL;
    }
        function setLarge() public {
        choice=size.LARGE;
    }
    function setMedium() public {
        choice=size.MEDIUM;
    }

    
}

