

async function main() {
  

  const StudentResultManagement = await hre.ethers.getContractFactory("StudentResultManagement");
  const studentresultmanagment = await StudentResultManagement.deploy();

  await studentresultmanagment.deployed();

  console.log(
    `contract is deployed address${studentresultmanagment.address} `
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
