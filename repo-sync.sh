#!/bin/bash

#
# EZ Script V0.1 for Dirty Unicorns
#
# Created by Michael S Corigliano (Mike Criggs) (michael.s.corigliano@gmail.com)
# for DirtyUnicorns (www.dirtyunicorns.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Usage: sudo ./repo-sync.sh
#

# Begin
	echo -e "We will now sync the desired repositories for you."
	echo -e "This will take a long time (depending on your internet connection)"
	echo -e "Please enter your 'sudo' password if prompted."
	echo -e "Make sure to enter in your name and email if asked."
	echo -e ""
	echo -e ""

# Select branch
	echo -e "What branch would you like to build?:
		1) m
		2) m-caf"
	read n
	case $n in
		1) cd && mkdir -p du-source && cd du-source && echo -e "Initializing Dirty Unicorns in new directory'du-source'..." && repo init -u git://github.com/DirtyUnicorns/android_manifest.git -b m
		;;
		2) cd && mkdir -p du-source-caf && cd du-source-caf && echo -e "Initializing Dirty Unicorns CAF in new directory 'du-source-caf'..." && repo init -u git://github.com/DirtyUnicorns/android_manifest.git -b m-caf
		;;
		*) invalid option
		;;
	esac

# Create a 'logs/repo-sync' directory for the user
	echo -e "Creating 'logs/repo-sync' directory so that you can debug any issues you may have syncing"
		mkdir -p logs/repo-sync
	echo -e ""
	echo -e ""

# Sync the source
	echo -e "Syncing the source..."
		repo sync 2>&1 | tee repo-sync-logs/repo-sync_$NOW.log

# Finish and give the user some tips
printf "The script has finished.\n\n\nIf you want to review your sync, a complete log has been sent to 'logs/repo-sync'. You may remove this directory at\nany time or remove any logs inside of it to keep things clean, if you wish. It is there for your convenience.\n\nIf you encountered an error about roomservice, it is advised to run this command from the source directory:\nsudo rm -rf .repo/local_manifests.xml\n\nIf you encountered an\nyou issues:\nrepo sync -j1\n\nYou can find your all Android manifests are located here:\n\n.repo/\n\nHappy building!\n\n"

# Start
	echo -e "Starting build..."
		sudo ./build.sh

