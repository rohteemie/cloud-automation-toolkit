# Start with a base image for Python applications
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the application's requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code to the container
COPY . .

# Expose the application port
EXPOSE 5000

# Define the command to run the application
CMD ["python3", "app.py"]
