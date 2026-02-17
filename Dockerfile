FROM hexletbasics/base-image:latest

WORKDIR /exercises-action

ENV PATH=/exercises-action/bin:$PATH

COPY . .
