const TokengatedCommunity = artifacts.require("TokengatedCommunity");
const FanToken = artifacts.require("FanToken");

module.exports = async function (deployer, _network, accounts) {
  const tokenInstance = await FanToken.deployed();
  await deployer.deploy(
    TokengatedCommunity,
    tokenInstance.address,
    "1000000000000000000"
  ); // Set initial entry token amount to 1 FTK
};
