# ------------------------------------------------------------------------------
# The code is from ECoDepth (https://github.com/Aradhye2002/EcoDepth/).
# For non-commercial purpose only (research, evaluation etc).
# -----------------------------------------------------------------------------
export CUDA_VISIBLE_DEVICES=0
PYTHONPATH="$(dirname $0)/..":"$(dirname $0)/../stable-diffusion":$PYTHONPATH \
python -m torch.distributed.run \
    --standalone \
    --nnodes=1 \
    --rdzv_backend=c10d \
    --rdzv_endpoint=localhost:0 \
    --nproc_per_node=1 \
    test.py \
    --dataset nyudepthv2 \
    --data_path ./data/nyu \
    --flip_test \
    --save_visualize \
    --no_of_classes 100 \
    --save_eval_pngs \
    --exp_name testing_nyu \
    --max_depth 10.0 \
    --max_depth_eval 10.0 \
    --batch_size 1 \
    --ckpt_dir ./checkpoints_depth/nyu.ckpt \
