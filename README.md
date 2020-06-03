<h1>ft_service</h1>
<h2>Guidelines</h2>
<p>This is a System Administration and Networking project on school 42 curses</p>
<p>The project consists of setting up an infrastructure of different services, using Kubernetes <br />You will need to set up a multi-service cluster.<br />Each service will have to run in a dedicated container.<br />Containers have to be build using Alpine Linux.<br />You will have to build yourself the images that you will use. It is forbidden to take<br />already build images.</p>
<p>You will also have to set up:</p>
<p style="padding-left: 30px;">&bull; The Kubernetes web dashboard. This will help you manage your cluster.</p>
<p style="padding-left: 30px;">&bull; The Ingress Controller which manages the external access of your services. The<br />Ingress Controller will redirect to your Nginx container.</p>
<p style="padding-left: 30px;">&bull; A Nginx server listening on ports 80 and 443.</p>
<p style="padding-left: 30px;">&bull; A FTPS server listening on port 21.</p>
<p style="padding-left: 30px;">&bull; A WordPress website listening on port 5050, which will work with a MySQL<br />database. Both services have to run in separate containers. The WordPress website<br />will have several users and an administrator.</p>
<p style="padding-left: 30px;">&bull; Phpmyadmin, listening on port 5000 and linked with the MySQL database.</p>
<p style="padding-left: 30px;">&bull; A grafana platform, listening on port 3000, linked with an influxDB database.<br />Grafana will be monitoring all your containers. You must create one dashboard<br />per service. InfluxDB and grafana will be in two distincts containers.</p>
<p style="padding-left: 30px;">&bull; In case of a crash or stop of one of the two database containers, you will have to<br />make shure the data persist.</p>
<p style="padding-left: 30px;">&bull; You must be able to access the Nginx container by logging into SSH.</p>
<p style="padding-left: 30px;">&bull; All your containers must restart in case of a crash or stop</p>
<h2>Tips</h2>
<h4>Kubernetes vs docker:</h4>
<p style="padding-left: 30px;">- Kub: orchestration tool vs. Docker: "containerization" tool</p>
<p style="padding-left: 30px;">- Kub can work with other cont. tool, such as rtk</p>
<p style="padding-left: 30px;">- Docker has developed its own orchestration tool: Docker Swarm</p>
<h4>Kubernetes vs docker compose:</h4>
<p style="padding-left: 30px;">- Both allow to manage multiple containers</p>
<p style="padding-left: 30px;">- With docker-compose, all containers run on the same hosts</p>
<p style="padding-left: 30px;">- With Kub, you can run containers on several hosts -&gt; split traffic accross hosts</p>
<p><strong>Minikube</strong>: deploys a simple cluster containing only one node (on a virtual machine)</p>
<p><strong>Cluster</strong> &gt; Nodes (hosts) &gt; Pods (applications) &gt; Container(s)</p>
<p><strong>Deployment</strong>: tool to create and manage (update, replicate...) a pod</p>
<p><strong>Services</strong>: way to access a set of pods. decouples the application from their pod's IP address (as pods can die or replicate...):</p>
<p style="padding-left: 30px;">- Cluster IP: access via the service IP + Port that you want to join. Only internal access: from within the container</p>
<p style="padding-left: 30px;">- NodePort: adds an external access to the service: via Node (host) IP address + specific port&nbsp;</p>
<p><strong>Ingress vs Serice:</strong></p>
<p style="padding-left: 30px;">- With services, access via Port number. 1 application = 1 port number. ex: HOST_IP:5500</p>
<p style="padding-left: 30px;">- With ingress, no port to specify. Sets up a reverse proxy, so that you can access your service via: HOST_IP/service_name</p>
<p><strong>Proxy vs reverse proxy:</strong></p>
<p style="padding-left: 30px;">- proxy: several clients -&gt; proxy -&gt; server</p>
<p style="padding-left: 30px;">- useful for filtering, cache, anonymity...</p>
<p style="padding-left: 30px;">- reverse proxy: client -&gt; reverse proxy -&gt; several ("backend") servers</p>
<p style="padding-left: 30px;">- useful for load balancing, isolating internal traffic...</p>
<p style="padding-left: 30px;">- nginx can be used as a reverse proxy</p>
<p><strong>Use docker on Minikube:&nbsp;</strong>when using minikube, two dockers instances are running: "local/normal" docker and Minikube's docker. First you need to set docker to Minikube docker:&nbsp;<em>eval $(minikube docker-env)</em></p>
<h4>Kubectl commands:</h4>
<p style="padding-left: 30px;">- kubectl get (pods/services/deployments...)</p>
<p style="padding-left: 30px;">- kubectl describe&nbsp;(pods/services/deployments...)</p>
<p style="padding-left: 30px;">- kubectl rollout restart deployment/[Nom du deployment] --&gt; updates the container with the latest image</p>
<p><strong>Kub. "persitent volumes":&nbsp;</strong>will live as long as the cluster lives (usage: if you want a database to persist even when the application goes down)</p>
<h4>TIG:</h4>
<p>- Telegraf: gathers and aggregates datas (CPU data, docker data...)</p>
<p>- Influxdb: popular "time series" database.Stores data sent by telegraf</p>
<p>- Grafana: vizualisation software, connected to influxdb</p>
<p><strong>Alpine and OPENRC</strong></p>
<p>- light Linux distribution. Works with musl libc (&lt;&gt; glibc) + busybox (all major linux fonctionalities in one binary) and apk (&lt;&gt; apt)</p>
<p>- used openRC as its init system (&lt;&gt; systemd in ubuntu). to start a service: 1) openrc default (set the runlevel to default) 2) rc-service service_name start</p>
<p>- script launched when starting the service are located at etc/init.d</p>
<p>- configuration files for those scripts located at etc/conf.d</p>
<h4>FTP:</h4>
<p>- like HTTP, FTP is a protocol to transfer data (upload/download) between a client and a server</p>
<p>- not very secured (user/password are not crypted) -&gt; sercured with SSL = FTPS or with SSH = SFTP</p>
<h4>&nbsp;</h4>
<h2>Useful links</h2>
<h3>Alpine</h3>
<p><a href="https://wiki.alpinelinux.org/wiki/Alpine_Linux_Init_System">https://wiki.alpinelinux.org/wiki/Alpine_Linux_Init_System</a></p>
<p><a href="https://docs.alpinelinux.org/user-handbook/0.1a/Working/openrc.html">https://docs.alpinelinux.org/user-handbook/0.1a/Working/openrc.html</a></p>
<p><a href="https://docs.alpinelinux.org/user-handbook/0.1a/Working/apk.html">https://docs.alpinelinux.org/user-handbook/0.1a/Working/apk.html</a></p>
<p><a href="https://www.cyberciti.biz/faq/how-to-enable-and-start-services-on-alpine-linux/">https://www.cyberciti.biz/faq/how-to-enable-and-start-services-on-alpine-linux/</a></p>
<p><a href="https://www.osetc.com/en/how-to-start-stop-restart-services-on-alpine-linux.html">https://www.osetc.com/en/how-to-start-stop-restart-services-on-alpine-linux.html</a></p>
<h3>Kubernetes</h3>
<p><a href="https://medium.com/bb-tutorials-and-thoughts/how-to-use-own-local-doker-images-with-minikube-2c1ed0b0968">https://medium.com/bb-tutorials-and-thoughts/how-to-use-own-local-doker-images-with-minikube-2c1ed0b0968</a></p>
<p><a href="https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/">https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/</a></p>
<p><a href="https://medium.com/kubernetes-tutorials/introduction-to-kubernetes-monitoring-architecture-98a265e0917d">https://medium.com/kubernetes-tutorials/introduction-to-kubernetes-monitoring-architecture-98a265e0917d</a></p>
<h3>Nginx</h3>
<p><a href="http://nginx.org/en/docs/beginners_guide.html">http://nginx.org/en/docs/beginners_guide.html</a></p>
<p><a href="https://docs.nginx.com/nginx/admin-guide/web-server/serving-static-content/">https://docs.nginx.com/nginx/admin-guide/web-server/serving-static-content/</a></p>
<p><a href="https://docs.nginx.com/nginx/admin-guide/web-server/reverse-proxy/">https://docs.nginx.com/nginx/admin-guide/web-server/reverse-proxy/</a></p>
<p><a href="https://www.digitalocean.com/community/tutorials/understanding-nginx-server-and-location-block-selection-algorithms">https://www.digitalocean.com/community/tutorials/understanding-nginx-server-and-location-block-selection-algorithms</a></p>
<p><a href="https://stackoverflow.com/questions/17798457/how-can-i-make-this-try-files-directive-work">https://stackoverflow.com/questions/17798457/how-can-i-make-this-try-files-directive-work</a></p>
<h3>FTPS</h3>
<p><a href="https://opensourceforu.com/2015/03/set-up-an-ftps-server-in-linux/">https://opensourceforu.com/2015/03/set-up-an-ftps-server-in-linux/</a></p>
<h3>SSH</h3>
<p><a href="https://phoenixnap.com/kb/ssh-to-connect-to-remote-server-linux-or-windows">https://phoenixnap.com/kb/ssh-to-connect-to-remote-server-linux-or-windows</a></p>
<h3>Docker</h3>
<p><a href="https://stackoverflow.com/questions/7248031/meaning-of-dollar-question-mark-in-shell-scripts">https://stackoverflow.com/questions/7248031/meaning-of-dollar-question-mark-in-shell-scripts</a></p>
<h3>Influxdb</h3>
<h3>Mysql</h3>
<h3>Phpmyadmin</h3>
