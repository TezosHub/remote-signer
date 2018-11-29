var eztz = require("./eztz.cli.js");
var get_ip = require("./ip.js");
var fs = require ("fs");
var crypto = eztz.crypto;
let mnemonic = crypto.generateMnemonic();
console.log(mnemonic);