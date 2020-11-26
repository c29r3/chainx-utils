#!/bin/bash

mkdir /root/chainx; \
wget -O /root/go/bin/chainx https://github.com/chainx-org/ChainX/releases/download/v2.0.1/chainx-v2.0.1-ubuntu-18.04-x86_64-unknown-linux-gnu; \
chmod u+x /root/go/bin/chainx; \
curl -s https://raw.githubusercontent.com/c29r3/chainx-utils/main/chainx.service > /root/chainx/chainx.service; \
echo -e "#!/bin/bash\n/root/go/bin/chainx --chain=mainnet --validator --name $(cat /root/chainx/acc.txt)" > /root/chainx/start.sh; \
chmod u+x /root/chainx/start.sh; \
ln -sf /root/chainx/chainx.service /etc/systemd/system/; \
rm -rf /root/.local/share/chainx; \
systemctl daemon-reload; \
systemctl enable chainx; \
systemctl start chainx; \
systemctl status chainx
