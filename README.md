# Ethereum Playground

1. Install `geth`.
2. Run `git clone https://github.com/cubedro/eth-netstats.git`
3. Run `git clone https://github.com/cubedro/eth-net-intelligence-api.git`
4. Run `git clone https://github.com/ethnamed/eth-explorer.git`

5. Create a new local account.
```sh
geth account new 
```

6. Add your account address to the `genesis.json` to init some ether.

7. Init the local private Ethereum network.
```sh
geth init genesis.json
```

8. Run the local Ethereum node.
```sh
geth \
    --networkid 15151 \
    --bootnodes "enode://<ENODE>@<IP>:30303" \
    --mine \
    --minerthreads=1 \
    --rpc \
    --rpcport "8545" \
    --rpccorsdomain "http://localhost:8000" \
    --port "30303" \
    --nat "any"  \
    --identity "<NODE_NAME>"
```

9. In a new terminal, attach to the node to execute web3 commands.
```sh
geth attach
```

10. Adjust the `app.json` in `eth-net-intelligence-api`.
For `INSTANCE_NAME`, pick the same as `identity` above. For `WS_SECRET`, use `ethereum`.

11. In a new terminal, attach the net status listener.
```sh
cd eth-net-intelligence-api && pm2 start app.json
```

12. Adjust the `app/config.json` in `eth-explorer`. For `rpcUrl`, use `http://localhost:8545`.

13. In a new terminal, run the net status UI.
```sh
cd eth-netstats && WS_SECRET=ethereum npm start
```

14. In a new terminal, run the block explorer UI.
```sh
cd eth-explorer && npm start
```

# Web3 Commands

- Show the connected peer nodes.
```sh
admin.peers
```

- Unlock account for transactions.
```sh
personal.unlockAccount(personal.listAccounts[0], "<PASSWORD>", 15000000)
```

- Get current coinbase address. Mined coins are sent to this address.
```sh
eth.coinbase
```

- Check account balance.
```sh
eth.getBalance(eth.coinbase)
```

- Send a transaction.
```sh
eth.sendTransaction({from:'<FROM_ADRESS', to:'<TO_ADRESS', value: toWei(0.05, "ether"), gas:21000});
```

- Leave the Web3 console.
```sh
exit
```

# Resources

## Private Network
https://github.com/ethereum/go-ethereum/wiki/Private-network
https://medium.com/@jake.henningsgaard/blockchain-private-network-with-ethereum-78b978c65728
https://medium.com/cybermiles/running-a-quick-ethereum-private-network-for-experimentation-and-testing-6b1c23605bce

## Monitoring
https://github.com/ethereum/wiki/wiki/Network-Status
https://medium.com/@jake.henningsgaard/monitoring-the-ethereum-blockchain-24384064fad3

## VS Code
https://github.com/juanfranblanco/vscode-solidity

## Smart Contracts
https://remix.ethereum.org/
https://blog.zeppelin.solutions/the-hitchhikers-guide-to-smart-contracts-in-ethereum-848f08001f05
https://medium.com/mercuryprotocol/dev-highlights-of-this-week-cb33e58c745f
