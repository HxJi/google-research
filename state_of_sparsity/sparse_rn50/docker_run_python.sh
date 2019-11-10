#!/bin/sh

python /home/hj14/hxji1997/google-research/state_of_sparsity/sparse_rn50/imagenet_train_eval.py \
        --steps_per_checkpoint=1251  \
        --keep_checkpoint_max=90  \
        --data_directory=/home/hj14/dataset/tf_records      \
        --resnet_depth=50         \
        --label_smoothing=0.1     \
        --train_steps=112590      \
        --train_batch_size=1024    \
        --eval_batch_size=1000  \
        --steps_per_eval=1251    \
        --use_tpu=true          \
        --num_cores=8           \
        --output_dir=/home/hj14/checkpoints    \
        --mode=train_and_eval             \
        --end_sparsity=0.9        \
        --sparsity_begin_step=40000   \
        --sparsity_end_step=76000    \
        --pruning_frequency=2000     \
        --pruning_method=threshold      

procedure
sudo docker build -t sparse_rn50 .
sudo docker run -v /mnt/disks/Imagenet:/home/dataset -v /mnt/disks/checkpoints:/home/checkpoints -it sparse_rn50:latest


