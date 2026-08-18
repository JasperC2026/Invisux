#!/bin/bash

# Invisux
# Copyright (C) 2026  JasperC
# This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

install() {
            read -p "Select a package manager to install required dependencie (apt/dnf/pacman/brew/nix/flox/yum/zypper/go)" package
        
        case $package in
            apt)
                sudo mkdir -p /etc/apt/keyrings
                curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
                echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
                sudo apt update && sudo apt install gum
                ;;
            dnf)
                dnf install gum
                ;;
            pacman)
                pacman -S gum
                ;;
            brew)
                brew install gum
                ;;
            nix)
                nix-env -iA nixpkgs.gum
                ;;
            flox)
                flox install gum
                ;;
            yum)
                echo '[charm]
                name=Charm
                baseurl=https://repo.charm.sh/yum/
                enabled=1
                gpgcheck=1
                gpgkey=https://repo.charm.sh/yum/gpg.key' | sudo tee /etc/yum.repos.d/charm.repo
                sudo rpm --import https://repo.charm.sh/yum/gpg.key
                sudo yum install gum
                ;;
            zypper)
                echo '[charm]
                name=Charm
                baseurl=https://repo.charm.sh/yum/
                enabled=1
                gpgcheck=1
                gpgkey=https://repo.charm.sh/yum/gpg.key' | sudo tee /etc/yum.repos.d/charm.repo
                sudo rpm --import https://repo.charm.sh/yum/gpg.key
                sudo zypper refresh
                sudo zypper install gum
                ;;
            go)
                go install github.com/charmbracelet/gum@latest
                ;;
        esac

        read -p "Install additional dependencies for all tools in this progam? (yes/no)" additional

        if [[ $additional == "yes" ]]; then
            read -p "Select package manager (apt/dnf/pacman/other)" package_manager

            case $package_manager in
                apt)
                    sudo apt update
                    sudo apt install steghide openssl dnsutils libimage-exiftool-perl lynis gnupg coreutils
                    pip install Faker --break-system-packages
                ;;
                dnf)
                    sudo dnf install epel-release
                    sudo dnf install steghide lynis
                    sudo dnf install openssl bind-utils perl-Image-ExifTool gnupg2 coreutils
                    pip install Faker --break-system-packages
                ;;
                pacman)
                    sudo pacman -S openssl bind gnupg coreutils yay perl-image-exiftool
                    yay -S steghide lynis
                    pip install Faker --break-system-packages
                ;;
                other)
                    echo "Install steghide + faker + openssl + dig + exifttool + lynis + shred + gpg with your package manager"
                ;;
                *)
                    return o
                ;;
            esac
        fi
}

echo "Invisux  Copyright (C) 2026  JasperC"
echo "This program comes with ABSOLUTELY NO WARRANTY. This is free software, and you are welcome to redistribute it under certain conditions. See the license of the software."

read -p "Do you accept the terms of using this program as specified in the license? (yes/no)" status

if [[ $status == "yes" ]]; then
    cd ~/

    read -p "What to install? (latest/specific-version/source/repo)" choice

    if [[ $choice == "latest" ]]; then
        curl -LO  https://codeberg.org/JasperC/Invisux/releases/latest/download/invisux
        install
        dir=$(pwd)
        sudo chmod +x "$dir/invisux"
        sudo cp "$dir/invisux" /usr/local/bin/invisux
    elif [[ $choice == "specific-version" ]]; then
        read -p "Options: V1.0/V1.1" option

        case $option in
            V1.0)
            curl -LO https://codeberg.org/JasperC/Invisux/releases/download/v1.0/invisux-v1.0
            install
            dir=$(pwd)
            sudo chmod +x "$dir/invisux-v1.0"
            sudo cp "$dir/invisux-v1.0" /usr/local/bin/invisux
            ;;
            V1.1)
            curl -LO https://codeberg.org/JasperC/Invisux/releases/download/v1.1/invisux-v1.0
            install
            dir=$(pwd)
            sudo chmod +x "$dir/invisux"
            sudo cp "$dir/invisux" /usr/local/bin/invisux
            ;;
            *)
                return 0
            ;;
        esac
    elif [[ $choice == "source" ]]; then
        curl -LO https://codeberg.org/JasperC/Invisux/raw/branch/main/Invisux
    elif [[ $choice == "repo" ]]; then
        git clone https://codeberg.org/JasperC/Invisux.git
    else
        return 0
    fi
else
    return 0
fi

status=$?

if [[ $status == "0" ]]; then
    echo "Succesful installation"
else
    echo "Installation failed"
fi


