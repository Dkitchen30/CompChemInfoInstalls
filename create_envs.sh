rootname=$1
if [ E$rootname == E ]; then
  rootname=cchem
fi
condaloc=~/miniconda3
export PATH=${condaloc}/bin:${condaloc}/condabin:$PATH
python --version
which conda
conda-env list
vers=10,11,12
subver=9
source activate base
conda install --yes mamba
mamba install --yes anaconda::jupyter anaconda::spyder
for v in vers
do
  fv=3.$v
  label=py3$v
  ename=${rootname}${label}
  conda create --yes python=$fv -name $ename >& create_${ename}.LOG
  
  
