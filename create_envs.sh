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
# lists of modules to be installed
#  if gpu's involved then cudalib=11.8
cuda="" 
starter=numpy pandas tqdm seaborn matplotlib jupyterlab scikit-learn yellowbrick debtcollector conda-forge::pymol-open-source spyder
cheminformatics=rdkit mols2grid openbabel biopython
abinitiomo=psi4 resp
openmm=openmm openmmforcefields ambertools mdtraj
#abinitio=
# pip install git+https://github.com/Mishima-syk/psikit # edit after installation
for v in vers
do
  fv=3.$v
  label=py3$v
  ename=${rootname}${label}
  conda create --yes python=$fv -n $ename >& create_${ename}.LOG
  mamba install --yes -n $ename $starter >& starter_${ename}.LOG
  mamba install --yes -n $ename $cheminformatics >& cheminformatics_${ename}.LOG
  mamba install --yes -n $ename $abinitiomo >& abinitiomo_${ename}.LOG
  mamba install --yes -n $ename $openmm >& openmm_${ename}.LOG
  source activate $ename
  pip install git+https://github.com/Mishima-syk/psikit
done
  
  
