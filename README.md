# Chainlink consuming data feeds

I was following this [doc](https://docs.chain.link/docs/consuming-data-feeds/), in which the smart contract returns the latest price for ETH/USD.

However, in this project, we will get additional two price feeds, GBP/USD and OIL/USD.

Instead using Remix, I intentionally use hardhat project to deploy and interact with the **PriceConsumerV3.sol** smart contract.

## To deploy:

```sh
npx hardhat run scripts/deploy.ts --network kovan
```

Onced deployed you'll get the address, for example `0xabc...`.

## To interact

```sh
npx hardhat console --network kovan
```

Then get the contract factory:

```sh
contractFactory = await ethers.getContractFactory('PriceConsumerV3')
```

Then use the contract factory to attach the contract using its address.

```sh
contract = await contractFactory.attach('0xabc...')
```

Onced attached, you can interact with the contract, for example:

```sh
await contract.getLatestPrice_ETH_USD()
```
