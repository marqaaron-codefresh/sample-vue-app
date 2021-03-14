# Build Related Arguments
webServer=nginx
version=local-docker

# Local Environment Related Arguments
localPort=8082

help:
	@echo "Makefile Arguments:"
	@echo ""
	@echo "Build Related Arguments:"
	@echo "webServer (Default 'nginx'. Accepts only 'nginx')"
	@echo "version (Default 'local-docker'. Production format 'v0.0.0')"
	@echo ""
	@echo "Local Environment Related Arguments:"
	@echo "localPort (Default '8082')"
	@echo ""
	@echo "Make Commands:"
	@echo "build-local (Builds Docker Image locally for development)"
	@echo "run-local (Runs Docker Image locally for development)"


build-local:
	docker build \
	--build-arg WEB_SERVER=${webServer} \
	--build-arg VERSION=${version} \
	-t codefresh-assessment \
	.

run-local:
	docker run -it -p ${localPort}:8082 \
    --rm \
    --name codefresh-assessment \
    codefresh-assessment
