FROM hexletbasics/base-image:latest

ENV var1=value1
ENV var2=value2

WORKDIR /exercises-action

ENV PATH=/exercises-action/bin:$PATH

COPY . .
