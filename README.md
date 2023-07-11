# hp-scan-frontend
CGI script for getting the scanned page as JPG

INSTALLATION

```
cd /opt
sudo git clone https://github.com/gabrys/hp-scan-frontend
sudo useradd hpweb -G lp
sudo chown hpweb:hpweb data
sudo cp hp-scan-frontend.service /etc/systemd/system/hp-scan-frontend.service
sudo systemctl daemon-reload
sudo systemctl enable --now hp-scan-frontend.service
```

Then set up redirection in Apache to 127.0.0.1:9871
