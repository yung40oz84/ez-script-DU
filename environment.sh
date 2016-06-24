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
# Usage: sudo ./environment.sh
#

# Begin
	echo -e "Setting up build environment..."
	echo -e ""
	echo -e ""

# 1) Update OS
	echo -e "Part 1 of 6"
	echo -e ""
	echo -e "Upgrading your OS..."
	echo -e "Please enter your 'sudo' password if promped."
	echo -e ""
	echo -e ""
		sudo apt-get update -y
		sudo apt-get upgrade -y
		sudo apt-get dist-upgrade -y
	clear
	echo -e "OS updated"
	echo -e ""
	echo -e ""

# 2) Install packages
	echo -e "Part 2 of 6"
	echo -e ""
	echo -e "Installing packages needed for building..."
	echo -e "Please enter your 'sudo' password if promped."
	echo -e ""
	echo -e ""
		sudo apt-get install android-tools-adb android-tools-fastboot git-core gnupg flex bison gperf build-essential \
		zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 \
		lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache \
		libgl1-mesa-dev libxml2-utils xsltproc unzip schedtool
		sudo ln -s /usr/lib/i386-linux-gnu/mesa/libGL.so.1 /usr/lib/i386-linux-gnu/libGL.so
	clear
	echo -e "Packages installed"
	echo -e ""
	echo -e ""
   
# 3) Install and configure JDK
	echo -e "Part 3 of 6"
	echo -e ""
	echo -e "Installing and configuring JDK..."
	echo -e "Please enter your 'sudo' password if prompted."
	echo -e ""
	echo -e ""
		sudo apt-get install openjdk-7-jdk
		sudo apt-get -f install
		sudo apt-get update
		sudo update-alternatives --config java
		sudo update-alternatives --config javac
	echo -e ""
	echo -e ""
	echo -e "JDK installed and configured"
	echo -e ""
	echo -e "If during a build, you encounter version errors for Java, set its path as described here:"
	echo -e "https://source.android.com/source/building.html#wrong-java-version"
	echo -e ""
	echo -e ""

# 4) Make '~/bin' directory to house the repo tool
	echo -e "Part 4 of 6"
	echo -e ""
	echo -e "Making '~/bin' directory to house the repo tool..."
	echo -e "Please enter your 'sudo' password if prompted."
	echo -e ""
	echo -e ""
	mkdir -p ~/bin
	PATH=~/bin:$PATH

# 5) Download repo tool to '~/bin/repo' and give it the proper permissions
	echo -e "Part 5 of 6"
	echo -e ""
	echo -e "Downloading repo tool to '~/bin/repo' and giving it the proper permissions..."
	echo -e "Please enter your 'sudo' password if prompted.";
	echo -e ""
	echo -e ""
		curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
		sudo chmod a+x ~/bin/repo
	clear

# 6) Configure GIT
	echo -e "Part 6 of 6"
	echo -e ""
		read -p "What is your name? " -e username
			git config --global user.name "$username"
				echo -e "GIT username set as $username"
		read -p "What is your email? " -e email
			git config --global user.email "$email"
				echo -e "GIT email set as $email"
	echo -e "GIT has been configured"
	echo -e ""
	echo -e ""
   
# End of environment setup
	clear
	echo -e "Build environment has been set up."
	echo -e ""
	echo -e ""

# Start repo.sh
	echo -e "Running repo-sync.sh..."
	echo -e ""
		sudo ./repo-sync.sh

