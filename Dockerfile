FROM alpine:3.15.0
RUN apk add nano python3 
COPY script.sh /
RUN chmod +x script.sh

CMD script.sh