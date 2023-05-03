const FanToken = artifacts.require("FanToken");

module.exports = function (deployer) {
  deployer.deploy(FanToken, "1000000000000000000000000"); // Deploy with an initial supply of 1 million tokens
};
