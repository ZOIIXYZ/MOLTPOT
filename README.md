# MOLTPOT

MOLTPOT is a deterministic onchain jackpot-token experiment. It borrows the conceptual framing of periodic “state molting,” where old allocation states are shed and a new jackpot winner is selected at fixed intervals, without off-chain randomness or external oracles.

This repository provides a minimal ERC20 implementation plus scaffolding for extending jackpot logic. The intent is to serve as an educational and experimental base for onchain token mechanics where jackpot-style redistribution is transparent, deterministic, and autonomous.

## 🚀 Vision

Traditional ERC20s distribute supply linearly or all at launch. MOLTPOT proposes a different axis: supply *moves* over time toward discrete jackpot events. Holders do not farm yields or claim emissions; instead, they position themselves probabilistically to capture upcoming “molts.”

A “molt” is a redistribution cycle:
1. Tokens accumulate into a jackpot pool.
2. A deterministic pseudo-random selection chooses an eligible holder.
3. The jackpot is granted.
4. The system resets accumulation and repeats.

All selection logic can be derived from block-level entropy primitives. No Chainlink VRF, no randomness beacons. Maximum transparency; zero trust beyond Ethereum consensus.

## 🔧 Architecture Overview

This repo’s Solidity file is intentionally minimal. The intended jackpot architecture looks like:

- **Core Token (MOLTPOT.sol)**  
  ERC20-compliant token with supply + accounting.

- **Accumulator Module (Planned)**  
  Collects fees or routed supply into a jackpot pool.

- **Selector Module (Planned)**  
  Uses entropy from `block.prevrandao`, block height, or other deterministic signals.

- **Payout Module (Planned)**  
  Distributes the jackpot to winner, resets pool.

These modules can be merged or separated based on gas budget and code clarity.

## 🧱 Deterministic Entropy Sources

MOLTPOT encourages exploration of onchain entropy such as:

- `block.number`
- `block.prevrandao` (post-merge randomness)
- `tx.origin` / `msg.sender` snapshots
- cumulative balances
- Merkle index positions
- modulo arithmetic over balances

Entropy must always be paired with *eligibility rules*. Example: holders above a minimum balance threshold, or holders who held for N blocks, etc.

## ⚙️ Roadmap (Suggested)

- [ ] Implement accumulator fee routing
- [ ] Implement onchain deterministic selector
- [ ] Implement jackpot payout & cycle reset
- [ ] Gas profiling & compression
- [ ] Expand test suite (Foundry or Hardhat)
- [ ] Deploy to testnets (Sepolia/Holesky)
- [ ] Deploy to mainnet

## 🧪 Development & Deployment

Install dependencies:

```bash
npm install
```

Compile contracts:

```bash
npx hardhat compile
```

Deploy locally:

```bash
npx hardhat run scripts/deploy.js --network hardhat
```

## 📦 Repo Contents

```
contracts/
  MOLTPOT.sol      # minimal ERC20 implementation

scripts/
  deploy.js        # basic Hardhat deployment script

package.json       # dependency definitions
README.md          # this document
```

## 📝 License

MIT – free to fork, experiment, and ship.

## 🔮 Final Notes

MOLTPOT is not a finished product; it is a launchpad for jackpot mechanics onchain. If you add accumulator or deterministic selector logic, credit is appreciated but not required. The real fun is in experimenting with how value can slosh around deterministically within an ERC20 ecosystem without trusting anything except Ethereum itself.
