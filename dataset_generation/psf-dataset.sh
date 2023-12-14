#!/bin/bash
#SBATCH --job-name="psf_data_gen"
#SBATCH --mail-user=ezequiel.centofanti@cea.fr
#SBATCH --mail-type=NONE
#SBATCH --partition=htc
#SBATCH --nodes=1
#SBATCH --cpus-per-task=64
#SBATCH --time=2-48:00:00
#SBATCH --mem-per-cpu=4G
#SBATCH --output=psf_data_gen-%j.log

# Activate conda environment
module load anaconda
source activate $ANACONDA_DIR
conda activate wavediff

# echo des commandes lancees
set -x

# Change location
cd $WORK/Refractored_star_classifier/dataset_generation

# Run code
srun python gen-SR-PSF-parallel-GT100.py
#srun python utils_test.py

# Return exit code
exit 0
