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
