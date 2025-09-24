/**
 * Ultimate Creator Mega Suite - Node.js Server
 * Created by Rajsaraswati Jatav
 * 
 * Main server for handling real-time features, WebSocket connections,
 * and serving the frontend application.
 */

const express = require('express');
const http = require('http');
const socketIo = require('socket.io');
const cors = require('cors');
const path = require('path');
const fs = require('fs');

// Initialize Express app
const app = express();
const server = http.createServer(app);
const io = socketIo(server, {
    cors: {
        origin: "*",
        methods: ["GET", "POST"]
    }
});

// Middleware
app.use(cors());
app.use(express.json({ limit: '100mb' }));
app.use(express.urlencoded({ extended: true, limit: '100mb' }));

// Serve static files
app.use('/audio', express.static(path.join(__dirname, '../../../audio')));
app.use('/visuals', express.static(path.join(__dirname, '../../../visuals')));
app.use('/branding', express.static(path.join(__dirname, '../../../branding')));
app.use('/', express.static(path.join(__dirname, '../../frontend')));

// Configuration
const PORT = process.env.PORT || 3000;
const HOST = process.env.HOST || '0.0.0.0';

// Logging function
const log = (message, level = 'INFO') => {
    const timestamp = new Date().toISOString();
    const logMessage = `${timestamp} - ${level} - ${message}`;
    console.log(logMessage);
    
    // Write to log file
    const logDir = path.join(__dirname, '../../../monitoring/logs');
    if (!fs.existsSync(logDir)) {
        fs.mkdirSync(logDir, { recursive: true });
    }
    fs.appendFileSync(path.join(logDir, 'node-app.log'), logMessage + '\n');
};

// Routes
app.get('/', (req, res) => {
    res.json({
        message: "🌟 Ultimate Creator Mega Suite - Node.js Backend",
        created_by: "Rajsaraswati Jatav",
        version: "1.0.0",
        status: "active",
        features: [
            "🎨 Real-time Content Creation",
            "🔊 Audio Streaming",
            "🎬 Video Processing",
            "📱 WebSocket Support",
            "🚀 High Performance"
        ],
        namaskaar: "Namaskaar Mitron! 🙏"
    });
});

app.get('/health', (req, res) => {
    res.json({
        status: "healthy",
        timestamp: new Date().toISOString(),
        uptime: process.uptime(),
        memory: process.memoryUsage(),
        services: {
            nodejs_backend: "running",
            websocket: "active",
            static_files: "serving"
        }
    });
});

// API Routes
app.get('/api/features', (req, res) => {
    res.json({
        audio_library: {
            sound_effects: "200+",
            music_tracks: "100+",
            voice_overs: "Hindi & English"
        },
        visual_effects: {
            animations: "150+",
            transitions: "50+",
            particles: "25+"
        },
        development_tools: {
            automation: "25+",
            testing: "Comprehensive",
            deployment: "Docker Ready"
        },
        creator: "Rajsaraswati Jatav"
    });
});

app.get('/api/stats', (req, res) => {
    res.json({
        total_components: "248+",
        total_files: "172",
        total_folders: "76",
        programming_languages: ["JavaScript", "Python", "CSS", "Shell", "HTML"],
        supported_platforms: ["Windows", "macOS", "Linux", "Android", "iOS"],
        created_by: "Rajsaraswati Jatav"
    });
});

// WebSocket handling
io.on('connection', (socket) => {
    log(`New client connected: ${socket.id}`);
    
    // Send welcome message
    socket.emit('welcome', {
        message: "Welcome to Ultimate Creator Mega Suite!",
        created_by: "Rajsaraswati Jatav",
        greeting: "Namaskaar Mitron! 🙏"
    });
    
    // Handle audio play requests
    socket.on('play-audio', (data) => {
        log(`Audio requested: ${data.file}`);
        socket.emit('audio-status', {
            file: data.file,
            status: 'playing',
            message: 'Audio effect started'
        });
    });
    
    // Handle visual effect requests
    socket.on('play-visual', (data) => {
        log(`Visual effect requested: ${data.effect}`);
        socket.emit('visual-status', {
            effect: data.effect,
            status: 'playing',
            message: 'Visual effect started'
        });
    });
    
    // Handle file upload progress
    socket.on('upload-progress', (data) => {
        socket.emit('upload-status', {
            progress: data.progress,
            filename: data.filename,
            status: data.progress === 100 ? 'completed' : 'uploading'
        });
    });
    
    socket.on('disconnect', () => {
        log(`Client disconnected: ${socket.id}`);
    });
});

// Error handling
app.use((err, req, res, next) => {
    log(`Error: ${err.message}`, 'ERROR');
    res.status(500).json({
        error: 'Internal Server Error',
        message: 'Kuch technical issue hai, jald fix kar denge',
        created_by: 'Rajsaraswati Jatav'
    });
});

// 404 handler
app.use((req, res) => {
    res.status(404).json({
        error: 'Not Found',
        message: 'Ye endpoint available nahi hai',
        created_by: 'Rajsaraswati Jatav'
    });
});

// Start server
server.listen(PORT, HOST, () => {
    log('🚀 Ultimate Creator Mega Suite Node.js Server Started!');
    log('Created by Rajsaraswati Jatav');
    log(`Server running on http://${HOST}:${PORT}`);
    log('Namaskaar Mitron! 🙏');
    
    // Create necessary directories
    const dirs = ['uploads', 'temp', 'monitoring/logs'];
    dirs.forEach(dir => {
        const fullPath = path.join(__dirname, '../../../', dir);
        if (!fs.existsSync(fullPath)) {
            fs.mkdirSync(fullPath, { recursive: true });
        }
    });
});

// Graceful shutdown
process.on('SIGTERM', () => {
    log('SIGTERM received, shutting down gracefully');
    server.close(() => {
        log('Process terminated');
    });
});

process.on('SIGINT', () => {
    log('SIGINT received, shutting down gracefully');
    server.close(() => {
        log('Process terminated');
    });
});