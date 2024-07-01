FROM chromedp/headless-shell

# Increase inotify watch limits
RUN echo "fs.inotify.max_user_watches=524288" >> /etc/sysctl.conf && sysctl -p

EXPOSE 9222

# Set shared memory size to 2GB
RUN mkdir -p /dev/shm && mount -t tmpfs -o size=2G tmpfs /dev/shm

# Run the headless shell with necessary flags
CMD ["--no-sandbox", "--remote-debugging-address=0.0.0.0", "--remote-debugging-port=9222"]
