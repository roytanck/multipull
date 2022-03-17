#!/bin/bash

dir=`pwd`
list=`find -maxdepth 1 -type d`

for i in $list
do
	if [ "$i" != "." ]; then
		echo "--------------"
		echo "Folder: $i"
		if [ -d "${i}/.git" ]; then
			cd $i
			branch=`git branch --show-current`
			if [[ "$branch" == "develop" || "$branch" == "master" || "$branch" == "main" ]]; then
				changes=`git diff --name-only`
				if [ "$changes" == "" ]; then
					git pull
					git fetch --tags
				else
					echo "Local branch '$branch' contains uncommitted changes"
				fi
			else
				echo "Repository not on the master/main/develop branch: $branch"
			fi
			cd $dir
		else
			echo "Not a Git repository"
		fi
	fi
done
