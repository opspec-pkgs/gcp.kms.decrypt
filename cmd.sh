#!/bin/sh

set -e

gcloud auth activate-service-account --key-file=/keyFile


kmsDecryptCmd="gcloud kms decrypt --ciphertext-file /ciphertextFile --plaintext-file /plaintextFile"

if [ "$key" != " " ]; then
  kmsDecryptCmd=$(printf "%s --key %s" "$kmsDecryptCmd" "$key")
fi
if [ "$keyring" != " " ]; then
  kmsDecryptCmd=$(printf "%s --keyring %s" "$kmsDecryptCmd" "$keyring")
fi
if [ "$location" != " " ]; then
  kmsDecryptCmd=$(printf "%s --location %s" "$kmsDecryptCmd" "$location")
fi

eval "$kmsDecryptCmd"