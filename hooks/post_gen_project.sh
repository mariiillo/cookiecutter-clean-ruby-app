#!/bin/bash

bundle install
git init .
git add .
git commit -m "Initial commit"
git remote add origin git@github.com:{{cookiecutter.github_user}}/{{cookiecutter.repo_name}}.git
git push origin master
exit 0
