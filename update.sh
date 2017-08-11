#!/bin/bash
for repo in frontend backend crawler minha-cidade-web
do
   cd $repo
   git pull origin master
   cd ..
done
