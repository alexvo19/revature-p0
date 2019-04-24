#!/bin/bash


directory=$1
email=$2
name=$3

#check for arguments
if [ -z $directory ] || [ -z $email ] || [ -z $name ]
then
 echo "must include directory/email/name as arguments"
 exit 1
fi


#check for git and node
if [ -z $(which git) ] || [ -z $(which node) ]
then
 echo "you DON'T have git or node"
 exit 1
fi

echo 'verified git and node is installed'


#if directory exist, directory must be empty
if [ -d $directory ] && [ -n "$(ls -A ${directory})" ]
then
 echo "existing directory is not empty"
 exit 1
fi
 

#make dir and cd
mkdir $directory
cd $directory


## docker
mkdir .docker

touch \
  .docker/dockerfile \
  .docker/dockerup.yaml

## github
mkdir -p \
  .github/ISSUE_TEMPLATE \
  .github/PULL_REQUEST_TEMPLATE

touch \
  .github/ISSUE_TEMPLATE/issue-template.md \
  .github/PULL_REQUEST_TEMPLATE/pull-request-template.md

touch \
  .github/CODE-OF-CONDUCT.md \
  .github/CONTRIBUTING.md

## root
mkdir \
  client \
  src \
  test

touch \
  client/.gitkeep \
  src/.gitkeep \
  test/.gitkeep

touch \
  .azureup.yaml \
  .dockerignore \
  .editorconfig \
  .gitignore \
  .markdownlint.yaml \
  CHANGELOG.md \
  LICENSE.txt \
  README.md


#initialize and configure git
git init
git config --global user.email $email
git config --global user.name $name


#enforce node as project runtime
npm init -y