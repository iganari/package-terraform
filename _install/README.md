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

+ 作業簡易化のため root になる

```
sudo su -
```

+ Terraform のバージョンを指定

```
export _tf_ver='1.0.6'
```

+ バイナリのダウンロード

```
cd /usr/local/bin/
wget https://releases.hashicorp.com/terraform/${_tf_ver}/terraform_${_tf_ver}_linux_amd64.zip /usr/local/bin/terraform_${_tf_ver}_linux_amd64.zip
```

+ アーカイブファイルの展開

```
unzip terraform_${_tf_ver}_linux_amd64.zip
```

+ 動作確認のために Version を出力

```
terraform --version
```

+ 不要なアーカイブファイルの削除

```
rm -rfv terraform_${_tf_ver}_linux_amd64.zip
```
