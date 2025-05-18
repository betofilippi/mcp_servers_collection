#!/bin/bash

# MCP Visual Manager Launcher
# This script starts the gateway and opens the visual interface

echo "🚀 Starting MCP Visual Manager..."
echo ""

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo -e "${RED}❌ Python 3 is not installed${NC}"
    exit 1
fi

# Check if gateway file exists
if [ ! -f "mcp_gateway_simple.py" ]; then
    echo -e "${RED}❌ Gateway file not found${NC}"
    echo "Please run this script from the mcp_servers_collection directory"
    exit 1
fi

# Function to check if port is already in use
check_port() {
    if lsof -Pi :8002 -sTCP:LISTEN -t >/dev/null 2>&1; then
        return 0
    else
        return 1
    fi
}

# Start gateway if not already running
if check_port; then
    echo -e "${BLUE}ℹ️  Gateway is already running on port 8002${NC}"
else
    echo -e "${GREEN}▶️  Starting MCP Gateway...${NC}"
    python3 mcp_gateway_simple.py &
    GATEWAY_PID=$!
    
    # Wait for gateway to start
    echo -n "Waiting for gateway to start"
    for i in {1..10}; do
        if check_port; then
            echo ""
            echo -e "${GREEN}✅ Gateway started successfully!${NC}"
            break
        fi
        echo -n "."
        sleep 1
    done
    
    if ! check_port; then
        echo ""
        echo -e "${RED}❌ Failed to start gateway${NC}"
        exit 1
    fi
fi

# Open visual manager in browser
echo -e "${GREEN}🌐 Opening Visual Manager...${NC}"

# Detect OS and open browser
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    open visual_manager.html
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    if command -v xdg-open &> /dev/null; then
        xdg-open visual_manager.html
    elif command -v gnome-open &> /dev/null; then
        gnome-open visual_manager.html
    else
        echo -e "${BLUE}Please open visual_manager.html in your browser${NC}"
    fi
elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
    # Windows
    start visual_manager.html
else
    echo -e "${BLUE}Please open visual_manager.html in your browser${NC}"
fi

echo ""
echo -e "${GREEN}✨ MCP Visual Manager is ready!${NC}"
echo ""
echo "Gateway URL: http://localhost:8002"
echo "Visual Manager: file://$(pwd)/visual_manager.html"
echo ""
echo -e "${BLUE}Press Ctrl+C to stop the gateway${NC}"

# Wait for user interrupt
if [ ! -z "$GATEWAY_PID" ]; then
    wait $GATEWAY_PID
fi