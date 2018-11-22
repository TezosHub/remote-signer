var eztz = require("./eztz.cli.js");
var fs = require ("fs");
var crypto = eztz.crypto;
let mnemonic = crypto.generateMnemonic();
var keys = crypto.generateKeys(mnemonic);
var dir = process.cwd();
var file = dir+"/keys.json";
fs.readFile(file,'utf8',function (err, data) {
    json = [];
    if(!err) {
        json=JSON.parse(data);
    }
    json.push(keys);
    fs.writeFileSync(file,JSON.stringify(json)) 
});