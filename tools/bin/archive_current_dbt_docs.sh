#!/bin/bash
trap 'exit' ERR

file_path=gs://$GCS_BUCKET/index.html
result=$(gsutil -q stat $file_path || echo 1)
if [[ $result != 1 ]]; then
  NOW=$(date +%s)
  gsutil mv gs://$GCS_BUCKET/index.html gs://$GCS_BUCKET/ts=$NOW/index.html
  gsutil mv gs://$GCS_BUCKET/catalog.json gs://$GCS_BUCKET/ts=$NOW/catalog.json
  gsutil mv gs://$GCS_BUCKET/manifest.json gs://$GCS_BUCKET/ts=$NOW/manfest.html
else
  echo "dbt docs do not exist"
fi
