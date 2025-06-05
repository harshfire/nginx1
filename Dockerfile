# Use the official NGINX base image
FROM nginx:latest

# Copy custom HTML or config files (optional)
# COPY ./html /usr/share/nginx/html
# COPY ./nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Start NGINX (this is the default CMD in nginx image)
CMD ["nginx", "-g", "daemon off;"]
