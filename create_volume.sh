VOLUME_ID=$(aws ec2 create-volume \
  --size 100 \
  --region ap-northeast-2 \
  --availability-zone ap-northeast-2c \
  --volume-type gp2 \
  --output text \
  --query 'VolumeId' \
  --tag-specifications 'ResourceType=volume, Tags=[{Key=Name,Value=Recognition-datasets-checkpoints}]')
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

sleep 10;

aws ec2 attach-volume \
    --volume-id "${VOLUME_ID}" \
    --instance-id "${INSTANCE_ID}" \
    --device /dev/sdf

sudo mkdir /dltraining
sudo mkfs -t xfs /dev/xvdf
sudo mount /dev/xvdf /dltraining
sudo chown -R ec2-user: /dltraining/
cd /dltraining
mkdir datasets
mkdir checkpoints