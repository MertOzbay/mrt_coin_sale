const MrtCoin = artifacts.require("MrtCoin");
const MrtCoinSale = artifacts.require('MrtCoinSale');

module.exports = function (deployer) {
  deployer.deploy(MrtCoin, 1000000000).then(function(){
    var tokenPrice = 1000000000000000; // in wei
    return deployer.deploy(MrtCoinSale, MrtCoin.address, tokenPrice);
  });

};
