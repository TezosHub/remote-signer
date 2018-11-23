var eztz = require("./eztz.cli.js");
var get_ip = require("./ip.js");
var fs = require ("fs");
var crypto = eztz.crypto;
var sk = process.argv[2];
extractKeys = crypto.extractKeys(sk);
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
    console.log("your address:",extractKeys.pkh);
    console.log("use this cmd to import your keys for tezos:");
    console.log("tezos-client import secret key yourname http://"+get_ip()+":5000/"+extractKeys.pkh);
});