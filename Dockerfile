FROM python:3.10

RUN apt-get update && apt-get -y install cron vim

WORKDIR /app

# register the cron job.
COPY crontab /etc/cron.d/crontab
RUN chmod 0644 /etc/cron.d/crontab
RUN /usr/bin/crontab /etc/cron.d/crontab

# copy the script.
COPY hello.py /app/hello.py

# run crond as main process of container.
CMD ["cron", "-f"]


