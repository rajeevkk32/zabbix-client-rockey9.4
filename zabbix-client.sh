zabbix client install centos 9 stream / rockey linux 9.4


dnf remove zabbix* -y

cat /etc/yum.repos.d/epel.repo

sudo sed -i '/\[epel\]/a excludepkgs=zabbix*' /etc/yum.repos.d/epel.repo 

cat /etc/yum.repos.d/epel.repo


rpm -Uvh https://repo.zabbix.com/zabbix/6.0/rhel/9/x86_64/zabbix-release-6.0-4.el9.noarch.rpm

dnf clean all

dnf install zabbix-agent -y

systemctl restart zabbix-agent
systemctl enable zabbix-agent

cat /etc/zabbix/zabbix_agentd.conf | grep Server=
sed -i "s/Server=127.0.0.1.*$/Server=192.168.1.11/" /etc/zabbix/zabbix_agentd.conf
cat /etc/zabbix/zabbix_agentd.conf | grep Server=

echo "tcp|in|d=10050|s==192.168.1.11 # zbx Proxy"  >> /etc/csf/csf.allow
cat  /etc/csf/csf.allow
csf -r

systemctl restart zabbix-agent
sudo systemctl status zabbix-agent

