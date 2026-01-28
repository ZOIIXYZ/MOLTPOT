const { ethers } = require("hardhat");

async function main() {
  const MOLTPOT = await ethers.getContractFactory("MOLTPOT");
  const moltpot = await MOLTPOT.deploy();
  await moltpot.waitForDeployment();
  console.log("MOLTPOT deployed to:", await moltpot.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
