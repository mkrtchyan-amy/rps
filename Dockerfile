# Dockerfile
# Use the official Ruby image as a base image
FROM ruby:2.7.6

# Set environment variables
ENV RAILS_ENV=development

# Install dependencies
RUN apt-get update -qq

# Install the specific version of Bundler
RUN gem install bundler:2.3.15

# Set the working directory
WORKDIR /myapp

# Copy the Gemfile and Gemfile.lock
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# Install the gems
RUN bundle install

# Copy the rest of the application code
COPY . /myapp

# Precompile assets
RUN bundle exec rake assets:precompile

# Remove existing server.pid file
RUN rm -f tmp/pids/server.pid

# Expose port 3000
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
