Create SSH Key-pair for EC2 Instance
Create VPC Security Group for RDS and EC2 Instance
Create RDS Instance with MYSQL Engine Type
Create Instance Profile for Vault Auth IAM Role
Create EC2 Instance for Public Jump and Private App


AWS RDS Endpoint:  mysql01.c9megm26srja.ap-southeast-1.rds.amazonaws.com:3306

For example:
    mysql -h mysql01.c9megm26srja.ap-southeast-1.rds.amazonaws.com -P 3306 -u admin -p

Jump Server IP (public):  54.169.207.0
Jump Server IP (private): 10.10.1.155

For example:
   ssh -i private.key ubuntu@54.169.207.0

APP Client IP (private): 10.10.4.207

For example:
   ssh -i private.key ubuntu@10.10.4.207

APP Approle Client IP (private): 10.10.5.82

For example:
   ssh -i private.key ubuntu@10.10.5.82

APP Client IAM Role ARN: arn:aws:iam::339713018668:role/ec2-vault-client-role

