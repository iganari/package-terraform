# Package Terraform

My Terraform Knowledge

## Preparation

[Install 方法](./_install/README.md)

## Built-in Functions

https://www.terraform.io/docs/configuration/functions.html

### String Functions

+ [join](./func_join) について
  + 配列に入っている要素を繋げる
+ [timestamp](./func_timestamp) について
  + 現時点の timestamp を取得する


## Create Dev Env by Docker Compose

```
docker-compose up -d --build
```
```
docker-compose exec pkg-tf /bin/ash
```
```
docker-compose stop
docker-compose rm -f
```

## Terraform memo

```
gcloud auth application-default login --no-launch-browser -q
```
```
terraform plan
```
```
terraform apply --auto-approve
```

## 実行方法

+ Terraform 実行のための GCP 認証

```
gcloud auth application-default login -q
```

+ Terraform の初期設定

```
terraform init
```

+ 読み込んでいる Provider のバージョンをアップデートする

```
terraform init -upgrade
```

+ Terraform のテスト実行

```
terraform plan
```

+ Terraform 実行手順

```
terraform apply --auto-approve
```

+ 自動的に変更した状態を取り込むだけのコマンド

```
terraform apply -refresh-only
```
