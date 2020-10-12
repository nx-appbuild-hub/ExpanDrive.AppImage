# Copyright 2020 Alex Woroschilow (alex.woroschilow@gmail.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
PWD:=$(shell pwd)

all: clean
	wget --output-document=$(PWD)/ExpanDrive.AppImage  https://packages.expandrive.com/AppImage/ExpanDrive-7.6.3.AppImage
	7z x $(PWD)/ExpanDrive.AppImage -o$(PWD)/AppDir
	chmod +x $(PWD)/AppDir/expandrive*
	chmod +x $(PWD)/AppDir/chrome-*
	chmod +x $(PWD)/AppDir/AppRun

	export ARCH=x86_64 && $(PWD)/bin/appimagetool.AppImage $(PWD)/AppDir $(PWD)/ExpanDrive.AppImage
	chmod +x $(PWD)/ExpanDrive.AppImage
	# make clean

clean:
	rm -rf $(PWD)/AppDir