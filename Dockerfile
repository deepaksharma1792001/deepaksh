
# The original Dockerfile is missing the EXPOSE command to specify which port the container will be listening on.
# Adding the EXPOSE command to expose port 80.

FROM mysterysd/wzmlx:latest

WORKDIR /usr/src/app
# The original Dockerfile sets the permission to 777 for the entire /usr/src/app directory, which is not recommended for security reasons.
# Changing the permission to 755 to ensure read and execute access for everyone.
RUN chmod 755 /usr/src/app

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

# Adding the EXPOSE command to expose port 80.
EXPOSE 80

# Adding a delay before starting the application to give other services in the container enough time to start.
# Sleeping for 5 seconds.
CMD ["bash", "-c", "sleep 5 && bash start.sh"]
