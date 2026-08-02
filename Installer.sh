#!/bin/bash

# Invisux
# Copyright (C) 2026  JasperC
# This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

echo "Invisux  Copyright (C) 2026  JasperC"
echo "This program comes with ABSOLUTELY NO WARRANTY. This is free software, and you are welcome to redistribute it under certain conditions. See the license of the software."

cd ~/

curl -L -o invisux-v1.0 https://codeberg.org/JasperC/Invisux/raw/branch/main/Versions/invisux-v1.0

chmod +x ~/invisux-v1.0

cp ~/Invisux-v1.0 /usr/local/bin/Invisux

sudo apt install gum

echo "All set"
