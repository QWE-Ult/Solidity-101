// SPDX-License-Identifier: MIT
// pragma solidity>0.8.0;      // A struct (short for "structure") 
                          //in programming is a user-defined data type that allows you to group different types of variables (called members or fields)
                           //together into a single unit( way to group different pieces of information together under one name.)
// contract Struct{
    //     struct Book{
//         string title;
//         string author;
//         uint id;
//     }
//     Book book;                               //  THIS IS FOR ONE BOOK WE CAN USE ARRAY TO STORE MULTIPLE EASILY
//     function set() public {
//         book=Book("learn java","t.p",1);
//     }
//     function get()public view returns(string memory){
//         return book.title;
//     }
// }
// pragma solidity >=0.8.9;
// contract Struct2{
//     struct Book{
//         string title;
//         uint id;
//     }
//     Book [] public allbooks;
//     function get(string memory _title, uint _id)public {
//         Book memory newbook=Book({
//             title:_title,
//             id:_id
//         });
//         allbooks.push(newbook);
//     }
// }
pragma solidity >=0.8.0;
contract struct3{
    struct student {
        uint roll;
        string name;
    }
    student [] public s1;
    function get(uint _roll,string memory _name) public {
        s1.push(student(_roll,_name));
    }
    function set(uint index) public view returns(student memory){
        return s1[index];

    }

}


