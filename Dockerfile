FROM ubuntu:22.04

# Install FFmpeg and bash
RUN apt-get update && \
    apt-get install -y ffmpeg bash && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy your video and audio files
COPY mainvideonosound.mp4 song1.mp3 ./
COPY start_stream_480p.sh ./

# Make the script executable
RUN chmod +x start_stream_480p.sh

# Pass the YOUTUBE_KEY as an environment variable
ENV YOUTUBE_KEY=""

CMD ["./start_stream_480p.sh"]
