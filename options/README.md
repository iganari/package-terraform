# Options


## `-auto-approve`

+ `yes` no `no` 無しに Terraform を実行する。 CI/CD などでは必須。

```
terraform apply -auto-approve
```

## `-lock-timeout`

+ Terraform でリソースを作成する際に、その返り値を待つ時間(= lock を解くまでの時間)。デフォルトは 20分 

```
terraform apply -lock-timeout=30m
```
