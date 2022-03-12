//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.7;

import 'hardhat/console.sol';

import '@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol';

contract PriceConsumerV3 {
  AggregatorV3Interface internal priceFeedEthUsd;
  AggregatorV3Interface internal priceFeedGbpUsd;
  AggregatorV3Interface internal priceFeedOilUsd;

  /**
   * Network: Kovan
   * Aggregator: ETH/USD
   * Address: 0x9326BFA02ADD2366b30bacB125260Af641031331
   */
  constructor() {
    priceFeedEthUsd = AggregatorV3Interface(
      0x9326BFA02ADD2366b30bacB125260Af641031331
    );
    priceFeedGbpUsd = AggregatorV3Interface(
      0x28b0061f44E6A9780224AA61BEc8C3Fcb0d37de9
    );
    priceFeedOilUsd = AggregatorV3Interface(
      0x48c9FF5bFD7D12e3C511022A6E54fB1c5b8DC3Ea
    );
  }

  /**
   * Returns the latest price for ETH/USD
   */
  function getLatestPrice_ETH_USD() public view returns (int256) {
    (
      ,
      /*uint80 roundID*/
      int256 price, /*uint startedAt*/ /*uint timeStamp*/ /*uint80 answeredInRound*/
      ,
      ,

    ) = priceFeedEthUsd.latestRoundData();
    return price;
  }

  /**
   * Returns the latest price for GBP/USD
   */
  function getLatestPrice_GBP_USD() public view returns (int256) {
    (
      ,
      /*uint80 roundID*/
      int256 price, /*uint startedAt*/ /*uint timeStamp*/ /*uint80 answeredInRound*/
      ,
      ,

    ) = priceFeedGbpUsd.latestRoundData();
    return price;
  }

  /**
   * Returns the latest price for GBP/USD
   */
  function getLatestPrice_OIL_USD() public view returns (int256) {
    (
      ,
      /*uint80 roundID*/
      int256 price, /*uint startedAt*/ /*uint timeStamp*/ /*uint80 answeredInRound*/
      ,
      ,

    ) = priceFeedOilUsd.latestRoundData();
    return price;
  }
}
