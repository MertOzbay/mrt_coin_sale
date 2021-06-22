pragma solidity >= 0.4.2;

import "./MrtCoin.sol";

contract MrtCoinSale{

  address payable admin;
  MrtCoin public tokenContract;
  uint256 public tokenPrice;
  uint256 public tokensSold;

  event Sell(
    address _buyer,
    uint256 _amount
  );

  constructor (MrtCoin _tokenContract, uint256 _tokenPrice) public {
    //Assign admin
    admin = msg.sender;
    //Token contract
    tokenContract = _tokenContract;
    //Token price
    tokenPrice = _tokenPrice;
  }

  function mul(uint x, uint y) internal pure returns (uint z) { //helper function!
        require(y == 0 || (z = x * y) / y == x, "ds-math-mul-overflow");
    }

  function buyTokens(uint256 _numOfTokens) public payable {
    require(msg.value == mul(_numOfTokens, tokenPrice));

    require(tokenContract.balanceOf(address(this)) >= _numOfTokens);

    require(tokenContract.transfer(msg.sender, _numOfTokens));
    tokensSold += _numOfTokens;

    emit Sell(msg.sender, _numOfTokens);
  }

  function endSale() public {
    require(msg.sender == admin);

    require(tokenContract.transfer(admin, tokenContract.balanceOf(address(this))));

    selfdestruct(admin);
  }
}
