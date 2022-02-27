# Package Terraform

My Terraform Knowledge

## 注意事項

この Repository の mudule は汎用的な module ではなく、ある程度使いかたを限定した module です

## Preparation

[Install 方法](./_install/README.md)

## Built-in Functions

https://www.terraform.io/docs/configuration/functions.html

## String Functions

+ [join](./func_join) について
  + 配列に入っている要素を繋げる
+ [timestamp](./func_timestamp) について
  + 現時点の timestamp を取得する

## Docker を用いた簡易開発環境

```
docker-compose up --build -d
```
```
docker-compose exec package-terraform-gcp /bin/sh
```
```
docker-compose stop
```
```
docker-compose rm -f
```

## 参考

```
GitHub | Google Cloud and HashiCorp
https://github.com/terraform-google-modules
```
```
Terraform Registry | Google Cloud and HashiCorp
https://registry.terraform.io/namespaces/terraform-google-modules
```
