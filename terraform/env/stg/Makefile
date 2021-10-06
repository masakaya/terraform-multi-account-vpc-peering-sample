BACKEND_BUCKET := "masakaya-tfstate-stg"
REGION := "ap-northeast-1"
PROFILE := "masakaya-stg"

tf-backend:
	aws --profile $(PROFILE) --region $(REGION) \
	s3api create-bucket \
  	--create-bucket-configuration LocationConstraint=$(REGION) \
  	--bucket $(BACKEND_BUCKET) && \
	aws --profile $(PROFILE) --region $(REGION) \
	s3api put-bucket-versioning \
  	--bucket $(BACKEND_BUCKET) \
  	--versioning-configuration Status=Enabled && \
	aws --profile $(PROFILE) --region $(REGION) \
	s3api put-bucket-encryption \
	--bucket $(BACKEND_BUCKET) \
	--server-side-encryption-configuration '{"Rules": [{"ApplyServerSideEncryptionByDefault": {"SSEAlgorithm": "AES256"}}]}'