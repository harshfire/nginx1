FROM ubuntu:20.04

# Install build dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpcre3 \
    libpcre3-dev \
    zlib1g-dev \
    libssl-dev \
    git \
    wget \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /usr/src

# Clone the Nginx repository (if not already cloned)
# Note: Since you've already cloned the repo, you can copy it into the Docker build context instead
# Alternatively, uncomment the following line to clone inside the Docker build
# RUN git clone --depth 1 https://github.com/nginx/nginx.git

# Copy the source code into the Docker image (assuming you are building from local clone)
COPY nginx /usr/src/nginx

WORKDIR /usr/src/nginx

# Generate build configuration (auto tools)
# Note: Nginx uses its own configure script, so no autotools needed

# Build and install Nginx
RUN ./auto/configure --with-http_ssl_module --with-pcre --with-zlib=/usr \
    && make \
    && make install

# Expose port 80
EXPOSE 80

# Run Nginx
CMD ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]
