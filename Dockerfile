FROM chromedp/headless-shell

# Install procps and socat
RUN apt-get update && apt-get install -y procps socat

# Expose ports
EXPOSE 9222
EXPOSE 9223

# Ensure shared memory size
RUN mkdir -p /dev/shm && mount -t tmpfs -o size=2G tmpfs /dev/shm

# Copy the startup script
COPY startup.sh /usr/local/bin/startup.sh
RUN chmod +x /usr/local/bin/startup.sh

# Run the startup script
CMD ["/usr/local/bin/startup.sh"]
