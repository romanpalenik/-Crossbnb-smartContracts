// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Crossbnb {

  struct Offer { 
    uint id;
    address owner;
    uint tokenId;
    uint price;
    string paymentToken;
    string state;
    uint256 occupiedOfferFrom;
    uint256 occupiedOfferTo;
    address occupiedOfferByUser;
    string adressToSendTokens;
  }

  mapping (uint => Offer) public offers;
  uint public offerCount = 0;
  


  function createOffer(uint tokenId, uint price, string calldata paymentToken, string calldata adressToSendTokens) public {
    require(tokenId > 0);
    require(price > 0);
    offers[offerCount] = Offer(offerCount, msg.sender, tokenId, price, paymentToken, "created", 0, 0, msg.sender, adressToSendTokens);
    offerCount++;
  }

  function getOffer(uint id) public view returns(Offer memory) {
    require(id < offerCount);
    return offers[id];
  }

  function getAllOffers() public view returns(Offer[] memory) {
    Offer[] memory offersIds = new Offer[](offerCount);
    for (uint i = 0; i < offerCount; i++) {
      Offer storage member = offers[i];
      offersIds[i] = member;
    }
    return offersIds;
  }

  function getAllActiveOffers() public view returns(Offer[] memory) {
    Offer[] memory offersIds = new Offer[](offerCount);
    for (uint i = 0; i < offerCount; i++) {
      Offer storage member = offers[i];
      offersIds[i] = member;
    }
    return offersIds;
  }

  function deleteStruct(uint id) public {
  Offer memory removeMe;

  for (uint i = 0; i < offerCount; i++) {
    if (i == id) {                               // if this is the struct we want to delete...
      removeMe = offers[i];                    // save it to a variable
      offers[i] = offers[offerCount - 1]; // overwrite it with the last struct
      offers[offerCount - 1] = removeMe;   // overwrite the last struct with the struct we want to delete
    }
  }

  delete offers[offerCount - 1]; // delete the last struct
  offerCount--; // remove the last struct (which should be the one we want to delete)
  }

  function changeOfferToPaid(uint id) public {
    require(id < offerCount);
    offers[id].state = "paid";
  }

  function changeOfferToOccupied(uint id, uint256 occupiedOfferFrom, uint256 occupiedOfferTo, address occupiedOfferByUser) public {
    require(id < offerCount);
    offers[id].state = "occupied";
    offers[id].occupiedOfferFrom = occupiedOfferFrom;
    offers[id].occupiedOfferTo = occupiedOfferTo;
    offers[id].occupiedOfferByUser = occupiedOfferByUser;
  }

}
