
var votingABI = [{
    "anonymous": false,
    "inputs": [{
        "indexed": true,
        "name": "_from",
        "type": "address"
      },
      {
        "indexed": true,
        "name": "_to",
        "type": "address"
      }
    ],
    "name": "OwnershipTransferred",
    "type": "event"
  },
  {
    "constant": false,
    "inputs": [],
    "name": "acceptOwnership",
    "outputs": [],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "constant": false,
    "inputs": [{
      "name": "_name",
      "type": "string"
    }],
    "name": "addChoice",
    "outputs": [{
      "name": "success",
      "type": "bool"
    }],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "constant": false,
    "inputs": [{
      "name": "_newOwner",
      "type": "address"
    }],
    "name": "transferOwnership",
    "outputs": [],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "constant": false,
    "inputs": [{
      "name": "index",
      "type": "uint256"
    }],
    "name": "voteForChoice",
    "outputs": [{
      "name": "success",
      "type": "bool"
    }],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [{
        "name": "_name",
        "type": "string"
      },
      {
        "name": "_durationHours",
        "type": "uint256"
      },
      {
        "name": "tokenContract",
        "type": "address"
      }
    ],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "constructor"
  },
  {
    "constant": true,
    "inputs": [],
    "name": "choicesCount",
    "outputs": [{
      "name": "",
      "type": "uint256"
    }],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  },
  {
    "constant": true,
    "inputs": [],
    "name": "name",
    "outputs": [{
      "name": "",
      "type": "string"
    }],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  },
  {
    "constant": true,
    "inputs": [],
    "name": "newOwner",
    "outputs": [{
      "name": "",
      "type": "address"
    }],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  },
  {
    "constant": true,
    "inputs": [],
    "name": "owner",
    "outputs": [{
      "name": "",
      "type": "address"
    }],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  },
  {
    "constant": true,
    "inputs": [],
    "name": "timeEnding",
    "outputs": [{
      "name": "",
      "type": "uint256"
    }],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  },
  {
    "constant": true,
    "inputs": [{
      "name": "index",
      "type": "uint256"
    }],
    "name": "totalVotesFor",
    "outputs": [{
      "name": "votes",
      "type": "uint256"
    }],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  },
  {
    "constant": true,
    "inputs": [{
      "name": "",
      "type": "address"
    }],
    "name": "voted",
    "outputs": [{
      "name": "",
      "type": "bool"
    }],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  },
  {
    "constant": true,
    "inputs": [{
      "name": "",
      "type": "uint256"
    }],
    "name": "votingChoices",
    "outputs": [{
        "name": "id",
        "type": "uint256"
      },
      {
        "name": "name",
        "type": "string"
      },
      {
        "name": "voteCount",
        "type": "uint256"
      }
    ],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  }
];
var votingTokenABI = [{
    "anonymous": false,
    "inputs": [],
    "name": "Clear",
    "type": "event"
  },
  {
    "constant": false,
    "inputs": [],
    "name": "acceptOwnership",
    "outputs": [],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "constant": false,
    "inputs": [],
    "name": "clear",
    "outputs": [{
      "name": "success",
      "type": "bool"
    }],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "constant": false,
    "inputs": [{
      "name": "to",
      "type": "address"
    }],
    "name": "transfer",
    "outputs": [{
      "name": "success",
      "type": "bool"
    }],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "anonymous": false,
    "inputs": [{
        "indexed": true,
        "name": "_from",
        "type": "address"
      },
      {
        "indexed": true,
        "name": "_to",
        "type": "address"
      }
    ],
    "name": "OwnershipTransferred",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [{
      "indexed": true,
      "name": "to",
      "type": "address"
    }],
    "name": "Transfer",
    "type": "event"
  },
  {
    "constant": false,
    "inputs": [{
      "name": "_newOwner",
      "type": "address"
    }],
    "name": "transferOwnership",
    "outputs": [],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "constructor"
  },
  {
    "payable": true,
    "stateMutability": "payable",
    "type": "fallback"
  },
  {
    "constant": true,
    "inputs": [{
      "name": "",
      "type": "uint256"
    }],
    "name": "addresses",
    "outputs": [{
      "name": "",
      "type": "address"
    }],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  },
  {
    "constant": true,
    "inputs": [{
      "name": "tokenOwner",
      "type": "address"
    }],
    "name": "balanceOf",
    "outputs": [{
      "name": "balance",
      "type": "uint256"
    }],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  },
  {
    "constant": true,
    "inputs": [],
    "name": "decimals",
    "outputs": [{
      "name": "",
      "type": "uint8"
    }],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  },
  {
    "constant": true,
    "inputs": [],
    "name": "name",
    "outputs": [{
      "name": "",
      "type": "string"
    }],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  },
  {
    "constant": true,
    "inputs": [],
    "name": "newOwner",
    "outputs": [{
      "name": "",
      "type": "address"
    }],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  },
  {
    "constant": true,
    "inputs": [],
    "name": "owner",
    "outputs": [{
      "name": "",
      "type": "address"
    }],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  },
  {
    "constant": true,
    "inputs": [],
    "name": "symbol",
    "outputs": [{
      "name": "",
      "type": "string"
    }],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  },
  {
    "constant": true,
    "inputs": [],
    "name": "totalSupply",
    "outputs": [{
      "name": "",
      "type": "uint256"
    }],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  }
];

