#!/bin/sh

echo "yes" | terraform destroy -var-file="starter.tfvars"