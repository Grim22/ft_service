#!bin/sh

echo "switching to default runlevel..."
openrc default &> /dev/null
echo "starting grafana..."

#il faut lancer "syslog" (outil qui centralise les logs des différentes applications).
#en effet, syslog est défini comme "mode" de log dans le fichier de configuation de init: cf. conf.d/grafana "log mode = syslog"
#Rq: pourtant dans le fichier de configuration "global de grafana" (etc/grafana.ini), log mode par défaut = "console file" (-> marche aussi de mettre "console file à la place de syslog dans conf.d/grafana")
syslogd

# -D: ignore dependendies (dependency = logger, cf etc/conf.d/grafana). Else "ERROR: grafana needs service(s) logger" 
#Rq: logger is installed (part of busybox), yet its not really a service
rc-service grafana start -D &> /dev/null

echo "all set !"
tail -f /dev/null