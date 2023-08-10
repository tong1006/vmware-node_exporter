FROM golang:1.16 as builder
WORKDIR /src/github.com/devinotelecom/prometheus-vmware-exporter
COPY ./ /src/github.com/devinotelecom/prometheus-vmware-exporter
RUN go get -d -v
RUN CGO_ENABLED=0 GOOS=linux go build

FROM alpine:3.14
COPY --from=builder /src/github.com/devinotelecom/prometheus-vmware-exporter/prometheus-vmware-exporter /usr/bin/prometheus-vmware-exporter
EXPOSE 9879
ENTRYPOINT ["prometheus-vmware-exporter"]
