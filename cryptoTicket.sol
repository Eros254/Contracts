
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract EventTicket is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private _ticketIds;

    struct Event {
        uint256 id;
        string name;
        uint256 ticketPrice;
        uint256 totalTickets;
        uint256 ticketsSold;
    }

    mapping(uint256 => Event) public events;
    uint256 public eventCount;

    constructor() ERC721("EventTicket", "TICKET") {}

    function createEvent(string memory name, uint256 ticketPrice, uint256 totalTickets) public {
        eventCount++;
        events[eventCount] = Event({
            id: eventCount,
            name: name,
            ticketPrice: ticketPrice,
            totalTickets: totalTickets,
            ticketsSold: 0
        });
    }

    function buyTicket(uint256 eventId) public payable {
        Event storage eventData = events[eventId];
        require(msg.value == eventData.ticketPrice, "Incorrect payment amount");
        require(eventData.ticketsSold < eventData.totalTickets, "Event sold out");

        _ticketIds.increment();
        uint256 ticketId = _ticketIds.current();
        _mint(msg.sender, ticketId);

        eventData.ticketsSold++;
    }
}