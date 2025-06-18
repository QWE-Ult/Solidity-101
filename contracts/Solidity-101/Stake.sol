// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    function transfer(address recipient, uint256 amount) external returns (bool);
}

contract Staking {
    IERC20 public token;
    uint256 public rewardRate = 10; // 10% annual reward
    uint256 public lastUpdateTime;
    uint256 public totalStaked;
    mapping(address => uint256) public stakedBalance;
    mapping(address => uint256) public rewardDebt;

    constructor(address _token) {
        token = IERC20(_token);
    }

    // Internal function to update rewards
    function updateRewards(address account) internal {
        if (totalStaked == 0) return;

        uint256 timeElapsed = block.timestamp - lastUpdateTime;
        if (timeElapsed > 0) {
            uint256 rewards = (stakedBalance[account] * rewardRate * timeElapsed) / (365 days * 100);
            rewardDebt[account] += rewards; // Add rewards to the user's reward debt
        }

        // Update the last reward update time
        lastUpdateTime = block.timestamp;
    }

    // Stake tokens into the contract
    function stake(uint256 amount) external {
        updateRewards(msg.sender);
        require(amount > 0, "Amount must be greater than 0");
        token.transferFrom(msg.sender, address(this), amount); // Transfer tokens from user to contract
        stakedBalance[msg.sender] += amount;
        totalStaked += amount;
    }

    // Unstake tokens and withdraw rewards
    function unstake(uint256 amount) external {
        updateRewards(msg.sender);
        require(stakedBalance[msg.sender] >= amount, "Insufficient staked balance");
        
        // Reduce the user's staked balance and the total staked amount
        stakedBalance[msg.sender] -= amount;
        totalStaked -= amount;

        // Transfer the unstaked tokens from the contract back to the user
        token.transfer(msg.sender, amount); // Transfer tokens from contract to user
    }

    // Claim rewards
    function claimRewards() external {
        updateRewards(msg.sender);
        uint256 rewards = rewardDebt[msg.sender];
        rewardDebt[msg.sender] = 0;

        // Transfer the claimed rewards to the user
        token.transfer(msg.sender, rewards); // Transfer rewards to the user
    }
}
