var eztz = require("./eztz.cli.js");
var get_ip = require("./ip.js");
var fs = require ("fs");
var crypto = eztz.crypto;
var mnemonic = process.argv[2];
var passphrase = process.argv[3];
var keys = {}
if(passphrase === undefined){
    keys = crypto.generateKeys(mnemonic);
}else{
    keys = crypto.generateKeys(mnemonic,passphrase);
}
extractKeys = crypto.extractKeys(keys.sk);
var dir = process.cwd();
var file = dir+"/keys.json";
fs.readFile(file,'utf8',function (err, data) {
    json = [];
    if(!err) {
        json=JSON.parse(data);
    }
    json.push(extractKeys);
    fs.writeFileSync(file,JSON.stringify(json));
    console.log("keys added");
    console.log("your mnemonic:",mnemonic);
    if(passphrase!=undefined){
        console.log("your passphrase:",passphrase);
    }
    console.log("your address:",extractKeys.pkh);
    console.log("use this cmd to import your keys for tezos:");
    console.log("tezos-client import secret key yourname http://"+get_ip()+":5000/"+extractKeys.pkh);
});