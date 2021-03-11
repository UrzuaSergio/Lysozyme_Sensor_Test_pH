#!/bin/bash

#SBATCH -p gpuk
#SBATCH --gres=gpu:1
#SBATCH -J 1hel_44-60_EF5.5264e-5
#SBATCH -o 1hel_44-60_EF5.5264e-5-%j.out
#SBATCH -e 1hel_44-60_EF5.5264e-5-%j.err
#SBATCH --mem=2G
#SBATCH --time=55:00:00
#SBATCH --mail-user=sergio.urzua.13@sansano.usm.cl
#SBATCH --mail-type=BEGIN,END,FAIL

use cuda10
use anaconda3

export PYTHONPATH=/user/s/surzua/PyCuda/pycuda/lib/python

cd ../../Lysozyme_Sensor_Test_pH/Lysozyme_Sensor_EF5.5264e-5_pH9/
###############################################################################################################################################################
echo "Simulación que contempla las siguientes Orientaciones:"
echo "Tilt begin: 44° - Tilt_end: 60° - Ntilt: 5 -- Rot begin: 0° - Rot end: 360° - Nrot: 36"
echo "...................................................................................."
echo "Proteina: Lisozima."
echo "Separación: 0.2 nm"
python generador_config_file.py 1hel_isolated 1hel_parse_ph9 mesh/1hel_parse_ph9_d16_split 44 60 2

echo "Se ha Creado Config File Auxiliar"
echo "Comenzo Ejecucion de PyGBe para Caso Proteina-Superficie Interactuando"
echo "%%%%%%%% Simulando %%%%%%%%"

python conformation_1hel.py 1hel_isolated 1hel_isolated/1hel_parse_ph9 1hel_isolated/mesh/1hel_parse_ph9_d16_split 44 60 5 2 1hel-isolated_44-60-2_pH9_EF5.5264e-5

echo "Termino Ejecucion de PyGBe para Caso Proteina-Superficie Interactuando"
##############################################################################################################################################################
