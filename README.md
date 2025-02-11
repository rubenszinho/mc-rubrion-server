# mc-rubrion-server
This repository contains the **server configuration and setup** for running the **Rubrion Minecraft Server**, including **Docker Compose, NGINX reverse proxy, and Cloudflare DNS**.

## **🖥️ Server Overview**
- **OS:** Ubuntu 22.04 LTS  
- **Firewall:** Open ports  
  - `22/tcp` → SSH  
  - `25565/tcp` → Minecraft (filtered via NGINX)  
- **Domain:** `mc.rubrion.com` (managed via Cloudflare)  
- **Reverse Proxy:** NGINX filters and routes raw TCP traffic.  
- **Automation:** Server management via [`mc-rubrion-cli`](https://github.com/rubenszinho/mc-rubrion-cli).

---

## **⚙️ Configuration Details**
### **🔹 Docker Compose**
- **Minecraft Server**: Uses `itzg/minecraft-server`
- **Persistent Storage**: `data/` (world), `mods/` (mod files), `plugins/` (if applicable)
- **Reverse Proxy**: NGINX routes Minecraft traffic securely.

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

## **📦 Managing Mods**
### **Add a Mod**
```bash
mc-rubrion-cli add-mod <URL-to-mod>
mc-rubrion-cli restart
```
_(Downloads and installs the mod, then restarts the server.)_

---

## **💾 Backups & Restoration**
### **Create a Manual Backup**
```bash
mc-rubrion-cli backup
```
_(Copies `mc_server:/data` to the `backups/` folder.)_

### **Schedule Automated Backups (linux only)**
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

## **📌 Notes**
- **Cloudflare helps mitigate DDoS attacks.**  
- **NGINX secures and filters Minecraft traffic.**  
- **Automation tasks are managed via `mc-rubrion-cli`.**  
- **Backups are stored in `backups/` and managed via CLI.**  

---

## 📝 License
Open-sourced under the **GPL-3.0** license. See the [LICENSE](LICENSE) file for details.