# terraform-aws-workshop

> It's a project to deploy an static website to ec2 instance and publish it to the external network with Route53.

---

## Before you begin

---

* This tutorial assumes you already have an **aws** account set up for your organization.

* Create **key-pairs** in **aws** and download the pem file.

* Install Terraform.

  * Install Terraform in OS X
  
    ```sh
    brew update
    brew install terraform
    ```

---

## Start

### Move the pem file in the folder and customize the "key_name" and "key_path" in [variables.tf](variables.tf)

```sh
cp xxx.pem ./
```

### Initialize to download providers used in the module

```sh
terraform init
```

### Always run plan first

```sh
terraform plan
```

### Provision the infrastructure

```sh
terraform apply
```

---

## Authors

[gitqh](http://gitqh.com)

---

## License

Please read [LICENSE.md](LICENSE.md)