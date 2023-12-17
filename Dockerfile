# Use the official PostgreSQL image as a parent image
# Last version of postgres 15 before major release 16, which is too new to use
FROM postgres:15.5  

LABEL AUTHOR sedentary

# Set locale en_CA.UTF-8
RUN localedef -i en_CA -c -f UTF-8 -A /usr/share/locale/locale.alias en_CA.UTF-8
ENV LANG en_CA.utf8

# Set default environment variables
# These values will be overridden by variables defined in the .env file at runtime
ENV POSTGRES_DB=yp_db
ENV POSTGRES_USER=yp_db_user
ENV POSTGRES_PASSWORD=yp_db_password

# # Optional: Add initialization scripts if you have any
# COPY ./init-scripts/ /docker-entrypoint-initdb.d/


# Install cron
# RUN apt-get update && apt-get install -y cron
RUN echo "* * * * * /path/to/upgrade.sh >> /var/log/upgrade.log 2>&1" | crontab -

# Add your script
COPY upgrade.sh upgrade.sh
RUN chmod +x upgrade.sh

# Create a cron job
RUN echo "0 0 * * * upgrade.sh >> /var/log/upgrade.log 2>&1" | crontab -

# Run the command on container startup
CMD ["cron", "-f"]


