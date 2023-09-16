# setup
mkdir -p /opt/conda/
cd /opt
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /opt/miniconda3.sh
bash /opt/miniconda3.sh -b -u -p /opt/conda

# config
/opt/conda/bin/conda init bash
/opt/conda/bin/conda init zsh

