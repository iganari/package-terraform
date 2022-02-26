# About Function of timestamp

## Description

Returns the current date and time.

## Official URL

https://www.terraform.io/docs/configuration/functions/timestamp.html

## Demo

+ Clone Repo

```
git clone https://github.com/iganari/package-terraform.git
cd package-terraform/func_timestamp
```

+ Terraform apply

```
docker run -i -t -v "$(pwd)":"/tmp/pkg-tf" -w /tmp/pkg-tf hashicorp/terraform:0.12.24 apply
```

+ Result

```
$ docker run -i -t -v "$(pwd)":"/tmp/pkg-tf" -w /tmp/pkg-tf hashicorp/terraform:0.12.24 apply

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

timestamp = 2020-05-10T12:50:45Z
```
