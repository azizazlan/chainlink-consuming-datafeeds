# Chainlink consuming data feeds

The **PriceConverter** contract in this repo is a direct copy from this [page](https://docs.chain.link/docs/get-the-latest-price/).
Instead of using Remix, I intentionally use hardhat project to deploy and interact with the contract.

If it is just a copy, why bother a repo? To me, actually doing it (even though just copying) is better than just reading from the doc. By doing so, force me to understand the code line by line. Plus I have the chance to use _hardhat_ tools.

The price feeds proxy addresses are available [here](https://docs.chain.link/docs/ethereum-addresses/).

## To deploy:

```sh
npx hardhat run scripts/deploy.ts --network kovan
```

Onced deployed you'll get the address, for example `0xabc...`.

## To interact

Start a hardhat console using Kovan network:

```sh
npx hardhat console --network kovan
```

Then get the contract factory:

```sh
>contractFactory = await ethers.getContractFactory('PriceConverter')
```

Then use the contract factory to attach the contract using its address.

```sh
>contract = await contractFactory.attach('0xabc...')
```

Onced attached, you can interact with the contract, for example to get _ETH/EUR_ where ETH is the base and EUR is the quote:

```sh
>await c.getDerivedPrice('0x9326BFA02ADD2366b30bacB125260Af641031331', '0x0c15Ab9A0DB086e062194c273CC79f41597Bbf13', 8)

BigNumber { value: "237188613729" }
```

This means about 2372 (= 237188613729 / 100000000) Euro is equivalent to one Ether. Note divide by 100000000 because of 8 decimals.
