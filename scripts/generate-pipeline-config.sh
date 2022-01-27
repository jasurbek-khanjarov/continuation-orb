#!/bin/bash

BRANCH_NAME=$1
COMMIT_TAG=$2

NODE_SUB='node'
mkdir configs/
if [[ "$BRANCH_NAME" == *"$NODE_SUB"* ]];
then
  cat << EOF > configs/generated_config.yml
  version: 2.1
  jobs:
    test_1:
      docker:
        - image: cimg/base:2022.01
      steps:
        - checkout
        - run: echo "Node Project"
  workflows:
    test_workflow:
      jobs:
        - test_1
  EOF
else
  cat << EOF > configs/generated_config.yml
  version: 2.1
  jobs:
    test_1:
      docker:
        - image: cimg/base:2022.01
      steps:
        - checkout
        - run: echo "PHP Project"

  workflows:
    test_workflow:
      jobs:
        - test_1
  EOF
fi
