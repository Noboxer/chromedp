FROM chromedp/headless-shell

# Install procps to get the sysctl command
RUN apt-get update && apt-get install -y procps

# Increase inotify watch limits
RUN echo "fs.inotify.max_user_watches=524288" >> /etc/sysctl.conf && sysctl -p

EXPOSE 9222

# Set shared memory size to 2GB
RUN mkdir -p /dev/shm && mount -t tmpfs -o size=2G tmpfs /dev/shm

# Run the headless shell with necessary flags
CMD ["--no-sandbox", "--use-gl=angle", "--use-angle=swiftshader", "--remote-debugging-address=0.0.0.0", "--remote-debugging-port=9222"]
