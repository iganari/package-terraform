# About Function of join

## Description

`join` produces a string by concatenating together all elements of a given list of strings with the given delimiter.

## Official URL

https://www.terraform.io/docs/configuration/functions/join.html

## Demo

+ Create main.tf

```
cat << _EOF_ > main.tf
output "join-01" {
  value = join(",", ["foo", "bar", "baz"])
}

output "join-02" {
  value = join(",", ["foo"])
}

output "join-03" {
  value = join("-", ["foo", "bar", "baz"])
}

output "join-04" {
  value = join("", ["foo", "bar", "baz"])
}
_EOF_
```

+ Terraform apply

```
docker run -i -t -v "$(pwd)":"/tmp/join" -w /tmp/join hashicorp/terraform:0.12.24 apply
```

+ Result

```
$ docker run -i -t -v "$(pwd)":"/tmp/join" -w /tmp/join hashicorp/terraform:0.12.24 apply

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

join-01 = foo,bar,baz
join-02 = foo
join-03 = foo-bar-baz
join-04 = foobarbaz
```
