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
docker run -i -t -v "$(pwd)":"/tmp/pkg-tf" -w /tmp/pkg-tf --name pkg-tf hashicorp/terraform:1.1.6 apply
```

+ Result

```
$ docker run -i -t -v "$(pwd)":"/tmp/pkg-tf" -w /tmp/pkg-tf --name hashicorp/terraform:1.1.6 apply

Changes to Outputs:
  ~ format_timestamp = "2022-02-26-04-30" -> (known after apply)
  ~ timestamp        = "2022-02-26T04:30:51Z" -> (known after apply)

You can apply this plan to save these new output values to the Terraform state, without changing any real
infrastructure.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes


Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

format_timestamp = "2022-02-26-04-31"
timestamp = "2022-02-26T04:31:33Z"
```
