FROM chromedp/headless-shell

EXPOSE 9222

CMD ["--no-sandbox", "--remote-debugging-address=0.0.0.0", "--remote-debugging-port=9222"]
