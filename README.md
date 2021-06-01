# More Than Certified - Terraform
Code from Udemy's [More than Certified in Terraform](https://www.udemy.com/course/terraform-certified/)

## Requirements

### AWS

For the AWS deployment, you should authenticate using [one of the available methods](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

### Terraform Cloud

Login on Terraform Cloud using
```
terraform login
```

### SSH Authentication

You should generate an ssh rsa key using
```
ssh-keygen -t rsa
```
saving with the name `keymtc` with no password and assigning the folder under which you saved the key to the variable `ssh_keys_path` on `terraform.tfvars`

AWS Infrastructure Deployed

![AWS Infrastructure](https://user-images.githubusercontent.com/5351051/120091521-34729b00-c0e2-11eb-9787-15cfdf464342.png)
