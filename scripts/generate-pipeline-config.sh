#!/bin/bash

BRANCH_NAME=$1
NODE_SUB='nodejs'
# config_content=`cat ./default_config.yml`
if [[ "$BRANCH_NAME" == *"$NODE_SUB"* ]]
then
  mkdir configs/
cat << EOF > configs/generated_config.yml

version: 2.1
jobs:
  node_test_1:
    docker:
      - image: cimg/node:17.4.0
    steps:
      - checkout
      - run: echo $BRANCH_NAME
      - run: echo "Node Project"
workflows:
  test_workflow:
    jobs:
      - node_test_1

EOF
else
  mkdir configs/
cat << EOF > configs/generated_config.yml

version: 2.1
jobs:
  base_test_1:
    docker:
      - image: cimg/base:2022.01
    steps:
      - checkout
      - run: echo $BRANCH_NAME
      - run: echo "Base Project"
workflows:
  test_workflow:
    jobs:
      - base_test_1

EOF
fi
