// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/IERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/utils/ERC721Holder.sol";

contract Pool is ERC721Holder {
    address private _owner;
    mapping (address => mapping(address => uint256)) private _balances;
    uint256 private _pool;
    uint256 constant INTEREST_RATE = 5;
    address constant WALLET_ADDRESS = 0x6ca030F9D9dB9f933B4817779E3d4bB40Ccfec2C;

    constructor() {
        _owner = msg.sender;
    }

    function lend(address token, uint256 amount) external {
        require(token == address(0) || token == address(WALLET_ADDRESS), "Unsupported token"); 
        require(amount > 0, "Amount must be greater than 0");

        IERC20 erc20 = IERC20(token);
        require(erc20.balanceOf(msg.sender) >= amount, "Insufficient balance");
        require(erc20.allowance(msg.sender, address(this)) >= amount, "Insufficient allowance");

        erc20.transferFrom(msg.sender, address(this), amount);
        _pool += amount;
        _balances[msg.sender][token] += amount;
    }

    function withdraw(address token, uint256 amount) external {
        require(token == address(WALLET_ADDRESS), "Unsupported token");
        require(amount > 0, "Amount must be greater than 0");
        require(_balances[msg.sender][token] >= amount, "Insufficient balance");

        IERC20 erc20 = IERC20(token);
        erc20.transfer(msg.sender, amount);
        _pool -= amount;
        _balances[msg.sender][token] -= amount;
    }

    function getPoolBalance(address token) external view returns (uint256) {
        return IERC20(token).balanceOf(address(this));
    }

    function getBalance(address account, address token) external view returns (uint256) {
        return _balances[account][token];
    }

    function borrow(uint256 amount, address nftAddress, uint256 tokenId) external {
        require(amount > 0, "Borrow amount must be greater than 0");
        require(_balances[msg.sender][address(WALLET_ADDRESS)] >= amount, "Insufficient collateral");

        // Transfer NFT collateral from the borrower to the pool's wallet
        IERC721 nft = IERC721(nftAddress);
        nft.safeTransferFrom(msg.sender, address(this), tokenId);

        // Transfer funds from the pool to the borrower
        IERC20 erc20 = IERC20(address(WALLET_ADDRESS)); // use USDT token address here
        erc20.transfer(msg.sender, amount);

        // Update the borrower's debt balance
        _balances[msg.sender][address(WALLET_ADDRESS)] -= amount;
    }

    function repay(uint256 amount) external {
    require(amount > 0, "Amount must be greater than 0");
    require(_balances[msg.sender][address(WALLET_ADDRESS)] >= amount, "Insufficient balance");

    IERC20 erc20 = IERC20(address(WALLET_ADDRESS)); // use USDT token address here
    require(erc20.allowance(msg.sender, address(this)) >= amount, "Insufficient allowance");

    erc20.transferFrom(msg.sender, address(this), amount);

    // Calculate the interest owed by the borrower
    uint256 interest = amount * INTEREST_RATE / 100;

    // Split the interest payment between your wallet and the pool
    uint256 interestToCompanyWallet = interest * 20 / 100;
    uint256 interestToPool = interest - interestToCompanyWallet;

    // Transfer the interest payment to your wallet (the wallet below is our company wallet)
    erc20.transfer(WALLET_ADDRESS, interestToCompanyWallet);

    // Update the pool's balance
    _pool += interestToPool;

    // Update the borrower's debt balance
    _balances[msg.sender][address(WALLET_ADDRESS)] += amount + interest;
    }
}
