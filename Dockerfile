FROM node:lts-buster

# Install dependencies
RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

# Install PM2 globally
RUN npm install -g pm2 

# Clone the repository
RUN git clone https://github.com/Faleosqilz09/HALLOVFEM-XMD /root/ToshTech

# Set working directory
WORKDIR /root/ToshTech

# Copy package.json and install dependencies
COPY package.json package-lock.json* ./
RUN npm install --legacy-peer-deps && npm cache clean --force

# Copy the rest of the files
COPY . .

# Expose port
EXPOSE 5000

# Start the application
CMD ["node", "ibrahim.js"]

