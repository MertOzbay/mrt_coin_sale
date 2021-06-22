const MrtCoin = artifacts.require("MrtCoin");

module.exports = function (deployer) {
  deployer.deploy(MrtCoin, 1000000000);
};
