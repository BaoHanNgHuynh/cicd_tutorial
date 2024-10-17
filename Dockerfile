FROM ubuntu:latest

MAINTAINER Tuan Thai "tuanthai@example.com"

# Install necessary packages and python3-venv
RUN apt update -y && \
    apt install -y python3-pip python3-dev build-essential python3-venv

# Create a virtual environment
RUN python3 -m venv /venv

# Set the PATH to use the virtual environment
ENV PATH="/venv/bin:$PATH"

# Copy requirements.txt and install dependencies
COPY requirements.txt /flask_app/
WORKDIR /flask_app

RUN pip install --no-cache-dir -r requirements.txt

# Set the entrypoint (adjust as necessary)
ENTRYPOINT ["python", "app.py"]  # Replace with your main app file
