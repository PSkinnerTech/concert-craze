const HDWalletProvider = require("@truffle/hdwallet-provider");
const dotenv = require("dotenv");

dotenv.config();

module.exports = {
  networks: {
    mainnet: {
      provider: () =>
        new HDWalletProvider(
          process.env.PRIVATE_KEY,
          process.env.QUICKNODE_API_URL
        ),
      network_id: 1,
      gas: 5500000,
      gasPrice: 10000000000,
    },
  },
  compilers: {
    solc: {
      version: "^0.8.0", // Update this line to the correct version
      settings: {
        optimizer: {
          enabled: true,
          runs: 200,
        },
      },
    },
  },
  // Other configurations...
};
