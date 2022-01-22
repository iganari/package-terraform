# インストール方法

## Download

```
## Download Terraform
https://www.terraform.io/downloads.html
```

```
## リリースタグ
https://github.com/hashicorp/terraform/releases
```

## Linux にインストールする

```
sudo su -
```
```
export _tf_ver='1.1.3'

wget https://releases.hashicorp.com/terraform/${_tf_ver}/terraform_${_tf_ver}_linux_amd64.zip /usr/local/bin/terraform_${_tf_ver}_linux_amd64.zip
cd /usr/local/bin
unzip terraform_${_tf_ver}_linux_amd64.zip
cd -
```
```
terraform --version
```
```
rm -rfv terraform_${_tf_ver}_linux_amd64.zip
```
```
exit
```
