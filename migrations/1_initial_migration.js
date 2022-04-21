const Migrations = artifacts.require("Migrations");
const Crossbnb = artifacts.require("Crossbnb");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(Crossbnb);
};
