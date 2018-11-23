var eztz = require("./eztz.cli.js");
var crypto = eztz.crypto;
let mnemonic = crypto.generateMnemonic();
var passphrase = process.argv[2];
var keys = {}
// if(passphrase === undefined){
//     keys = crypto.generateKeys(mnemonic);
// }else{
//     keys = crypto.generateKeys(mnemonic,passphrase);
// }
// console.log(keys);
// extractKeys = crypto.extractKeys(keys.sk);
// console.log(extractKeys);
console.log(crypto.generateKeysNoSeed());