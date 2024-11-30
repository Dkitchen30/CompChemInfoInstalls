# CompChemInfoInstalls
Simple instructions to install miniconda and python environments 
that will install open source computational chemistry and cheminformatics software 
on a linux computer (probably Windows and Apple OS X).
The key Computational Chemistry installs are QM and MM based methods.
The key Cheminformatics tools are RDKit, statistics/math and graphing

It is fairly tedious to match the various python versions with these different pieces of software.
I am collecting the combinations that work so that if something goes wrong, it will be simple to
recreate a good working environment.

My test system is a very old, ubuntu-linux machine. ~ 1 TB of disk space.
Step 1: install miniconda:

mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm ~/miniconda3/miniconda.sh 

if you have anaconda installed, you probably need to fix the paths:

export PATH=${PATH//anaconda3/miniconda3}

Prep the base miniconda with mamba, jupyterlab and spyder

Cheminformatics:
rdkit openbabel
biopython

General informatics:
pandas, matplotlib, tqdm

QM/MM:
psi4, resp (QM)
openmm, openmmforcefields

Visualizers
pymol


conda create --yes python=3.10 -n py310chem
mamba install --yes -n py310chem rdkit pandas tqdm numpy seaborn mols2grid matplotlib jupyterlab openbabel
mamba install --yes -n py310chem openmm psi4 resp debtcollector conda-forge::pymol-open-source openmmforcefields
source activate py310chem
pip install git+https://github.com/Mishima-syk/psikit

There are some bugs in psikit that do not work well with newer psi4's.


