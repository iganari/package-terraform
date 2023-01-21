# Version について

## 最新バージョンについて

GitHub の Release を確認する ---> 　https://github.com/hashicorp/terraform/releases

## 変更を追従するには

WIP

## Bash でローカルの Terraform のバージョンが最新バージョンか否かチェックする

+ サンプル

```
export _this_tf_ver=$(terraform version | awk 'NR==1 {print $2}')
export _latest_tf_ver=$(curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest | jq -r .tag_name)

if [ "${_this_tf_ver}" == "${_latest_tf_ver}" ]; then
  echo '実行している Terraform の Version は最新版のようです!! :)'
else
  echo '実行している Terraform の Version は最新版ではありません。 Terraform の Version を確認してください。---> https://github.com/hashicorp/terraform/releases' && exit 1
fi
```

## CI/CD の実行環境の Terraform のバージョンが最新バージョンか否かチェックする

[Package GCP](https://github.com/iganari/package-gcp) を参照してください ---> https://github.com/iganari/package-gcp/tree/main/cloud-build/terraform
