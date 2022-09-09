#!/bin/bash
trap 'exit' ERR

file_path=gs://$GCS_BUCKET/index.html
result=$(gsutil -q stat $file_path || echo 1)
if [[ $result != 1 ]]; then
  now=$(date +%s )
  echo "File exists $now"
else
  echo "File does not exist"
fi
