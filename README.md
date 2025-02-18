# mc-rubrion-server
This repository contains the **server configuration and setup** for running the **Rubrion Minecraft Server**, including **Docker Compose, NGINX reverse proxy, and Cloudflare DNS**.

## **🖥️ Server Overview**
- **OS:** Ubuntu 24.04 LTS  
- **Firewall:** Open ports  
  - `22/tcp` → SSH  
  - `25565/tcp` → Minecraft (filtered via NGINX)  
- **Domain:** `mc.rubrion.com` (managed via Cloudflare)  
- **Reverse Proxy:** NGINX filters and routes raw TCP traffic.  
- **Automation:** Server management via [`mc-rubrion-cli`](https://github.com/rubenszinho/mc-rubrion-cli).

---

## **⚙️ Configuration Details**
### **🔹 Docker Compose**
- **Minecraft Server**: Uses `GraalVM JDK 21`
- **Persistent Storage**: `data/` (world, configs, critical files)
- **Reverse Proxy**: NGINX routes raw TCP traffic securely.

### **🔹 Cloudflare DNS**
| Type | Name  | Content (Value)       | Proxy Status |
|------|------|----------------------|--------------|
| `A`  | `mc` | `<VM Public IP>`      | `DNS Only`   |

---

## **🔄 Managing the Server**
> All server commands are automated through **[`mc-rubrion-cli`](https://github.com/rubenszinho/mc-rubrion-cli)**.

### **Start, Stop, Restart the Server**
```bash
mc-rubrion-cli start
mc-rubrion-cli stop
mc-rubrion-cli restart
```

### **Check Server Status**
```bash
mc-rubrion-cli status
```
_(Displays CPU, RAM, player count, uptime, etc.)_

---

## **📦 Installing & Updating the Modpack**
> The modpack is extracted manually using `install_server_pack.sh`, ensuring that existing configuration files remain untouched.

### **Extract & Install the Modpack**
```bash
./install_server_pack.sh
```
_(Downloads and extracts the latest modpack while preserving crucial configurations.)_

---

## **📦 Managing Mods**
> Mods are managed manually by placing them in `/data/mods/` and restarting the container.

### **Add a Mod**
```bash
cp <mod-file>.jar ./data/mods/
docker restart mc_server
```
_(Manually adds a mod and restarts the server.)_

---

## **💾 Backups & Restoration**
### **Create a Manual Backup**
```bash
mc-rubrion-cli backup
```
_(Copies `mc_server:/data` to the `backups/` folder.)_

### **Schedule Automated Backups (Linux Only)**
```bash
mc-rubrion-cli schedule-backup "0 * * * *"
```
_(Creates a cron job to back up the server automatically.)_

### **Restore a Backup**
```bash
mc-rubrion-cli restore-backup <backup-file>
```
_(Restores a previous world backup.)_

---

## 📝 License
Open-sourced under the **GPL-3.0** license. See the [LICENSE](LICENSE) file for details.
