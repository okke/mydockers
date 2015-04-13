default: help

help:
	@echo "Want a shared volume?                    use: make volume"
	@echo "Want a simple linux prompt?              use: make prompt"
	@echo "Want a ruby development environment?     use: make rubydev"
	@echo "Want a node.js development environment?  use: make nodedev"
	@echo "Want a jdk?                              use: make jdk"
	@echo "Want a restx environment?                use: make restx"

rm-containers:
	docker ps -a -q | xargs --no-run-if-empty docker rm

rm-images:
	docker images -q | xargs --no-run-if-empty docker rmi 

clean: rm-containers rm-images

base-image:
	docker build -t "nlcgi/base" images/nlcgi-base/

volume:
	docker create -v /dbshare --name shared-volume nlcgi/base

rubydev-image: base-image 
	docker build -t "nlcgi/rubydev" images/nlcgi-rubydev/

nodedev-image: base-image
	docker build -t "nlcgi/nodedev" images/nlcgi-nodedev/

bespoke-image: nodedev-image
	docker build -t "nlcgi/bespoke" images/nlcgi-bespoke/

docker-prs-image: bespoke-image
	docker build -t "nlcgi/docker-prs" images/nlcgi-docker-prs/

jdk-image: base-image
	docker build -t "nlcgi/jdk" images/nlcgi-jdk

restx-image: jdk-image
	docker build -t "nlcgi/restx" images/nlcgi-restx

redis-srv-image: base-image
	docker build -t "nlcgi/redis-srv" images/nlcgi-redis-srv

redis-cli-image: base-image
	docker build -t "nlcgi/redis-cli" images/nlcgi-redis-cli

restx-example-image: restx-image
	docker build -t "nlcgi/restx-example" images/nlcgi-restx-example

prompt: base-image
	docker run -v /data:/data -it nlcgi/base

rubydev: rubydev-image
	docker run -v /data:/data --volumes-from shared-volume -it nlcgi/rubydev

nodedev: nodedev-image
	docker run -v /data:/data --volumes-from shared-volume -it nlcgi/nodedev

bespoke: bespoke-image
	docker run -v /data:/data -p 8080:8080 --volumes-from shared-volume -it nlcgi/bespoke

docker-prs: docker-prs-image
	docker run -p 8080:8080 nlcgi/docker-prs

jdk: jdk-image
	docker run -v /data:/data -p 8080:8080 -it nlcgi/jdk

restx: restx-image
	docker run -v /data:/data -p 8080:8080 -it nlcgi/restx

restx-example: restx-example-image
	docker run -v /data:/data -p 8080:8080 -it nlcgi/restx-example

restx-unexposed: restx-image
	docker run -v /data:/data -it nlcgi/restx

redis-srv: redis-srv-image
	docker run --name redis -d nlcgi/redis-srv

redis-cli: redis-cli-image
	docker run --link redis:db -it nlcgi/redis-cli

redis-cli-srv: redis-srv redis-cli
	@echo "started a redis server and a redis client"
