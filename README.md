# domain-proxy-server
二级域名代理服务


### 注意
如果需要使用https协议访问，则需要添加相应域名的证书
        
        1. 添加相应域名的证书到certs目录下，并把公钥命名为public.crt，私钥命名为rsa.key
        2. 去掉domain.conf中的ssl部分的注释
        
        
### Bootstrap
请确保用户有root权限

        curl -o domain-init.sh -L https://raw.githubusercontent.com/KuickDeal/domain-proxy-server/develop/bootstrap/init.sh && sh domain-init.sh
