#!/bin/bash
# Ultimate Creator Mega Suite Setup Script
# Created by Rajsaraswati Jatav

echo "🚀 Starting Ultimate Creator Mega Suite Setup..."
echo "Created by Rajsaraswati Jatav"
echo "================================================"

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

# Check if running as root
if [ "$EUID" -eq 0 ]; then
    print_warning "Running as root. Some operations may require non-root user."
fi

# Check system requirements
print_status "Checking system requirements..."

# Check Python
if command -v python3 &> /dev/null; then
    PYTHON_VERSION=$(python3 --version | cut -d' ' -f2)
    print_success "Python 3 found: $PYTHON_VERSION"
else
    print_error "Python 3 not found. Please install Python 3.8 or higher."
    exit 1
fi

# Check Node.js
if command -v node &> /dev/null; then
    NODE_VERSION=$(node --version)
    print_success "Node.js found: $NODE_VERSION"
else
    print_warning "Node.js not found. Installing Node.js..."
    curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
    sudo apt-get install -y nodejs
fi

# Check FFmpeg
if command -v ffmpeg &> /dev/null; then
    FFMPEG_VERSION=$(ffmpeg -version | head -n1 | cut -d' ' -f3)
    print_success "FFmpeg found: $FFMPEG_VERSION"
else
    print_warning "FFmpeg not found. Installing FFmpeg..."
    sudo apt-get update
    sudo apt-get install -y ffmpeg
fi

# Create directory structure
print_status "Creating directory structure..."
mkdir -p audio/sound-effects/{ui-sounds,transition-sounds,ambient}
mkdir -p audio/music
mkdir -p audio/voice-overs/instructions
mkdir -p visuals/animations/{loading-spinners,transitions,particles}
mkdir -p visuals/icons/{feature-icons,social-icons,ui-icons}
mkdir -p visuals/backgrounds/{gradients,patterns,videos}
mkdir -p visuals/overlays/{frames,borders,watermarks}
mkdir -p branding/logos
mkdir -p branding/colors
mkdir -p branding/fonts
mkdir -p branding/templates/website-template
mkdir -p src/frontend/{html,css,js}
mkdir -p src/backend/{python,node,php}
mkdir -p src/mobile/{android,flutter}
mkdir -p database/{schemas,migrations,seeders}
mkdir -p config/environment
mkdir -p tests/{unit,integration,e2e,fixtures}
mkdir -p deployment/{docker,kubernetes,terraform,scripts}
mkdir -p plugins/{browser-extension,wordpress,vscode}
mkdir -p security/{ssl,auth,encryption}
mkdir -p monitoring/{logs,metrics}
mkdir -p resources/{tutorials,examples,presets}
mkdir -p tools/{automation,content-creation,development,analytics}
mkdir -p uploads
mkdir -p temp

print_success "Directory structure created successfully!"

# Install Python dependencies
print_status "Installing Python dependencies..."
if [ -f "requirements.txt" ]; then
    pip3 install --user -r requirements.txt
    print_success "Python dependencies installed!"
else
    print_warning "requirements.txt not found. Creating basic requirements..."
    cat > requirements.txt << EOF
Flask==2.3.2
opencv-python==4.8.0.76
Pillow==10.0.0
requests==2.31.0
python-dotenv==1.0.0
EOF
    pip3 install --user -r requirements.txt
fi

# Install Node.js dependencies
print_status "Installing Node.js dependencies..."
if [ -f "package.json" ]; then
    npm install
    print_success "Node.js dependencies installed!"
else
    print_warning "package.json not found. Initializing npm project..."
    npm init -y
    npm install express cors body-parser multer
fi

# Set executable permissions
print_status "Setting executable permissions..."
find tools/ -name "*.sh" -type f -exec chmod +x {} \;
find tools/ -name "*.py" -type f -exec chmod +x {} \;

# Create sample configuration files
print_status "Creating configuration files..."

# App config
cat > config/app.json << EOF
{
  "app": {
    "name": "Ultimate Creator Mega Suite",
    "version": "1.0.0",
    "author": "Rajsaraswati Jatav",
    "port": 3000,
    "host": "localhost"
  },
  "features": {
    "audio_effects": true,
    "visual_effects": true,
    "branding": true,
    "social_media": true,
    "analytics": true
  }
}
EOF

# Environment template
cat > config/environment/development.env << EOF
# Ultimate Creator Mega Suite - Development Environment
# Created by Rajsaraswati Jatav

NODE_ENV=development
PORT=3000
DEBUG=true

# Database
DATABASE_URL=mongodb://localhost:27017/ultimate_suite_dev
REDIS_URL=redis://localhost:6379

# API Keys (Replace with your actual keys)
YOUTUBE_API_KEY=your_youtube_api_key_here
INSTAGRAM_API_TOKEN=your_instagram_token_here
TWITTER_API_KEY=your_twitter_api_key_here

# Security
JWT_SECRET=your_super_secret_jwt_key_here
ENCRYPTION_KEY=your_encryption_key_here

# File Upload
MAX_FILE_SIZE=100MB
UPLOAD_DIR=uploads/

# Logging
LOG_LEVEL=debug
LOG_FILE=monitoring/logs/app.log
EOF

# Create sample HTML file
print_status "Creating sample application files..."
cat > src/frontend/html/index.html << EOF
<!DOCTYPE html>
<html lang="hi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ultimate Creator Mega Suite | Rajsaraswati Jatav</title>
    <link rel="stylesheet" href="../css/main.css">
    <link rel="icon" href="../../../branding/logos/favicon.ico">
</head>
<body>
    <div class="container">
        <header>
            <h1>🌟 Ultimate Creator Mega Suite</h1>
            <p>The World's Most Comprehensive Content Creator & Developer Suite</p>
            <p><strong>Created by Rajsaraswati Jatav</strong></p>
        </header>
        
        <main>
            <section class="features">
                <h2>🚀 Mega Features</h2>
                <div class="feature-grid">
                    <div class="feature-card">
                        <h3>🎨 Branding Suite</h3>
                        <p>Complete brand identity tools</p>
                    </div>
                    <div class="feature-card">
                        <h3>🔊 Audio Library</h3>
                        <p>200+ sound effects & music</p>
                    </div>
                    <div class="feature-card">
                        <h3>🎬 Visual Effects</h3>
                        <p>Professional animations & graphics</p>
                    </div>
                    <div class="feature-card">
                        <h3>💻 Source Code</h3>
                        <p>Full-stack application suite</p>
                    </div>
                </div>
            </section>
            
            <section class="cta">
                <h2>🎯 Namaskaar Mitron!</h2>
                <p>Duniya ka sabse bada aur powerful content creation suite ab aapke haath mein!</p>
                <button onclick="playWelcomeSound()">🔊 Welcome Message</button>
            </section>
        </main>
        
        <footer>
            <p>&copy; 2025 Rajsaraswati Jatav. All Rights Reserved.</p>
            <p>Made with ❤️ in India 🇮🇳</p>
        </footer>
    </div>
    
    <script src="../js/app.js"></script>
</body>
</html>
EOF

print_success "Setup completed successfully!"
print_status "🎉 Ultimate Creator Mega Suite is ready to use!"
echo ""
echo "Next steps:"
echo "1. Configure your API keys in config/environment/development.env"
echo "2. Run 'npm start' to start the application"
echo "3. Visit http://localhost:3000 to see your suite in action"
echo ""
print_success "Happy creating! - Rajsaraswati Jatav"