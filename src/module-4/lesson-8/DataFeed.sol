// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import {AggregatorV3Interface} from "@chainlink/contracts/v0.8/interfaces/AggregatorV3Interface.sol";

/**
 * THIS IS AN EXAMPLE CONTRACT THAT USES HARDCODED
 * VALUES FOR CLARITY.
 * THIS IS AN EXAMPLE CONTRACT THAT USES UN-AUDITED CODE.
 * DO NOT USE THIS CODE IN PRODUCTION.
 */

/**
 * If you are reading data feeds on L2 networks, you must
 * check the latest answer from the L2 Sequencer Uptime
 * Feed to ensure that the data is accurate in the event
 * of an L2 sequencer outage. See the
 * https://docs.chain.link/data-feeds/l2-sequencer-feeds
 * page for details.
 */
contract DataConsumerV3 {
    AggregatorV3Interface internal dataFeed;
    AggregatorV3Interface public volatilityFeed;

    /**
     * Network: Sepolia
     * Aggregator: BTC/USD
     * Address: 0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43
     */
    constructor() {
        dataFeed = AggregatorV3Interface(0x8A6af2B75F23831ADc973ce6288e5329F63D86c6);

        // Link/USD 24hrs volatility
        volatilityFeed = AggregatorV3Interface(0xfD59B51F25E0Ab790a4F0c483BaC194FA0479D29);
    }

    /**
     * Returns the latest answer.
     */
    function getChainlinkDataFeedLatestAnswer() public view returns (uint80, int256, uint256, uint256, uint80) {
        // prettier-ignore
        (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound) =
            dataFeed.latestRoundData();

        return (roundId, answer, startedAt, updatedAt, answeredInRound);
    }

    function getLatestVolatility() external view returns (int256 volatilityValue, uint8 decimals) {
        (
            /* uint80 roundID */
            ,
            int256 answer,
            /* uint256 startedAt */
            ,
            /* uint256 updatedAt */
            ,
            /* uint80 answeredInRound */
        ) = volatilityFeed.latestRoundData();

        uint8 feedDecimals = volatilityFeed.decimals();

        return (answer, feedDecimals);
    }

    function getVolatility() public view returns (int256 volatility, int256 answer, uint8 feedDecimals) {
        (
            /* uint80 roundID */
            ,
            answer,
            /* uint256 startedAt */
            ,
            /* uint256 updatedAt */
            ,
            /* uint80 answeredInRound */
        ) = volatilityFeed.latestRoundData();

        feedDecimals = volatilityFeed.decimals();

        volatility = (answer * 100) / int256(10 ** uint256(feedDecimals));
    }
}
