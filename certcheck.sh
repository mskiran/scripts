export AWS_PROFILE=devacc
for i in `aws elb describe-load-balancers|sed -ne 's/"LoadBalancerName": "\(.*\)",/\1/gp'`; do echo -n "$i "; aws elb describe-load-balancers --load-balancer-name $i|grep  SSLCertificateId;done
