// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * @title MOLTPOT
 * @notice Experimental deterministic jackpot ERC20 token.
 * @dev Jackpot logic omitted for brevity; placeholder for user to extend.
 */
contract MOLTPOT is ERC20 {
    constructor() ERC20("MOLTPOT", "MOLT") {
        _mint(msg.sender, 1_000_000 ether);
    }
}
