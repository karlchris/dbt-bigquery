USER := `whoami | tr . _`
GCP_AUTH := ${HOME}/.config/gcloud


build-dbt:
	@echo "Building dbt image"
	@docker build -t dbt .

run-dbt:
	@echo "Running dbt in container"
	@docker run \
		-e DESTINATION=${USER} \
		-e DBT_ENV=dev \
		--rm \
		-v ${GCP_AUTH}:/creds -it \
		--entrypoint /bin/bash \
		-p 8082:8080 \
		dbt
