pragma solidity ^0.4.19;


contract NotarizeDocument {

    mapping(bytes32 => bool) private docProofs;
 
    // First Notarize Document
    function notarize(string document) public {
        bytes32 proof = proofForDoc(document);
        storeDocProof(proof);
    }

    function proofForDoc(string document) private pure returns (bytes32) {
        return sha256(document);
    }

    function storeDocProof(bytes32 proof) private {
        docProofs[proof] = true;
    }

    // Now check for Document if it exists and notarized
    function checkDocument(string document) public constant returns (bool) {
        bytes32 proof = proofForDoc(document);
        return hasProof(proof);
    }

    function hasProof(bytes32 proof) private constant returns (bool) {
        return docProofs[proof];
    }
}