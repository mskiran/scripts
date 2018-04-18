import boto3
client=boto3.client('elb')
bals=client.describe_load_balancers()
for elb in bals['LoadBalancerDescriptions']:
  count=len(elb['Instances'])
  if count == 0:
    print "%s %d" % ( elb['LoadBalancerName'], count)
