Do you lab work here.

Snippets...

### PCF cli
```
# login
cf login -a <API endpoint>
cf login -a api.run-01.haas-66.pez.pivotal.io --skip-ssl-validation
```

### Concourse CI
```
# download fly cli (concourse is running in bosh-lite)
wget -O ~/bin/fly 'http://10.244.8.2:8080/api/v1/cli?arch=amd64&platform=linux' && chmod +x ~/bin/fly

# login
fly -t concourse-lab login --concourse-url http://10.244.8.2:8080/

# Set pipeline
fly set-pipeline -t concourse-lab -p attendee-service -c ci/pipeline.yml -l ci/private.yml

# trigger job
fly trigger-job -t concourse-lab -j [pipeline]/[task]
```

### Minio Client
```
# Set configuration to Amazon S3. Replace ACCESS_KEY and PRIVATE_ACCESS_KEY with the values for you S3 account
mc config host add s3 https://s3.amazonaws.com ACCESS_KEY PRIVATE_ACCESS_KEY

# Copy a local file to a bucket. Replace BUCKET with your bucket name.
mc cp albums.csv s3/BUCKET/
```
