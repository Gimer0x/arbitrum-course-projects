// SPDX-License-Identifier:MIT
pragma solidity 0.8.30;

contract DataTypes {
    uint256 public value1;
    uint256 private value2;
    uint256 privateValue;

    uint8 public maxValue = 255;
    uint8 public minValue = 0;
    int8 public maxIntValue = 127;
    int8 public minIntValue = -128;
    int8 public constant MONTHS = 12;
    uint16 public val5 = type(uint16).max;
    int16 public val6 = type(int8).min;

    uint256 public constant MAX_ACCOUNTS = 64;
    address public immutable ADMIN_ACCOUNT;
    uint256 public constant DAY = 24 hours;
    uint256 public constant SEVEN_DAYS = 7 days;
    uint256 public constant ONE_ETHER = 1 ether;
    uint256 public amount = 1_5000_000 ether;

    bool public flag;
    bool public newFlag = true;

    address public newAddress;
    address public myAccount = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    address payable public tempAddress;
    address public zeroAccount = address(0);
    address public myContract = address(this);

    string name = "New Token";
    bytes text = "Bytes Test";
    bytes32 chainBytes32 = 0x0;

    // These are invalid declarations
    uint256 public transfer; // Evita el uso de palabras reservadas.
    uint256 public zxy30; // El nombre de esta variable no tiene significado.
    // uint public 30zxy; // Esto no compila.
    uint256 public _40Value;

    constructor(address _admin) {
        ADMIN_ACCOUNT = _admin;
        tempAddress = payable(myAccount);
    }

    function getPrivateValue() external view returns (uint256) {
        return privateValue;
    }

    function setPrivateValue(uint256 _value) external {
        privateValue = _value;
    }
}
