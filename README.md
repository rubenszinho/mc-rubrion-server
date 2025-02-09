# 🛠️ Minecraft Server (Dockerized)
A fully automated **Minecraft Server** setup using **Docker + Docker Compose**.

## 🚀 Quick Start
1. **Install Docker**
   ```bash
   curl -fsSL https://get.docker.com -o get-docker.sh && sudo bash get-docker.sh
   ```

2. **Clone the repo & setup**
   ```bash
   git clone https://github.com/yourusername/mc-server-cli.git ~/minecraft
   cd ~/minecraft
   chmod +x mc-cli && ./mc-cli install
   ```

3. **Start the server**
   ```bash
   mc-cli start
   ```

4. **Stop or restart**
   ```bash
   mc-cli stop
   mc-cli restart
   ```

## 📌 Features
- **Auto-restarting Minecraft Server**
- **Dockerized setup**
- **Supports Paper, Spigot, Forge, Fabric**
- **Easy backup & restore**
