# Ethereum Playground

1. Install `geth`.
2. Run `git clone https://github.com/cubedro/eth-netstats.git`
3. Run `git clone https://github.com/cubedro/eth-net-intelligence-api.git`
4. Run `git clone https://github.com/ethnamed/eth-explorer.git`

2. Create a new local account.
```sh
geth account new 
```

3. Add your account address to the `genesis.json` to init some ether.

4. Init the local private Ethereum network.
```sh
geth init genesis.json
```

5. Run the local Ethereum node.
```sh
geth \
    --networkid 15151 \
    --bootnodes "enode://9eed@<IP>:30303" \
    --mine \
    --minerthreads=1 \
    --rpc \
    --rpcport "8545" \
    --rpccorsdomain "http://localhost:8000" \
    --port "30303" \
    --nat "any"  \
    --identity "raayan"
```

6. In a new terminal, attach to the node to execute web3 commands.
```sh
geth attach
```

7. In a new terminal, attach the net status listener.
```sh
cd eth-net-intelligence-api && pm2 start app.json
```

8. In a new terminal, run the net status UI.
```sh
cd eth-netstats && WS_SECRET=secret npm start
```

9. In a new terminal, run the block explorer UI.
```sh
cd eth-explorer && npm start
```

# Web3 Commands

- Show the connected peer nodes.
```
admin.peers
```

- Unlock account for transactions.
```
web3.personal.unlockAccount(web3.personal.listAccounts[0], <PASSWORD>, 15000000)
```