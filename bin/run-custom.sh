#!/bin/sh
set -xe
if [ ! -f DeepSpeech.py ]; then
    echo "Please make sure you run this from DeepSpeech's top level directory."
    exit 1
fi;

python3 -u DeepSpeech.py \
  --train_files train-random.csv \
  --dev_files dev-random.csv \
  --test_files test-random.csv \
  --train_batch_size 32 \
  --dev_batch_size 48 \
  --test_batch_size 48 \
  --n_hidden 2048 \
  --learning_rate 0.0001 \
  --dropout_rate 0.15 \
  --lm_binary_path /srv/ml_datasets/speech_data/language_corpora/lm.binary \
  --lm_trie_path /srv/ml_datasets/speech_data/language_corpora/trie \
  --epochs 50 \
  --checkpoint_dir checkpoints \
  "$@"
