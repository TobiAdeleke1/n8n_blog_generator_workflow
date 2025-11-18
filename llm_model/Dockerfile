FROM ollama/ollama:latest

RUN apt-get update && apt-get install -y --no-install-recommends curl && rm -rf /var/lib/apt/lists/

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
# make script executable
RUN chmod +x /entrypoint.sh

# use entrypoint.sh as container entrypoint
ENTRYPOINT ["/entrypoint.sh"]