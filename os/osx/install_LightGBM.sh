brew install cmake
brew install gcc
git clone --recursive https://github.com/Microsoft/LightGBM ~/Downloads/LightGBM
cd ~/Downloads/LightGBM
export CXX=g++-7 CC=gcc-7
mkdir build ; cd build
cmake ..
make -j4
sudo make install
cd ~/Downloads/LightGBM/python-package
python setup.py install
