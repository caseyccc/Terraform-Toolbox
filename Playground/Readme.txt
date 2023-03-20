The playground TF script is used to spin up a singular test environment in AWS. The use case is to configure a Wireguard tunnel to test functionality and spin down.

With this method, I use aws-gimmie-creds command to navigate the Okta api using python. My AWS CLI creds are written to a file in /Users/<Username>/.aws So you may need to run an aws configure to verify you have everything, as well as region.

After pulling this from the repo, you will need to export your credentials to file (they expire) and do the standard terraform init.


This TF Apply will do the following:

Create an Ubuntu AMI based EC2 
Create an Elastic IP and assign it to this Ubuntu instance
Create a VPC that will host everying
Create an IGW that will allow for browsing to and inside this Ubuntu instance
Create a Subnet inside the VPC 
Create a Route Table to ensure traffic is test routed
Create a Route Table Association
Create a Security Group allowing for SSH access

As it stands, the only EC2 is a fresh Ubuntu instance with the IP of 10.88.1.88 which we can use to automatically pass WG too. 

In Progress:
Remove Hard Coded AMI and opt for Data based so region has no bearing.
Include hardcoded WG Tunnel config using variables.
Prettify code with Variables more.
