pragma solidity ^0.4.24;

import "../token/ERC20/IERC20.sol";
import "../token/ERC20/SafeERC20.sol";


contract ERC20FailingMock is IERC20 {
  function totalSupply() public view returns (uint256) {
    return 0;
  }

  function transfer(address, uint256) public returns (bool) {
    return false;
  }

  function transferFrom(address, address, uint256) public returns (bool) {
    return false;
  }

  function approve(address, uint256) public returns (bool) {
    return false;
  }

  function balanceOf(address) public view returns (uint256) {
    return 0;
  }

  function allowance(address, address) public view returns (uint256) {
    return 0;
  }
}


contract ERC20SucceedingMock is IERC20 {
  function totalSupply() public view returns (uint256) {
    return 0;
  }

  function transfer(address, uint256) public returns (bool) {
    return true;
  }

  function transferFrom(address, address, uint256) public returns (bool) {
    return true;
  }

  function approve(address, uint256) public returns (bool) {
    return true;
  }

  function balanceOf(address) public view returns (uint256) {
    return 0;
  }

  function allowance(address, address) public view returns (uint256) {
    return 0;
  }
}


contract SafeERC20Helper {
  using SafeERC20 for IERC20;

  IERC20 failing;
  IERC20 succeeding;

  constructor() public {
    failing = new ERC20FailingMock();
    succeeding = new ERC20SucceedingMock();
  }

  function doFailingTransfer() public {
    failing.safeTransfer(address(0), 0);
  }

  function doFailingTransferFrom() public {
    failing.safeTransferFrom(address(0), address(0), 0);
  }

  function doFailingApprove() public {
    failing.safeApprove(address(0), 0);
  }

  function doSucceedingTransfer() public {
    succeeding.safeTransfer(address(0), 0);
  }

  function doSucceedingTransferFrom() public {
    succeeding.safeTransferFrom(address(0), address(0), 0);
  }

  function doSucceedingApprove() public {
    succeeding.safeApprove(address(0), 0);
  }
}
