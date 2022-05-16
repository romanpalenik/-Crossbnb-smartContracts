const Migrations = artifacts.require("Migrations");
const Minter = artifacts.require("TokenMinter");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(Minter);
};
