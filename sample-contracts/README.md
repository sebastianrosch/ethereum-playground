# Multiply Contract

1. Deploy the `multiply` contract:
```
var multiplyContract = eth.contract([{"constant":true,"inputs":[{"name":"a","type":"uint256"}],"name":"multiply","outputs":[{"name":"d","type":"uint256"}],"payable":false,"stateMutability":"pure","type":"function"}])
var multiplyContractBytecode = '0x6080604052348015600f57600080fd5b50609c8061001e6000396000f300608060405260043610603e5763ffffffff7c0100000000000000000000000000000000000000000000000000000000600035041663c6888fa181146043575b600080fd5b348015604e57600080fd5b506058600435606a565b60408051918252519081900360200190f35b600702905600a165627a7a723058209de0d3162b8d8c1486894d1ebcab926cdcfa8edb0ad91db3decc7360a0b805b50029'
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
gContract.multiply(2)
```

# Proof Contract

1. Deploy the `proof` contract:
```
var proofContract = eth.contract([{"constant":true,"inputs":[{"name":"document","type":"string"}],"name":"checkDocument","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"document","type":"string"}],"name":"notarize","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"}])
var proofContractBytecode = '0x608060405234801561001057600080fd5b5061023e806100206000396000f30060806040526004361061004b5763ffffffff7c010000000000000000000000000000000000000000000000000000000060003504166353fb923381146100505780637183616c146100bd575b600080fd5b34801561005c57600080fd5b506040805160206004803580820135601f81018490048402850184019095528484526100a99436949293602493928401919081908401838280828437509497506101189650505050505050565b604080519115158252519081900360200190f35b3480156100c957600080fd5b506040805160206004803580820135601f81018490048402850184019095528484526101169436949293602493928401919081908401838280828437509497506101369650505050505050565b005b60008061012483610150565b905061012f816101e2565b9392505050565b600061014182610150565b905061014c816101f7565b5050565b60006002826040518082805190602001908083835b602083106101845780518252601f199092019160209182019101610165565b51815160209384036101000a600019018019909216911617905260405191909301945091925050808303816000865af11580156101c5573d6000803e3d6000fd5b5050506040513d60208110156101da57600080fd5b505192915050565b60009081526020819052604090205460ff1690565b6000908152602081905260409020805460ff191660011790555600a165627a7a723058206020cfaa6287b649849335492eb02502e30970f1759b9e786c01ba065d56c6a00029'
var proofContractDeploy = {from:eth.coinbase, data:proofContractBytecode, gas: 4700000}
var proofContractInstance = proofContract.new(proofContractDeploy)
```

2. Execute the `proof` contract:
```
var pContract = proofContract.at(proofContractInstance.address)
pContract.notarize("Hello World")
```
