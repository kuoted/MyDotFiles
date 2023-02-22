# git clone -b master git@gitlab.ks.x:crayon-masp/crayon-masp.git 10_master_crayon-masp
# git clone -b feature/humble_exec git@gitlab.ks.x:crayon-masp/crayon-masp.git 11_EM_crayon-masp
# git clone -b bugfix/state_management git@gitlab.ks.x:crayon-masp/crayon-masp.git 12_SM_crayon-masp

CURRENT_PATH=/Users/kuoted/01_work/02_kernelsoft/1_framework
cd $CURRENT_PATH

cd 02_EM_SM_crayon-masp/ && git pull && cd ..
cd 10_master_crayon-masp/ && git pull && cd ..
cd 11_EM_crayon-masp/ && git pull && cd ..
cd 12_SM_crayon-masp/ && git pull && cd ..

cd $CURRENT_PATH