var Voting;
var timeRemaining;
var VotingToken;
var userAccount;

window.addEventListener('load', function() {
  // Checks if Web3 has been injected by the browser (Mist/MetaMask)
  if (typeof web3 != 'undefined') {
    web3 = new Web3(web3.currentProvider);
    console.log("Using web3 detected from external source like Metamask");
    console.log(web3);
  } else {
    alert("Please download MetaMask to use this app");
  }
  web3.eth.defaultAccount = web3.eth.accounts[0];
  startApp()
});

// Instantiates smart contracts and sets user's account
function startApp() {
  var votingAddress = "0xe28044cb749e6350dae31ba2e1881dd6cc4eb005"; // Addresses are on Ropsten Test Net
  var votingContract = web3.eth.contract(votingABI);
  Voting = votingContract.at(votingAddress);
  console.log(Voting);

  var votingTokenAddress = "0xa21e2a59f9e1d57e5047253f44966ea8a460d1ad";
  var votingTokenContract = web3.eth.contract(votingTokenABI);
  VotingToken = votingTokenContract.at(votingTokenAddress);
  console.log(VotingToken);

  var accountInterval = setInterval(function() {
    // Check if account has changed
    if (web3.eth.accounts[0] !== web3.eth.defaultAccount) {
      web3.eth.defaultAccount = web3.eth.accounts[0];
    }
  }, 100);

  render();
  setTime();
}


// Populates the table with data from the smart contract
function render() {
  var choicesCount;

  var loader = $("#loader");
  var content = $("#content");
  var tableBody = $("#table-body");
  var form = $("#form");

  content.hide();
  loader.show();

  tableBody.empty();
  form.empty();

  async function addData() {
    choicesCount = await getChoicesCount();
    var choice, id, name, voteCount;
    for (let i = 0; i < choicesCount; i++) {
      choice = await getChoice(i);
      id = choice[0];
      name = choice[1];
      voteCount = choice[2];

      // Render candidate Result
      var tableTemplate = '<tr><td id="option-"' + i + '>' + name + '</td>' + '</td><td id="option-"' + i + '>' + voteCount + '</td></tr>';
      tableBody.append(tableTemplate);

      // Render candidate ballot option
      var formTemplate = "<option value='" + id + "' >" + name + "</ option>";
      form.append(formTemplate);
    }
  }

  addData();

  loader.hide();
  content.show();
}


// Functions below all use promises and callback functions to handle
// asynchronous calls from the blockchain

function getChoicesCount() {
  return new Promise(function(resolve, reject) {
    Voting.choicesCount(function(error, response) {
      if (error) {
        reject(error);
      } else {
        resolve(response);
      }
    })
  });
}

function getChoice(i) {
  return new Promise(function(resolve, reject) {
    Voting.votingChoices(i, function(error, response) {
      if (error) {
        reject(error);
      } else {
        resolve(response);
      }
    })
  });
}

function alreadyVoted(address) {
  return new Promise(function(resolve, reject) {
    Voting.voted(address, function(error, response) {
      if (error) {
        reject(error);
      } else {
        resolve(response);
      }
    })
  });
}

function getTimeRemaining() {
  return new Promise(function(resolve, reject) {
    Voting.timeEnding(function(error, response) {
      if (error) {
        reject(error);
      } else {
        resolve(response - Math.floor(Date.now() / 1000));
      }
    })
  });
}

function getBalance(address) {
  return new Promise(function(resolve, reject) {
    VotingToken.balanceOf(address, function(error, response) {
      if (error) {
        reject(error);
      } else {
        resolve(response);
      }
    })
  });
}


// Vote button handler
$("#vote-button").click(function() {
  Voting.voteForChoice($("#form").val(), function(error, response) {
    if (error) {
      console.error(error);
    } else {
      $("#txStatus").html("Your transaction is being processed right now, this might take a minute");
      console.log(response);
    }
  });
});

// Lookup button handler
$("#lookup-button").click(async function() {
  var tokens = await getBalance($("#voter-info").val());
  var voted = await alreadyVoted($("#voter-info").val());
  $("#tokens-owned").empty();
  $("#tokens-owned").html("Total Tokens owned: " + tokens.toString());
  $("#vote-cast").empty();
  $("#vote-cast").html("Voted Already: " + voted.toString());
});


async function setTime() {
  timeRemaining = await getTimeRemaining();
}

// Keeps of the time remaining for the current vote
setInterval(function updateTime() {
  var hours = Math.floor(timeRemaining / 3600);
  var minutes = Math.floor(timeRemaining / 60) % 60;
  var seconds = Math.floor(timeRemaining % 60);
  if (timeRemaining > 0) {
    $("#time").html("Voting Open - Time Remaining: " + hours + " hours " + minutes + " minutes " + seconds + " seconds");
  }
  else {
    $("#time").html("Voting Closed - Time Remaining: 0 seconds");
  }
  timeRemaining = timeRemaining - 1;
}, 1000);
