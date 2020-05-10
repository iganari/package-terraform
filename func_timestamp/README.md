# About timestamp

## Official URL

https://www.terraform.io/docs/configuration/functions/timestamp.html

## Demo

+ Apply

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
