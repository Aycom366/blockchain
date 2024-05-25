// SPDX-License-Identifier: UNLICENSED

//It's very imperative to have this version setup to let the compiler knows this is version you wanna use
pragma solidity >=0.8.2 <0.9.0;

//tells the compiler the next step of code will be a contact
contract SimpleStorage{

    //This will be default to 0 if not initialize to anything
    uint256 favoriteNUmber;

    //Arrays
    //This is a dynamic array because it can take in any size
    People[] public people;


    People public person  = People({favoriteNUmber:2,name:"Aymide"});

    /**
    mapping in solidity
    This looks similar to Map in javascript
    Essentially a key value pair
    */
    mapping(string=>uint256)public nameToFavoriteNumber;

    /**
    This is how to define an object in solidity
    */
    struct People{
        uint256 favoriteNUmber;
        string name;
    }

    function store(uint256 _favoriteNUmber) public{
        favoriteNUmber = _favoriteNUmber; 
        retreive(); // This function will cost us gas 
    }

function addPerson(string memory _name,uint256 _favoriteNumber) public{
    People memory newPerson = People({
        favoriteNUmber:_favoriteNumber, name:_name
    });
    people.push(newPerson);

    //add the name and favorite number for easy access
    nameToFavoriteNumber[_name] = _favoriteNumber;

    //This is another way of pushing to an array
    //people.push(People(_favoriteNumber,_name));
}

   /**
   A view and pure functions disallow modification of state
   we dont spend a gas here because we are reading and not changing
   Also==> If a gas calling function calls a view or pure function - only then will it cost gas
   */
    function retreive() public view returns(uint256){
        return favoriteNUmber;
    }

    /**
    There are 6 places we can store data in solidity
    Stack
    Memory => data is going to exist temporarily, this can be used in a function to store args that can be passedi inside of it
    Storage => exits even outside of the function using the memory
    Calldata => calldata is also the same thing as memory but you can reassign the value of the arg passed
    Code
    Logs

    Data location can also only be specified for array, struct or mapping types
    */

//  bool hn asFavouriteNumber = true;

//  // you can specify how many bytes you can allocate
//  //by default, its automatically uint256 if not specified
//  //its mostly positive
//  uint favoriteNumber  =123;

// //can take in a negative number or a positive number
//  int anotherNumber = 5000;

//  string favouriteNumberInExt = "2565";

//  address myAddress = 0xf17E413dCaAB35eD10998140e54c48872da14a4C;

//  bytes favoriteBytes  = "cat";

}