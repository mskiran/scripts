import boto
from boto import ec2
connection=ec2.connect_to_region('us-west-2',profile_name='devacc')
client=connection.client('elb')
bals=client.describe_load_balancers()
for elb in bals['LoadBalancerDescriptions']:
  count=len(elb['Instances'])
  if count == 0:
    print "%s %d" % ( elb['LoadBalancerName'], count)
