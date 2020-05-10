# About Function of timestamp

## Description

Returns the current date and time.

## Official URL

https://www.terraform.io/docs/configuration/functions/timestamp.html

## Demo

+ Create main.tf

```
cat << _EOF_ > main.tf
output "timestamp" {
  value = timestamp()
}
_EOF_
```

+ Terraform apply

```
docker run -i -t -v "$(pwd)":"/tmp/timestamp" -w /tmp/timestamp hashicorp/terraform:0.12.24 apply
```

+ Result

```
$ docker run -i -t -v "$(pwd)":"/tmp/timestamp" -w /tmp/timestamp hashicorp/terraform:0.12.24 apply

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

timestamp = 2020-05-10T12:50:45Z
```
