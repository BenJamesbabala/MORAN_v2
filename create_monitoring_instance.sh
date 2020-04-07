aws ec2 run-instances \
  --image-id ami-0db78afd3d150fc18 \
  --security-group-ids sg-089014133d0ab57ee \
  --count 1 \
  --instance-type m4.xlarge \
  --key-name pf-dev-seoul2 \
  --query "Instances[0].InstanceId"
