pragma solidity ^0.4.23;

// 再利用できるなら...
// https://github.com/ethereum/solidity/issues/869

// http://solidity.readthedocs.io/en/v0.4.21/contracts.html#libraries
library AddressCollection {
    struct Value {
        bool exists;
        // NOTE: uint256が上限に制限されるので現実的ではない
        uint listPointer;
    }

    struct Index {
        mapping (address => Value) data;
        address[] addressList;
    }

    function exists(Index storage self, address _address) internal view returns (bool) {
        return self.data[_address].exists;
    }

    function get(Index storage self, address _address) internal view returns (bool, uint256) {
        Value storage value = self.data[_address];
        return (value.exists, value.listPointer);
    }

    function set(Index storage self, address _address, uint _index) internal returns (bool) {
        require(! exists(self, _address));

        self.data[_address] = Value({exists: true, listPointer: _index});
        self.addressList.push(_address);

        return true;
    }

    function keys(Index storage self) internal view returns (address[]) {
        return self.addressList;
    }
}
