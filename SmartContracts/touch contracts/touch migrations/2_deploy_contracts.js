const OrpheusRegistry = artifacts.require("OrpheusRegistry");

module.exports = function (deployer) {
  deployer.deploy(OrpheusRegistry);
};
