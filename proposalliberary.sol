import "EternalStorage.sol";

library ProposalsLibrary {

  function getProposalCount(address _storageContract) constant returns(uint256) 
  {
    return EternalStorage(_storageContract).getUIntValue(sha3("ProposalCount"));
  } 
	
  function addProposal(address _storageContract, bytes32 _name)
  {
    var idx = getProposalCount(_storageContract);
    EternalStorage(_storageContract).setBytes32Value(sha3("proposal_name", idx), _name);
    EternalStorage(_storageContract).setUIntValue(sha3("proposal_eth", idx), 0);
    EternalStorage(_storageContract).setUIntValue(sha3("ProposalCount"), idx + 1);
  }
}
