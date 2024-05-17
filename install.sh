#!/usr/bin/bash
for file in $(ls)
do
    "stow $file --adopt"
done
git checkout *
