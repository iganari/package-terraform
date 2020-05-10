# timestamp について

## 公式 URL

WIP

## でも

```
docker build . --tag pkg-tf
```
```
cd timestamp
```
```
docker run -i -t -v main.tf:/tmp/main.tf -w /tmp pkg-tf plan main.tf
docker run -i -t -v "$(pwd)":"/tmp/timestamp" -w /tmp/timestamp pkg-tf apply
```
