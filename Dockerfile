# Ultimate Creator Mega Suite Dockerfile
# Created by Rajsaraswati Jatav

FROM ubuntu:22.04

# Set working directory
WORKDIR /app

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV NODE_VERSION=18.17.0
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    nodejs \
    npm \
    ffmpeg \
    git \
    curl \
    wget \
    unzip \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# Install Node.js dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy application code
COPY . .

# Create necessary directories
RUN mkdir -p audio/sound-effects audio/music visuals/animations branding/logos

# Set permissions
RUN chmod +x tools/automation/setup.sh

# Expose ports
EXPOSE 3000 5000 8000

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:3000/health || exit 1

# Default command
CMD ["npm", "start"]