pragma solidity ^0.4.15;

// Proof of Existence contract, version 2
contract ProofOfExistence2 {
    // state
    bytes32 public proof;
    // calculate and store the proof for a document
    // *transactional function*
    function notarize(string document) public {
        proof = proofFor(document);
    }
    // helper function to get a document's sha256
    // *read-only function*
    function proofFor(string document) public pure returns (bytes32) {
        return sha256(document);
    }
}