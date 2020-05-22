#!bin/sh

openrc default &> /dev/null

#ne marche pas si on lance grafana 'comme d'habitude. Peut être parce qu'il le lance en user=grafana plutot que root ?
#methode: lancer directement le binaire
#tourne au premier plan: pas besoin de tail -f

/usr/sbin/grafana-server --config=/etc/grafana.ini --homepath=/usr/share/grafana
tail -f /dev/null