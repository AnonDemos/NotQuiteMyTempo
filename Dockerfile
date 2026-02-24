# Use the official Ruby image
FROM ruby:3.2

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# Install Jekyll and Bundler
RUN gem install jekyll bundler jekyll-theme-cayman

# Set working directory
WORKDIR /srv/jekyll

# Expose the Jekyll port
EXPOSE 4000

# Default command to serve site
CMD ["jekyll", "serve", "--host", "0.0.0.0", "--livereload"]