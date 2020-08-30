#!/usr/bin/env sh

# abort on errors
set -e

# build
# yarn build/

# navigate into the build output directory
cd dist

# if you are deploying to a custom domain
# echo 'www.example.com' > CNAME

# git init
git add -A
git commit -m 'deploy'

# if you are deploying to https://<USERNAME>.github.io
# git push -f git@github.com:<USERNAME>/<USERNAME>.github.io.git master

# if you are deploying to https://<USERNAME>.github.io/<REPO>
# git push -f git@github.com:StevenMaharaj/binance_stream.git master:gh-pages
# git branch -M master
# git remote add origin https://github.com/StevenMaharaj/binance_stream.git
# git push -u origin master

git branch -M deploy
git remote add origin https://github.com/StevenMaharaj/binance_stream.git
git push -u origin deploy