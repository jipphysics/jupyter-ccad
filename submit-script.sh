#!/bin/bash

### Configuración del trabajo

### Nombre de la tarea
#SBATCH --job-name=jupyternb

### Cola a usar (gpu, mono, multi)
#SBATCH --partition=short

### Cantidad de nodos a usar
#SBATCH --nodes=1

### Cores a utilizar por nodo = procesos por nodo * cores por proceso
#SBATCH --ntasks-per-node=1
### Cores por proceso (para MPI+OpenMP)
#SBATCH --cpus-per-task=64

### Tiempo de ejecucion. Formato dias-horas:minutos.
### short:  <= 1 hora
### multi:  <= 2 días
#SBATCH --time 0-0:05

#---------------------------------------------------

# Script que se ejecuta al arrancar el trabajo

# Cargar el entorno del usuario incluyendo la funcionalidad de modules
# No tocar
. /etc/profile

# Configurar OpenMP y otras bibliotecas que usan threads
# usando los valores especificados arriba
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
# export MKL_NUM_THREADS=$SLURM_CPUS_PER_TASK

# Cargar los módulos para la tarea
# module load quantum-espresso/6.7

# Lanzar el programa
srun $HOME/julia-1.9.1/bin/julia -t 64 simulador-script.jl
