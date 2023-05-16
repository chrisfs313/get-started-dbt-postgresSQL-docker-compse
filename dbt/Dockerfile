FROM ghcr.io/dbt-labs/dbt-postgres:1.3.0

# This is for testing the connections, command: ping
RUN apt-get update -y
RUN apt-get install -y iputils-ping

COPY ./project /usr/app
COPY ./project/profiles.yml /root/.dbt/
COPY ./wait-for-it.sh wait-for-it.sh

RUN chmod +x wait-for-it.sh

ENTRYPOINT ["/bin/bash"]
