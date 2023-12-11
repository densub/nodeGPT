#!/bin/bash 

# Exit on any error
set -e

#Clone the comfyUI repo if it doesn't exist
if [ ! -d "ComfyUI" ]; then
    git clone https://github.com/comfyanonymous/ComfyUI.git
fi

# Navigate into the ComfyUI repository
cd ComfyUI

# Pull the latest changes
git pull

# Navigate into the custom_node folder
cd custom_nodes

# Clone the NodeGPT if it doesn't exist
if [ ! -d "NodeGPT" ]; then
    git clone https://github.com/xXAdonesXx/NodeGPT.git
fi

# Navigate into the NodeGPT repository
cd NodeGPT

# Pull the latest changes
git pull

# Navigate back to the custom_nodes folder
cd ..

# Clone the ComfyUI Manager if it doesn't exist
if [ ! -d "ComfyUI-Manager" ]; then
    git clone https://github.com/ltdrdata/ComfyUI-Manager.git
fi

# Navigate into the NodeGPT repository
cd ComfyUI-Manager

# Pull the latest changes
git pull

# Navigate back to the Comfy UI repository
cd ..
cd ..

# Create a virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
    python3 -m venv venv
fi

# Activate the virtual environment
source venv/bin/activate

# Install dependencies for the ComfyUI repository
pip install -r requirements.txt
pip install torchvision

# Navigate into the NodeGPT repo to install it's dependencies
cd custom_nodes/NodeGPT

# Install dependencies for the ComfyUI repository
pip install -r requirements.txt

# Navigate back to the Comfy UI repository
cd ..

# Navigate into the comfyUI manager repo to install it's dependencies
cd ComfyUI-Manager

# Install dependencies for the ComfyUI repository
pip install -r requirements.txt

# Navigate back to the Comfy UI repository
cd ..
cd ..

# Run the main.py file
python3 main.py
