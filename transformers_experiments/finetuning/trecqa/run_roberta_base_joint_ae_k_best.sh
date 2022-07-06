python -m transformers_framework \
    --model RobertaJointAS2 \
    --devices 2 --accelerator gpu --strategy ddp \
    --precision 16 \
    --pre_trained_model <path-to-pretrained-model> \
    --name roberta-base-joint-trecqa-AE-k-best \
    --output_dir outputs/joint-trecqa \
    \
    --adapter JointwiseArrowAdapter \
    --batch_size 32 --val_batch_size 128 --test_batch_size 128 \
    --train_filepath <path-to-trecqa-dataset> --train_split train \
    --valid_filepath <path-to-trecqa-dataset> --valid_split validation \
    --test_filepath <path-to-trecqa-dataset> --test_split test \
    --field_names question answer \
    --label_name label \
    --key_name key \
    --score_name scores_roberta_base \
    \
    --accumulate_grad_batches 2 \
    --max_sequence_length 64 \
    -k 5 --selection best --separated \
    --learning_rate 1e-05 \
    --max_epochs 40 \
    --early_stopping \
    --patience 8 \
    --weight_decay 0.0 \
    --num_warmup_steps 100 \
    --monitor validation/map \
    --val_check_interval 1.0 \
    --num_workers 8 \
    --shuffle_candidates --reload_dataloaders_every_n_epoch 1 \
    --head_type AE_k \
    --seed 1337