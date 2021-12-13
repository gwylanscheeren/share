mqttfile=/etc/mosquitto/conf.d/mosquitto.conf
sudo touch $mqttfile
sudo chmod 666 $mqttfile
echo 'allow_anonymous false' >> $mqttfile
echo 'password_file /etc/mosquitto/pwfile' >> $mqttfile

# add to home Assistant configuration file:
hafile=/home/homeassistant/.homeassistant/configuration.yaml
printf '\n' >> $hafile
echo 'mqtt:' >> $hafile
echo '  broker: localhost' >> $hafile
echo '  username: !secret mqtt_user' >> $hafile
echo '  password: !secret mqtt_pass' >> $hafile
echo '  discovery: true' >> $hafile
echo '  discovery_prefix: homeassistant' >> $hafile
