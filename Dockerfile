
# The original Dockerfile is missing the EXPOSE command to specify which port the container will be listening on.
# Adding the EXPOSE command to expose port 80.

FROM mysterysd/wzmlx:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

# Adding the EXPOSE command to expose port 80.
EXPOSE 80

CMD ["bash", "start.sh"]
