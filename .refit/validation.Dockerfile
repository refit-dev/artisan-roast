# Refit validation image for refit-dev/artisan-roast: its committed lockfile installed at /opt/app.
FROM node:24-alpine
# The lockfile resolves artisan-roast-sdk from GitHub, which npm fetches with git.
RUN apk add --no-cache git
WORKDIR /opt/app
COPY package.json package-lock.json ./
# Install scripts stay off, as in Refit's own preparation. The check user (65534) must read the tree.
RUN npm ci --ignore-scripts --no-audit --no-fund && chmod -R a+rX /opt/app
