# ckgit
for ssh proxy git clone

> git clone 慢的话，用自己的机器clone代码，然后传回来解压，如果突然是用不了其他代理加速，
可以用此方法 临时clone。

# use
- copy clone.sh to your remote machine somewhere default [/home/sshtemp/]
```
scp -P 22 ./clone.sh root@64.64.xxx.xxx:/home/sshtemp
```
- change the ssh ip and scp id
add to ~/.zshrc
```
function ckgit(){
        ssh root@64.64.xxx.xxx -p 22 "cd /home/sshtemp; bash clone.sh $1"
        scp -P 22 root@64.64.xxx.xxx:/home/sshtemp/$2.tar.gz ./
        tar -xvf  $2.tar.gz -C ${GOPATH}/src/github.com/
        rm -f $2.tar.gz
}
```
```
source ~/.zshrc
```
```
ckgit [dist-repo] [dist-user]
ckgit git@github.com:cowkeys/ckjson.git cowkeys
```
# ps
```
1 be sure login remote through ssh without password
2 repo address must using ssh instead of http
```
