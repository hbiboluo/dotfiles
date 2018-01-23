sudo yum install cmake
[[ ! -d ~/Downloads ]] && mkdir ~/Downloads
if [[ ! -d ~/Downloads/LightGBM ]]; then
  git clone --recursive https://github.com/Microsoft/LightGBM ~/Downloads/LightGBM
fi
cd ~/Downloads/LightGBM
mkdir build ; cd build
cmake ..
make -j4
sudo make install
cd ~/Downloads/LightGBM/python-package 
python setup.py install
