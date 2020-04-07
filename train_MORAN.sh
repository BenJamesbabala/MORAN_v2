CUDA_VISIBLE_DEVICES=0,1,2,3;
python main.py \
	--train_nips /dltraining/datasets/IIIT5K/lmdb \
	--valroot /dltraining/datasets/icdar/lmdb \
	--workers 16 \
	--batchSize 64 \
	--niter 100 \
	--lr 0.001 \
	--cuda \
	--experiment /dltraining/checkpoints/icdar \
	--displayInterval 100 \
	--valInterval 1000 \
	--saveInterval 40000 \
	--adadelta \
	--BidirDecoder