// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");
const tokenJSON = require("../artifacts/contracts/MetaToken.sol/MetaToken.json");

const tokenAddress = "0xFFDC77894c932aaf8ca4C3eF87230AcA0dFA61B5" ; // Extract token address from .env
const tokenABI = tokenJSON.abi;
const walletAddress = "0x12D44d037Feaa703eC8031FE16572c4088ED3E5E";

const fxRootContractABI = require("../fxRootContractABI.json");
const fxERC21RootAddress = "0xF9bc4a80464E48369303196645e876c8C7D972de";
 // place your public address for your wallet here

async function main() {
    const token = await hre.ethers.getContractAt(tokenABI, tokenAddress);
;
  
    const fxContract = await hre.ethers.getContractAt(fxRootContractABI, fxERC21RootAddress);
    

    const approveTx = await token.setApprovalForAll(fxERC21RootAddress, true);
    await approveTx.wait();

    console.log("Approval confirmed");
    for (let i = 1; i < 6; i++) {
    //const rootTokenAddress = await fxContract.rootToChildTokens(contractAddress);
    const depositTx = await fxContract.deposit(tokenAddress,walletAddress, i,'0x6566');
    await depositTx.wait();

    }
    console.log("Tokens deposited");
    
  }
  
  // We recommend this pattern to be able to use async/await everywhere
  // and properly handle errors.
  main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });
