var eztz = require("./static/js/eztz2.js");


// var crypto = eztz.crypto;
// let mnemonic = crypto.generateMnemonic();
// var passphrase = process.argv[2];
// var keys = {}
// if(passphrase === undefined){
//     keys = crypto.generateKeys(mnemonic);
// }else{
//     keys = crypto.generateKeys(mnemonic,passphrase);
// }
// console.log(keys);
// extractKeys = crypto.extractKeys(keys.sk);
// console.log(extractKeys);
console.log(eztz.eztz.crypto.extractEncryptedKeys("edesk1ykLXqo3KyfUxo9bsgpsPvQFSW3oQcBGN9cnmuSW5tDCjY15B6GF8bjLhZAZi4dRj4k9QSWb41dMCkieb6X","123456"));