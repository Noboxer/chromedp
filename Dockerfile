FROM chromedp/headless-shell

# Install procps to get the sysctl command
RUN apt-get update && apt-get install -y procps socat

# Increase inotify watches limit
RUN echo fs.inotify.max_user_watches=524288 | tee -a /etc/sysctl.conf && sysctl -p

# Expose ports
EXPOSE 9222
EXPOSE 9223

# Ensure shared memory size
RUN mkdir -p /dev/shm && mount -t tmpfs -o size=2G tmpfs /dev/shm

# Run socat and headless shell with necessary flags
CMD socat TCP4-LISTEN:9222,fork TCP4:127.0.0.1:9223 & \
    headless-shell --no-sandbox --use-gl=angle --use-angle=swiftshader --remote-debugging-address=0.0.0.0 --remote-debugging-port=9223
