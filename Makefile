# Build Related Arguments
webServer=nginx
version=local-docker
buildType=test

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
	@echo "build-prod (Builds Docker Image locally for production)"



build-local:
	docker build \
	--build-arg WEB_SERVER=${webServer} \
	--build-arg VERSION=${version} \
	--build-arg BUILD_TYPE=${buildType} \
	-t marqaaron/sample-vue-app:${version} \
	.

run-local:
	docker run -it -p ${localPort}:8082 \
    --rm \
    --name sample-vue-app \
    marqaaron/sample-vue-app:${version}

build-prod:
	docker build \
	--build-arg WEB_SERVER=${webServer} \
	--build-arg VERSION=${version} \
	--build-arg BUILD_TYPE=${buildType} \
	-t marqaaron/sample-vue-app:latest \
	-t marqaaron/sample-vue-app:${version} \
	.
