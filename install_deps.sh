#This script installs rgbdslam_v2 and g2o in ~/Code
#This script can be downloaded individually, as it
#does not require rest of the rgbdslam repository.
#It will download all required code in the process.

#If you have a fast machine with 4GB RAM or more, increase the
#two occurences of "-j2" below to parallelize the compilation more

#Prepare System
if test ! -d /opt/ros/kinetic; then
  echo This script assumes ROS kinetic to be installed
  echo The directory /opt/ros/kinetic was not found
  exit 1
fi

source /opt/ros/kinetic/setup.bash

echo
echo "Removing packages known to conflict (password required for apt-get)"
echo
sudo apt purge ros-kinetic-libg2o libqglviewer-dev

echo
echo "Installing Prerequisites"
echo
sudo apt install libglew1.5-dev libdevil-dev libsuitesparse-dev libeigen3-dev

echo
echo "Downloading ann_1.1.2 into external/gicp/"
echo
cd external/gicp/
wget https://www.cs.umd.edu/~mount/ANN/Files/1.1.2/ann_1.1.2.tar.gz
tar xvzf ann_1.1.2.tar.gz

echo
echo "Downloading SiftGPU into external/"
echo
cd ../
git clone https://github.com/pitzer/SiftGPU.git
