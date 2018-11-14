# remote-signer



```
ruby app.rb 5000
```



分别导入 alice 和 scott 的公钥

```
tezos-client import secret key alice http://localhost:5000/tz1amfhHn47i5ZYVnUGsTodsZW6G52vqAThE
tezos-client import secret key scott http://localhost:5000/tz1i1zKCtCAPuAw1e6SuKEMXRcwhG5a78Ruo
```

```
tezos-client transfer 1 from alice to scott --fee 0.05;
```

or

```
tezos-client transfer 1 from alice to tz1i1zKCtCAPuAw1e6SuKEMXRcwhG5a78Ruo --fee 0.05;
```

test
```
curl http://localhost:2323 -X POST -d '{"name":"tom"}'
```