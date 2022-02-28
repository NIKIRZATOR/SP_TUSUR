FROM debian
RUN apt update
RUN apt-get install sudo
COPY script.sh .
RUN chmod ugo+x script.sh
CMD ./script.sh
