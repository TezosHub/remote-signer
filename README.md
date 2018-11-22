# remote-signer

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
ruby app.rb 5000
```


import

```
./tezos-client import secret key cr4fun http://localhost:5000/tz1LsQBCLXYEQsbpTQw8EKsWSRUNThgTA4hT
```


reansfer

```
tezos-client transfer 1 from cr4fun to tz1amfhHn47i5ZYVnUGsTodsZW6G52vqAThE --fee 0.05;
```

