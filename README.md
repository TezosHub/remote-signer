# remote-signer for tezos


clone 

```
https://github.com/TezosHub/remote-signer.git
```

install

```
cd remote-signer
gem install sinatra
gem install rack-ssl
npm install
```

run

```
screen ruby app.rb 5000&
```

创建一个key

```
node gen 1223456
```

从助记词导入
```
node import_from_mnemonic.js "weapon embody amount chunk unaware claim humble flash essence lobster jump deliver symptom print puzzle"
```

从私钥导入
```
node import_from_privete_key.js edskRoUb1xiiZCy423hRNbic6wF4zTUSUE3M5SmVRpTAER8Xz5Ah9dgpFVdzuYqgvTUyryS5HaDRfLX418LkecJ3gpUASEuAEw
```




从签名服务器导入账户 cr4fun

```
tezos-client import secret key cr4fun http://localhost:5000/tz1LsQBCLXYEQsbpTQw8EKsWSRUNThgTA4hT
```

使用签名服务器完成转账

reansfer

```
tezos-client transfer 1 from cr4fun to tz1amfhHn47i5ZYVnUGsTodsZW6G52vqAThE --fee 0.05;
```

