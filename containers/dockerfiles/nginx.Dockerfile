# Start with the NGINX base image
FROM nginx:latest

# Copy the custom NGINX configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Expose the HTTP port
EXPOSE 80

# Default command is already set by the NGINX image
