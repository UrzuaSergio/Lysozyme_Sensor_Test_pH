#!/bin/bash

#SBATCH -p gpuk
#SBATCH --gres=gpu:1
#SBATCH -J 1hel-sensor_0-20_pH8_EF5.5264e-5
#SBATCH -o 1hel-sensor_0-20_pH8_EF5.5264e-5-%j.out
#SBATCH -e 1hel-sensor_0-20_pH8_EF5.5264e-5-%j.err
#SBATCH --mem=2G
#SBATCH --time=55:00:00
#SBATCH --mail-user=sergio.urzua.13@sansano.usm.cl
#SBATCH --mail-type=BEGIN,END,FAIL


use cuda10
use anaconda3

export PYTHONPATH=/user/s/surzua/PyCuda/pycuda/lib/python

cd ../../Lysozyme_Sensor_EF5.5264e-5_pH8/
###############################################################################################################################################################
echo "Simulación que contempla las siguientes Orientaciones:"
echo "Tilt begin: 0° - Tilt_end: 20° - Ntilt: 6 -- Rot begin: 0° - Rot end: 360° - Nrot: 36"
echo "...................................................................................."
echo "Proteina-Superficie: Lisozima - Surf Cargada -0.04 C/m^2."
echo "Separación: 0.2 nm"
python generador_config_file.py 1hel_sensor 1hel_parse_ph8 mesh/1hel_parse_ph8_d16_split 0 20 2

echo "Se ha Creado Config File Auxiliar"
echo "Comenzo Ejecucion de PyGBe para Caso Proteina-Superficie Interactuando"
echo "%%%%%%%% Simulando %%%%%%%%"

python conformation_1hel.py 1hel_sensor 1hel_sensor/1hel_parse_ph8 1hel_sensor/mesh/1hel_parse_ph8_d16_split 0 20 6 2 1hel-sensor_0-20-2_pH8_EF5.5264e-5

echo "Termino Ejecucion de PyGBe para Caso Proteina-Superficie Interactuando"
##############################################################################################################################################################
