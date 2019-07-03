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
  --train_batch_size 24 \
  --dev_batch_size 24 \
  --test_batch_size 24 \
  --n_hidden 2048 \
  --learning_rate 0.00005 \
  --dropout_rate 0.10 \
  --lm_binary_path /srv/speech_training/language_corpora/lm.binary \
  --lm_trie_path /srv/speech_training/language_corpora/trie \
  --epochs 5 \
  --noearly_stop \
  --feature_cache /var/cache/mltraining/tfcache \
  --checkpoint_dir checkpoint \
  --summary_dir summary \
  --export_dir exports \
  "$@"
