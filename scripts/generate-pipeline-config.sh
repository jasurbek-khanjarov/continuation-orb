#!/bin/bash

BRANCH_NAME=$1
COMMIT_TAG=$2

mkdir configs/
cat << EOF > configs/generated_config.yml

version: 2.1
jobs:
  test_1:
    docker:
      - image: cimg/base:2022.01
    steps:
      - checkout
      - run: echo $BRANCH_NAME
      - run: echo $COMMIT_TAG

workflows:
  test_workflow:
    jobs:
      - test_1

EOF
