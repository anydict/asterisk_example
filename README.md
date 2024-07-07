# asterisk_example
Scratches for a quick launch of asterisk

### Asterisk CHAN_SIP
Link to the dockerhub image Asterisk 20.8.1 on Ubuntu 22.04 with CHAN_SIP:<br>
https://hub.docker.com/r/anydict/asterisk20ubuntu22


Easy way for run docker image:
<code>bash docker_chan_sip/docker_run_asterisk_chan_sip.sh 0</code>

Put configs in the directory:<br>
<code>cp config_chan_sip/* /etc/asterisk_docker-0/</code><br>
<code>docker restart asterisk_docker-0</code>

### Asterisk PJSIP
Link to the dockerhub image Asterisk 20.8.1 on Ubuntu 22.04 with PJSIP:<br>
https://hub.docker.com/r/anydict/asterisk20ubuntu22pjsip


Easy way for run docker image:
<code>bash docker_pjsip/docker_run_asterisk_pjsip.sh 0</code>

Put configs in the directory:<br>
<code>cp config_pjsip/* /etc/asterisk_docker_pjsip-0/</code><br>
<code>docker restart asterisk_docker_pjsip-0</code>
