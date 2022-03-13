//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.7;

import 'hardhat/console.sol';

import '@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol';

contract PriceConverter {
  /**
   * A/B where A is called the base, and B is called the quote.
   * For example EUR/USD is how many U.S dollars to equal one Euro.
   * U.S Dollar is the quote and Euro is the base.
   */
  function getDerivedPrice(
    address _base,
    address _quote,
    uint8 _decimals
  ) public view returns (int256) {
    /// Ensure user enter decimal between 0 and 18
    require(
      _decimals > uint8(0) && _decimals <= uint8(18),
      'Invalid _decimals'
    );

    int256 decimals = int256(10**uint256(_decimals)); // ten to the power of..
    (, int256 basePrice, , , ) = AggregatorV3Interface(_base).latestRoundData();
    uint8 baseDecimals = AggregatorV3Interface(_base).decimals();
    basePrice = scalePrice(basePrice, baseDecimals, _decimals);

    (, int256 quotePrice, , , ) = AggregatorV3Interface(_quote)
      .latestRoundData();
    uint8 quoteDecimals = AggregatorV3Interface(_quote).decimals();
    quotePrice = scalePrice(quotePrice, quoteDecimals, _decimals);

    return (basePrice * decimals) / quotePrice;
  }

  function scalePrice(
    int256 _price,
    uint8 _priceDecimals,
    uint8 _decimals
  ) internal pure returns (int256) {
    if (_priceDecimals < _decimals) {
      return _price * int256(10**uint256(_decimals - _priceDecimals));
    } else if (_priceDecimals > _decimals) {
      return _price / int256(10**uint256(_priceDecimals - _decimals));
    }
    return _price;
  }
}
