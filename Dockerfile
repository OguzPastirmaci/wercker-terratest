FROM golang

RUN apt update && apt install unzip

RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

RUN curl -L -s https://releases.hashicorp.com/terraform/0.11.11/terraform_0.11.11_linux_amd64.zip -o /go/bin/terraform.zip \
   && unzip /go/bin/terraform.zip -d /go/bin \
   && chmod +x /go/bin/terraform

RUN curl --location --silent --fail --show-error -o terratest_log_parser https://github.com/gruntwork-io/terratest/releases/download/v0.13.13/terratest_log_parser_linux_amd64

RUN chmod +x terratest_log_parser && mv terratest_log_parser /usr/local/bin