# hp-scan-frontend
CGI script for getting the scanned page as JPG

# INSTALLATION

Dependencies:

* Python 3
* aha
* img2pdf
* pdfunite (from poppler-utils)
* hp-scan (from hplip)
* ImageMagick

```
sudo useradd hpweb -G lp
sudo git clone https://github.com/gabrys/hp-scan-frontend /opt/hp-scan-frontend
cd /opt/hp-scan-frontend
sudo chown hpweb:hpweb data
sudo cp hp-scan-frontend.service /etc/systemd/system/hp-scan-frontend.service
sudo systemctl daemon-reload
sudo systemctl enable --now hp-scan-frontend.service
```

Then set up redirection in Apache to 127.0.0.1:9871
