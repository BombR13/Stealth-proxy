FROM ghcr.io/puppeteer/puppeteer:latest

WORKDIR /app
COPY . .

RUN npm install

# 💾 Add swap to prevent crashes
RUN fallocate -l 512M /swapfile && \
    chmod 600 /swapfile && \
    mkswap /swapfile && \
    swapon /swapfile

EXPOSE 8080
CMD ["npm", "start"]
