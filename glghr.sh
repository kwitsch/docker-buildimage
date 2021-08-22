#!/bin/ash -e

user=$1
repo=$2
echo "download repo: $user/$repo"
file="${repo}.tar.gz"
baseurl="https://api.github.com/repos/$user/$repo/releases/latest"
echo "api url: $baseurl"
dlurl=$(curl -s ${baseurl} | grep "tarball_url.*" | head -1 | cut -d : -f 2,3 | tr -d '\"' | tr -d ',' | tr -d ' ')
if [ -z "$dlurl" ]; then
    baseurl="https://api.github.com/repos/$user/$repo/tags"
    echo "api url2: $baseurl"
    dlurl=$(curl -s ${baseurl} | grep "tarball_url.*" | head -1 | cut -d : -f 2,3 | tr -d '\"' | tr -d ',' | tr -d ' ')
fi
echo "download url: $dlurl"
curl -fsSL --retry 3 ${dlurl} -o ${file}
mkdir ${repo}
tar xzf ${file} --strip 1 -C ${repo}
rm ${file}