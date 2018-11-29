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


### hsm

```
/opt/cloudhsm/bin/cloudhsm_mgmt_util /opt/cloudhsm/etc/cloudhsm_mgmt_util.cfg
loginHSM CO admin passwd
create CU user passwd
```


handel

```
genSymKey -t 31 -s 32 -l aes256
```

加密

```
./en.sh user passwd Handle
```

解密

```
./de.sh user passwd Handle
```


### 目录说明
```
├── app.rb                          签名服务器      
├── data                            未签名的历史数据
├── de.sh                           从HSM中解密 keys.json
├── en.sh                           用HSM加密   keys.json
├── eztz.cli.js                     js签名算法库
├── gen.js                          生成sk、pk、pkh
├── import_from_mnemonic.js         助记词导入签名服务器
├── import_from_privete_key.js      私钥导入签名服务器
├── ip.js       
├── keys                            经过 HSM 加密的 key.json                      
├── node_modules
├── package.json                
├── README.md                       说明文档
├── sig.js                          签名命令行

```