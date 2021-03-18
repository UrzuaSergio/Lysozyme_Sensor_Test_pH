#!/bin/bash

#SBATCH -p gpuk
#SBATCH --gres=gpu:1
#SBATCH -J 1hel_isolated_pH8_EF5.5264e-5
#SBATCH -o 1hel_isolated_pH8_EF5.5264e-5-%j.out
#SBATCH -e 1hel_isolated_pH8_EF5.5264e-5-%j.err
#SBATCH --mem=2G
#SBATCH --time=01:00:00
#SBATCH --mail-user=sergio.urzua.13@sansano.usm.cl
#SBATCH --mail-type=BEGIN,END,FAIL

use cuda10
use anaconda3

export PYTHONPATH=/user/s/surzua/PyCuda/pycuda/lib/python

cd ../../Lysozyme_Sensor_EF5.5264e-5_pH8/

/user/s/surzua/PyCuda/pycuda/bin/pygbe 1hel_isolated/
