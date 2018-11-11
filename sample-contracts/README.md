# Multiply Contract

1. Deploy the `multiply` contract:
```
var multiplyContract = eth.contract(<ABI>)
var multiplyContractBytecode = '0x<BIN>'
var multiplyContractDeploy = {from:eth.coinbase, data:multiplyContractBytecode, gas: 2000000}
var multiplyContractInstance = multiplyContract.new(multiplyContractDeploy)
```

2. Execute the `multiply` contract:
```
var mContract = multiplyContract.at(multiplyContractInstance.address)
mContract.multiply(2)
```

# Greeter Contract

1. Deploy the `greeter` contract:
```
var greeterContract = eth.contract(<ABI>)
var greeterContractBytecode = '0x<BIN>'
var greeterContractDeploy = {from:eth.coinbase, data:greeterContractBytecode, gas: 4700000}
var greeterContractInstance = greeterContract.new("Hello World", greeterContractDeploy)
```

2. Execute the `greeter` contract:
```
var gContract = greeterContract.at(greeterContractInstance.address)
gContract.greet()
```

# Proof Contract

1. Deploy the `proof` contract:
```
var proofContract = eth.contract(<ABI>)
var proofContractBytecode = '0x<BIN>'
var proofContractDeploy = {from:eth.coinbase, data:proofContractBytecode, gas: 4700000}
var proofContractInstance = proofContract.new(proofContractDeploy)
```

2. Execute the `proof` contract:
```
var pContract = proofContract.at(proofContractInstance.address)
pContract.notarize("Hello World")
```
