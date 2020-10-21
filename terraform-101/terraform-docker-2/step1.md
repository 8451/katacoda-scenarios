A Terraform configuration is a series of code blocks that define your intended infrastructure. You'll run the `terraform` command against this file to create an Nginx webserver and view the default Nginx web page.


## Check Docker images and running containers

First, run the below commands to see what Docker images are available and what Docker containers are currently running.

`docker images`{{execute}}

`docker ps`{{execute}}

Notice that there are no nginx images or containers in place.


## Terraform init

All Terraform workflows start with the `init` command. Terraform searches the configuration for both direct and indirect references to providers (such as Docker). Terraform then attempts to load the required plugins.

`terraform init`{{execute}}


## Terraform plan

Run a Terraform plan now to preview what expected actions would be taken.

`terraform plan`{{execute}}

Notice what it will plan to stand up...

*Plan: 2 to add, 0 to change, 0 to destroy.*


## Terraform apply

Now provision the webserver by running `apply`.

`terraform apply -auto-approve`{{execute}}

It may take up to 30 seconds - a message will display confirmation that it succeeded.

Should get the result...

*Apply complete! Resources: 2 added, 0 changed, 0 destroyed.*


## Verify Docker images and running containers

Inspect what Docker images are available and running now.

`docker images`{{execute}}

`docker ps`{{execute}}

Should see an nginx image as well as a running nginx container.


## Apply again (same Terraform config)

Now apply the Terraform config again.

`terraform apply -auto-approve`{{execute}}

Should get the result...

*Apply complete! Resources: 0 added, 0 changed, 0 destroyed.*

Visit this URL to view the default Nginx web page which is now live:

- [Nginx index page](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/)

Should see the default "Welcome to nginx!" page.


## Modify the Terraform config

Run the commands below to update the main.tf a bit:

`cp -pv main.tf{,.orig}`{{execute}}

`egrep "\"hello from TF nginx\"$" main.tf || sed -i '/^  }/a\ upload {\n    content = "hello from TF nginx"\n    file = "/usr/share/nginx/html/index.html"\n  }' main.tf`{{execute}}

`diff -W $(tput cols) --side-by-side main.tf{.orig,}`{{execute}}

Should see a new section called "upload" was added to the config.


## Run the Terraform plan and apply (using modified config)

Now apply the terraform config again.

`terraform plan`{{execute}}

`terraform apply -auto-approve`{{execute}}

Should get the result...

Apply complete! Resources: 1 added, 0 changed, 1 destroyed.

Visit this URL to view the default Nginx web page:

- [Nginx index page](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/)

Should see an updated "hello from TF nginx" message on the page now (you may have to refresh the browser).


## Run Terraform apply yet again (no changes)

How about running Terraform apply again, what will happen?

`terraform apply -auto-approve`{{execute}}

Should get the result

*Apply complete! Resources: 0 added, 0 changed, 0 destroyed.*


## Modify Docker containers outside of Terraform

Without TF involved, manually kill the nginx container:

`docker stop tutorial`{{execute}}

`docker ps`{{execute}}

`docker images`{{execute}}

Should not show any nginx containers running but the image is still present.


## Re-run Terraform apply (since container state change) and verify

How about running Terraform apply now, what will happen?

`terraform apply -auto-approve`{{execute}}

`docker ps`{{execute}}

`docker images`{{execute}}

Should get the result...

*Apply complete! Resources: 1 added, 0 changed, 0 destroyed.*

The Docker image wasn't touched but container was stood back up.


## Terraform Destroy 

To remove the Nginx webserver as defined in `main.tf`, run the destroy command.

`terraform destroy -auto-approve`{{execute}}


## Conclusion

Hopefully now you have a good understanding of Terraform basics!

Continue learning at [HashiCorp Learn](https://learn.hashicorp.com/terraform) and the [Terraform API documentation](https://www.terraform.io/) or discuss with others on the [Terraform forum](https://discuss.hashicorp.com/c/terraform-core/27).
