FROM ubuntu:trusty
MAINTAINER docker@ekito.fr
 
RUN apt-get update && apt-get install -y cron && apt-get install -y vim && apt-get install -y dos2unix 
 
# Add crontab file in the cron directory
#ADD crontab /etc/cron.d/minecron
#RUN dos2unix /etc/cron.d/minecron

# Give execution rights on the cron job
#RUN chmod 0644 /etc/cron.d/minecron
 
COPY crontab minecron
RUN dos2unix minecron
RUN crontab minecron 
 
# Create the log file to be able to run tail
RUN touch /var/log/cron.log
 
# Run the command on container startup
CMD cron && tail -f /var/log/cron.log