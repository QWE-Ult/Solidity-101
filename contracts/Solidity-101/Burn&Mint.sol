// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract SimpleToken is ERC20{
    constructor()ERC20("YIZz", "YIZz"){
         _mint(msg.sender, 1000000 * 10 ** decimals());
 }
 function mint(address account, uint amount) public {
    _mint(account,amount);
 }
 function burn(uint amount) public {
    _burn(msg.sender,amount);
 }
}