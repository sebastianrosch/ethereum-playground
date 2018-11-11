pragma solidity ^0.4.15;
pragma experimental ABIEncoderV2;

// Proof of Existence contract, version 3
contract Survey {

    string _question;
    uint16 _maxParticipants;
    uint16 _participantCount = 0;
    string[] _answers;

    event log_text(string log);
    event LogDeposit(address sender, uint amount);
    event LogTransfer(address to, uint amount);

    mapping (address => bool) public _participants;

    constructor(string question, uint16 maxParticipants) public {
        _question = question;
        _maxParticipants = maxParticipants;
        _answers = new string[](maxParticipants);
    }

    function () public payable {
        emit LogDeposit(msg.sender, msg.value);
    }

    // store a proof of existence in the contract state
    function storeParticipant(address participant) private {
        _participants[participant] = true;
    }
    
    // calculate and store the proof for a document
    function setAnswer(string answer) public returns(bool) {

        if(_participantCount >= _maxParticipants)
        {
            emit log_text("The maximum amount of participants has been reached.");
            revert("The maximum amount of participants has been reached.");
            return false;
        }
        if(hasParticipated(msg.sender))
        {
            emit log_text("The user has already participated.");
            revert("The user has already participated.");
            return false;
        }

        emit log_text("Answering question. The user answered:");
        emit log_text(answer);

        storeParticipant(msg.sender);
        _answers[_participantCount] = answer;
        _participantCount++;

        msg.sender.transfer(getParticipantReward());
        emit LogTransfer(msg.sender, getParticipantReward());

        return true;
    }

    function getQuestion() public view returns(string) {
        return _question;
    }

    function getTotalReward() public view returns(uint256) {
        return address(this).balance;
    }

    function getParticipantReward() public view returns(uint256) {
        return address(this).balance / (_maxParticipants - _participantCount);
    }

    function getMaxParticipants() public view returns(uint16) {
        return _maxParticipants;
    }

    function getCurrentParticipants() public view returns(uint16) {
        return _participantCount;
    }

    function canParticipate() public view returns(bool){
        return !hasParticipated(msg.sender) && (_participantCount < _maxParticipants);
    }
    
    // returns true if the current user participated
    function hasParticipated(address participant) private view returns(bool) {
        return _participants[participant];
    }

    function getAnswers() public view returns(string[])
    {
        return _answers;
    }              
}