The playground TF script is used to spin up a singular test environment in AWS.

In this case, I use aws-gimmie-creds command to navigate the Okta api using python. My AWS CLI creds are written to a file in /Users/<Username>/.aws So you may need to run an aws configure to verify you have everything.

After pulling this from the repo, you will need to export your credentials to file (they expire) and do the standard terraform init.



EC2
Elastic IP
VPC
IGW
Subnet
Route Table
Security Group
Route Table Association

As it stands, the only EC2 is a fresh Ubuntu instance with the IP of 10.88.1.88 which we can use to automatically pass WG too. 