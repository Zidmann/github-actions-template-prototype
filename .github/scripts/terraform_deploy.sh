echo "terraform_deploy"
terraform init -backend-config="bucket=$STATE_GCP_BUCKET" -backend-config="prefix=terraform/state/$GITHUB_REPOSITORY/$WORKING_DIRECTORY/${{ needs.init.outputs.branchname }}"
terraform validate -no-color
terraform plan -no-color
terraform apply -auto-approve -var "project_id=${{ secrets.PROJECT_ID }}" -var "bucket_registry=${{ secrets.GCP_BUCKET_REGISTRY }}" ${{ needs.init.outputs.extraterraformvars }}
