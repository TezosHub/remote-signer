var eztz = require("./eztz.cli.js");
var fs = require ("fs");
var crypto = eztz.crypto;

var bytes = process.argv[2];
var pkh = process.argv[3];

var dir = process.cwd();
var file = dir+"/keys.json"

fs.readFile(file,'utf8',function (err, data) {

    
    if(err) console.log(err);
    var keys=JSON.parse(data);
    keys.forEach(key => {
        if(key.pkh === pkh){
            var sk = key.sk;
            var sig = crypto.sign(bytes,sk);
            console.log(sig.edsig);
        }
    });
});