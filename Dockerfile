FROM ruby:3.2-alpine

# Install dependencies
RUN apk add --no-cache \
    build-base \
    gcc \
    cmake \
    git \
    musl-dev \
    libffi-dev \
    tzdata

# Set working directory
WORKDIR /srv/jekyll

# Copy Gemfile
COPY Gemfile* ./

# Install gems
RUN gem install bundler:2.4.22 && \
    bundle config set force_ruby_platform true && \
    bundle install

# Copy the rest of the site
COPY . .

# Expose port
EXPOSE 4000 35729

# Start Jekyll
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--livereload", "--force_polling"]
