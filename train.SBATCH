#!/bin/bash
#SBATCH --job-name=diffusion_basics
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=6
#SBATCH --mem=12GB
#SBATCH --time=120:00:00
#SBATCH --mail-type=END
#SBATCH --mail-user=hq443@nyu.edu # put your email here if you want emails
#SBATCH --output=slurm.out
#SBATCH --error=slurm.err
#SBATCH --gres=gpu:1 # How much gpu need, n is the number
#SBATCH -p aquila
#SBATCH --gres=gpu:3090:1


module purge
module load anaconda3
module load cuda

echo "start training"
cd /gpfsnyu/scratch/hq443/diffusions/diffusion_basics
source activate /scratch/hq443/conda_envs/torch-p2c
python train.py

echo "end training"
