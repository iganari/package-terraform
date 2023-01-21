# インストール方法

## Download

+ ダウンロードページ
  + https://www.terraform.io/downloads.html

+ リリースタグ
  + https://github.com/hashicorp/terraform/releases

+ 最新バージョンを cURL と jq で確認する
  + curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest | jq -r .tag_name


## Linux にインストールする

### Ubuntu / Debian

+ 以下の OS が対象
  + Ubuntu サーバーとかは基本 `amd64` でよい(たぶん)

```
uname -a
```
```
### 例

$ uname -a
Linux igrs-ws-2023-vm 5.15.0-1021-gcp #28-Ubuntu SMP Fri Oct 14 15:46:06 UTC 2022 x86_64 x86_64 x86_64 GNU/Linux


# x86_64 の場合は  amd64
# aarch64 の場合は arm64 
```


+ もしくは下記

```
cat /proc/cpuinfo
```

+ 作業簡易化のため root になる

```
sudo su -
```

+ Terraform のバージョンを指定

```
export _tf_ver='1.2.4'
```

+ もしくは最新バージョンを取りたい場合

```
export _latest_tf_ver=$(curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest | jq -r .tag_name)
export _tf_ver=`echo "$_latest_tf_ver" | sed s'/v//'g`
```

+ バイナリのダウンロード

```
cd /usr/local/bin/
wget https://releases.hashicorp.com/terraform/${_tf_ver}/terraform_${_tf_ver}_linux_amd64.zip /usr/local/bin/terraform_${_tf_ver}_linux_amd64.zip
```

+ アーカイブファイルの展開と権限付与

```
unzip terraform_${_tf_ver}_linux_amd64.zip
chmod 0755 /usr/local/bin/terraform
```

+ 動作確認のために Version を出力

```
terraform --version
```

+ 不要なアーカイブファイルの削除

```
rm -rfv terraform_${_tf_ver}_linux_amd64.zip
```
```
exit
```
