# 📦 Installation Guide - Ultimate Creator Mega Suite

**Complete Setup Guide by Rajsaraswati Jatav**

## 🎯 System Requirements

### Minimum Requirements
- **OS**: Windows 10/11, macOS 10.15+, Ubuntu 18.04+
- **RAM**: 4GB (8GB recommended)
- **Storage**: 2GB free space (5GB recommended)
- **Internet**: Required for initial setup

### Recommended Requirements
- **OS**: Latest stable versions
- **RAM**: 16GB or more
- **Storage**: 10GB+ SSD space
- **GPU**: For video processing features
- **Internet**: High-speed connection

## 🚀 Quick Installation

### Method 1: Automated Setup (Recommended)
```bash
# Clone the repository
git clone https://github.com/RAJSARASWATI-JATAV/ultimate-creator-mega-suite.git
cd ultimate-creator-mega-suite

# Run setup script
chmod +x tools/automation/setup.sh
./tools/automation/setup.sh
```

### Method 2: Docker Installation
```bash
# Clone and build
git clone https://github.com/RAJSARASWATI-JATAV/ultimate-creator-mega-suite.git
cd ultimate-creator-mega-suite

# Using Docker Compose
docker-compose up -d
```

### Method 3: Manual Installation

#### Step 1: Install Dependencies
```bash
# Install Python 3.8+
sudo apt-get install python3 python3-pip

# Install Node.js 18+
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install FFmpeg
sudo apt-get install ffmpeg
```

#### Step 2: Install Python Packages
```bash
pip3 install -r requirements.txt
```

#### Step 3: Install Node.js Packages
```bash
npm install
```

#### Step 4: Setup Configuration
```bash
# Copy environment template
cp config/environment/development.env .env

# Edit configuration
nano .env
```

## 🔧 Configuration

### Environment Variables
Edit `config/environment/development.env`:

```env
# Basic Configuration
NODE_ENV=development
PORT=3000
DEBUG=true

# Database URLs
DATABASE_URL=mongodb://localhost:27017/ultimate_suite_dev
REDIS_URL=redis://localhost:6379

# API Keys (Get from respective platforms)
YOUTUBE_API_KEY=your_youtube_api_key_here
INSTAGRAM_API_TOKEN=your_instagram_token_here
TWITTER_API_KEY=your_twitter_api_key_here

# Security
JWT_SECRET=your_super_secret_jwt_key_here
ENCRYPTION_KEY=your_encryption_key_here

# File Upload
MAX_FILE_SIZE=100MB
UPLOAD_DIR=uploads/
```

### API Keys Setup

#### YouTube API
1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create new project or select existing
3. Enable YouTube Data API v3
4. Create credentials (API Key)
5. Add to `.env` file

#### Instagram API
1. Visit [Facebook Developers](https://developers.facebook.com/)
2. Create app and get Instagram Basic Display
3. Generate access token
4. Add to configuration

## 🎵 Audio Setup

### Sound Effects Library
```bash
# Download sample sound effects (optional)
mkdir -p audio/sound-effects/ui-sounds
wget -O audio/sound-effects/ui-sounds/click.mp3 "https://example.com/click.mp3"

# Or record your own sounds
# Place files in respective directories:
# - audio/sound-effects/ui-sounds/
# - audio/sound-effects/transition-sounds/
# - audio/sound-effects/ambient/
```

### Music Library
```bash
# Add royalty-free music to:
# - audio/music/intro-music.mp3
# - audio/music/outro-music.mp3
# - audio/music/background-tracks/
```

## 🎬 Visual Effects Setup

### Animation Files
```bash
# Download or create animations
mkdir -p visuals/animations/loading-spinners
mkdir -p visuals/animations/transitions
mkdir -p visuals/animations/particles
```

### Icon Collections
```bash
# Download icon packs
mkdir -p visuals/icons/feature-icons
mkdir -p visuals/icons/social-icons
mkdir -p visuals/icons/ui-icons
```

## 🎨 Branding Setup

### Logo Files
```bash
# Add your logos to:
# - branding/logos/primary-logo.svg
# - branding/logos/secondary-logo.svg
# - branding/logos/logo-white.png
# - branding/logos/logo-dark.png
```

### Custom Fonts
```bash
# Add fonts to:
# - branding/fonts/brand-fonts.zip
```

## 🚀 Running the Application

### Development Mode
```bash
# Start all services
npm run dev

# Or start individual services
python src/backend/python/main.py  # Python backend
node src/backend/node/server.js    # Node.js backend
```

### Production Mode
```bash
# Build and start
npm run build
npm start
```

### Using Docker
```bash
# Development
docker-compose -f docker-compose.dev.yml up

# Production
docker-compose up -d
```

## 🔍 Verification

### Check Installation
```bash
# Check Python dependencies
python3 -c "import flask, opencv, requests; print('Python setup OK')"

# Check Node.js dependencies
node -e "console.log('Node.js setup OK')"

# Check services
curl http://localhost:3000/health
```

### Test Features
1. Open `http://localhost:3000`
2. Check audio playback
3. Test visual effects
4. Verify file uploads
5. Test API endpoints

## 🐛 Troubleshooting

### Common Issues

#### Port Already in Use
```bash
# Find and kill process using port 3000
lsof -ti:3000 | xargs kill -9
```

#### Python Import Errors
```bash
# Reinstall requirements
pip3 uninstall -r requirements.txt -y
pip3 install -r requirements.txt
```

#### FFmpeg Not Found
```bash
# Ubuntu/Debian
sudo apt-get update
sudo apt-get install ffmpeg

# macOS
brew install ffmpeg

# Windows
# Download from https://ffmpeg.org/download.html
```

#### Permission Denied
```bash
# Fix permissions
chmod +x tools/automation/setup.sh
chmod +x tools/*/*.sh
```

## 📱 Mobile Setup

### Android Development
```bash
# Install Android SDK
# Setup in src/mobile/android/
```

### Flutter Setup
```bash
# Install Flutter SDK
flutter doctor
cd src/mobile/flutter
flutter pub get
```

## ☁️ Cloud Deployment

### AWS Deployment
```bash
# Configure AWS CLI
aws configure

# Deploy using provided scripts
./deployment/scripts/deploy.sh aws
```

### Google Cloud
```bash
# Configure gcloud
gcloud auth login

# Deploy
./deployment/scripts/deploy.sh gcloud
```

## 📊 Monitoring Setup

### Log Configuration
```bash
# Setup log directories
mkdir -p monitoring/logs
touch monitoring/logs/app.log
touch monitoring/logs/error.log
```

### Analytics Setup
```bash
# Configure analytics
cp config/analytics.json.example config/analytics.json
```

## 🎉 Success!

If everything is installed correctly, you should see:

```
🚀 Ultimate Creator Mega Suite Started!
Created by Rajsaraswati Jatav

✅ Python Backend: http://localhost:5000
✅ Node.js Backend: http://localhost:3000
✅ Frontend: http://localhost:8000
✅ Database: Connected
✅ Redis: Connected
✅ All services: Running

Namaskaar Mitron! 🙏
Your mega suite is ready to use!
```

## 📞 Support

Need help? Contact **Rajsaraswati Jatav**:
- 📧 Email: rajsaraswatijatav@gmail.com
- 🌐 GitHub: [@RAJSARASWATI-JATAV](https://github.com/RAJSARASWATI-JATAV)
- 🎥 YouTube: [Rajsaraswati Jatav](https://youtube.com/@rajsaraswatijatav)

---

**Made with ❤️ in India 🇮🇳**  
*Namaskaar Mitron! 🙏*