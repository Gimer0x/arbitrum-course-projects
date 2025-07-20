# 🚀 Solidity Smart Contract Development Course

A comprehensive learning project for Solidity smart contract development using **Foundry**, organized in progressive modules covering fundamental to advanced concepts.

## 📚 Project Overview

This repository contains a structured learning path for Ethereum smart contract development, featuring:

- **4 Progressive Modules** with hands-on lessons
- **Foundry Framework** for development, testing, and deployment
- **OpenZeppelin Contracts** for secure, audited implementations
- **Comprehensive Testing** with Forge testing framework
- **Upgradeable Contracts** with proxy patterns
- **Chainlink Integration** for oracle and automation features

## 🏗️ Project Structure

```
├── src/
│   ├── module-1/          # Fundamentals
│   │   └── lesson-6/      # First Contract
│   ├── module-2/          # Core Concepts
│   │   ├── lesson-2/      # Simple Storage
│   │   ├── lesson-3/      # Data Types & Control Flow
│   │   ├── lesson-4/      # Functions & Scope
│   │   ├── lesson-5/      # Errors & Events
│   │   ├── lesson-6/      # Ether Transfer
│   │   └── lesson-8/      # Security (Attacker/Victim)
│   ├── module-3/          # Advanced Features
│   │   ├── lesson-3/      # ERC20 Token Implementation
│   │   ├── lesson-4/      # Mathematical Operations
│   │   └── lesson-7/      # Gas Optimization
│   └── module-4/          # Production Features
│       ├── lesson-4/      # Contract Interaction
│       ├── lesson-5/      # Upgradeable Contracts
│       └── lesson-8/      # Chainlink Data Feeds
├── test/                  # Comprehensive test suites
├── script/               # Deployment scripts
└── lib/                  # Dependencies (OpenZeppelin, Chainlink, etc.)
```

## 🎯 Learning Path

### Module 1: Fundamentals
- **Lesson 6**: Your first smart contract - basic storage and retrieval

### Module 2: Core Concepts
- **Lesson 2**: Simple storage with events and access control
- **Lesson 3**: Data types, control flow, and global variables
- **Lesson 4**: Function definitions, parameters, and scope
- **Lesson 5**: Custom errors and event emissions
- **Lesson 6**: Ether transfer mechanisms
- **Lesson 8**: Security vulnerabilities and attack vectors

### Module 3: Advanced Features
- **Lesson 3**: ERC20 token implementation with OpenZeppelin
- **Lesson 4**: Mathematical operations and precision handling
- **Lesson 7**: Gas optimization techniques

### Module 4: Advance Features
- **Lesson 4**: Contract-to-contract interaction patterns
- **Lesson 5**: Upgradeable contracts with proxy patterns
- **Lesson 8**: Chainlink oracle integration for external data

### Module 5: Chainlink Proof-of-Reserve
- **Lesson 6**: Proof-Of-Reserve

### Module 6: Final Project
- Final Projec on this [link](https://github.com/Gimer0x/arbritrum-final-project)

## 🛠️ Technology Stack

- **Solidity**: ^0.8.30
- **Foundry**: Latest version
- **OpenZeppelin Contracts**: Latest version
- **Chainlink**: Oracle and automation tools
- **Forge Standard Library**: Testing utilities

## 🚀 Getting Started

### Prerequisites

- [Foundry](https://book.getfoundry.sh/getting-started/installation)
- [Node.js](https://nodejs.org/) (for OpenZeppelin upgrades)
- [Git](https://git-scm.com/)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd arbitrum-grant-projects
   ```

2. **Install dependencies**
   ```bash
   forge install
   npm install
   ```

3. **Build the project**
   ```bash
   forge build
   ```

## 📖 Usage

### Development Commands

```bash
# Build contracts
forge build

# Run tests
forge test

# Run tests with verbose output
forge test -vvv

# Run specific test file
forge test --match-contract TokenTest

# Format code
forge fmt

# Generate gas snapshots
forge snapshot

# Start local blockchain
anvil
```

### Testing

```bash
# Run all tests
forge test

# Run tests with gas reporting
forge test --gas-report

# Run fuzz tests
forge test --match-test testFuzz

# Run invariant tests
forge test --match-test invariant
```

### Deployment

```bash
# Deploy to local network
forge script script/module-4/lesson-1/MyScript.s.sol:MyScript --rpc-url http://localhost:8545 --broadcast

# Deploy to testnet (example)
forge script script/module-4/lesson-1/MyScript.s.sol:MyScript --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify
```

### Environment Setup

Create a `.env` file with your configuration:

```env
PRIVATE_KEY=your_private_key_here
SEPOLIA_RPC_URL=your_sepolia_rpc_url
ETHERSCAN_API_KEY=your_etherscan_api_key
```

## 🔧 Configuration

### Foundry Configuration (`foundry.toml`)

```toml
[profile.default]
src = "src"
out = "out"
libs = ["node_modules", "lib"]
build_info = true
extra_output = ["storageLayout"]
ffi = true
ast = true
```

### Remappings (`remappings.txt`)

The project includes optimized remappings for:
- OpenZeppelin contracts
- Chainlink contracts
- Forge standard library
- Custom project paths

## 🧪 Testing Strategy

The project includes comprehensive testing covering:

- **Unit Tests**: Individual function testing
- **Integration Tests**: Contract interaction testing
- **Fuzz Tests**: Property-based testing
- **Invariant Tests**: State consistency testing
- **Gas Tests**: Performance optimization

### Example Test Structure

```solidity
contract TokenTest is Test {
    function setUp() public {
        // Test setup
    }
    
    function test_InitialState() public view {
        // State verification
    }
    
    function testFuzz_Mint(uint256 amount) public {
        // Fuzz testing
    }
}
```

## 🔒 Security Features

- **Access Control**: OpenZeppelin's `Ownable` and custom modifiers
- **Reentrancy Protection**: Secure external calls
- **Input Validation**: Comprehensive parameter checking
- **Error Handling**: Custom errors for gas efficiency
- **Upgrade Safety**: Proxy pattern implementation

## 📈 Gas Optimization

The project demonstrates various gas optimization techniques:

- **Custom Errors**: Instead of require statements
- **Efficient Storage**: Packed structs and storage optimization
- **Function Visibility**: Appropriate access modifiers
- **Loop Optimization**: Efficient iteration patterns

## 🔗 External Integrations

### Chainlink Integration

- **Price Feeds**: Real-time price data
- **VRF**: Verifiable random functions
- **Automation**: Keeper network integration
- **Functions**: Decentralized computation

### OpenZeppelin Contracts

- **ERC20**: Standard token implementation
- **Access Control**: Role-based permissions
- **Upgrades**: Proxy pattern support
- **Security**: Audited contract libraries

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

- **Foundry Documentation**: https://book.getfoundry.sh/
- **OpenZeppelin Docs**: https://docs.openzeppelin.com/
- **Chainlink Docs**: https://docs.chain.link/
- **Solidity Docs**: https://docs.soliditylang.org/

## 🎓 Learning Resources

- [Foundry Book](https://book.getfoundry.sh/)
- [Solidity by Example](https://solidity-by-example.org/)
- [OpenZeppelin Learn](https://docs.openzeppelin.com/learn/)
- [Chainlink Documentation](https://docs.chain.link/)

---

**Happy Coding! 🚀**
