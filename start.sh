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
# Usage: ./start.sh
#

# Colors for terminal output
BLDRED="\033[1m""\033[31m"
RST="\033[0m"

# Let user know that they are using EZ Script
	clear
	echo -e ${BLDRED}"EZ Script V0.1 for Dirty Unicorns by Mike Criggs"${RST}
	echo -e ""
	echo -e ""

# Do we start EZ Script?
	read -p "THIS WILL TAKE A LONG TIME, ARE YOU SURE YOU WANT TO PROCEED? [Y/N]" answer
	while true
		do
  		case $answer in
   			[yY]* ) echo -e "Starting EZ Script..." && sudo ./environment.sh
      	   		break
			;;
   			[nN]* ) exit
			;;
			* )     echo "Answer Y or N, ONLY."; 
			break
			;;
		esac
	done

