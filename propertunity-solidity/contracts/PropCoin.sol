// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/utils/SafeERC20.sol";

contract PropCoin is ERC20, Ownable {
    using SafeERC20 for IERC20;

    address private backingWallet;

    constructor() ERC20("PropCoin", "PROP") {
    }

    function setBackingWallet(address wallet) external onlyOwner {
        backingWallet = wallet;
    }

    function mint(uint256 amount) external onlyOwner {
        IERC20 usdt = IERC20(address(0x55d398326f99059fF775485246999027B3197955)); // use USDT token address here
        require(usdt.balanceOf(backingWallet) >= amount, "Insufficient backing");

        usdt.safeTransferFrom(backingWallet, msg.sender, amount);
        _mint(msg.sender, amount);
    }

}