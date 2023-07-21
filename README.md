# Cómo usar el nodo `jupyter` del CCAD?

## Conectarse al nodo

1. Abrir una cuenta en el CCAD llenando un formulario: [https://ccad.unc.edu.ar/servicios/pedido-de-cuentas/](https://ccad.unc.edu.ar/servicios/pedido-de-cuentas/). Los **sysadmin** del CCAD le abrirán una cuenta para acceder a los clusters, y para acceder a un chat de consultas en Zulip: [https://ccadunc.zulipchat.com](https://ccadunc.zulipchat.com). Recomendamos utilizar **Zulip** para evacuar sus dudas.

2. Configurar su acceso a los clusters del CCAD utilizando el protocolo de llaves publicas y privadas: [https://dokuwiki.ccad.unc.edu.ar/doku.php?id=conexion](https://dokuwiki.ccad.unc.edu.ar/doku.php?id=conexion).

3. Desde una terminal de bash en su **Linux** (o consola equivalente en **Windows**), loguéese al nodo `jupyter`:

        juan@laptop> ssh -L 1234:localhost:1234 usuario@jupyter.ccad.unc.edu.ar
        
    remplazando `usuario` por su nombre de usuario que le fué asignado al inscribirse. Si el puerto `1234` no funciona, pruebe con otros puertos. Por ejemplo `1235`, ..., `8888`, etc. Si usa **Windows**, asegúrese que el puerto que intenta utilizar no está bloqueado.

El siguiente paso consiste en instalar [Jupyter](https://jupyter.org/) en su carpeta de usuario dentro del nodo `jupyter` del CCAD. Existen diferentes formas de instalar **Jupyter**. A continuación se describen dos alternativas:

* La primera utilizando el administrador de entornos (o environments) [Micromamba](https://mamba.readthedocs.io/en/latest/index.html) el cual es similar a [Conda](https://docs.conda.io/en/latest/) pero más eficiente. Esta alternativa es conveniente si Ud. utiliza **Python**.

* La segunda utilizando el administrador de paquetes de [Julia](https://julialang.org/), un lenguaje de programación moderno enfocado al cálculo científico.
  
## Instalando Jupyter vía Micromamba
  
1. En la terminal conectada al nodo `jupyter` del CCAD, baje **Micromamba**:

        [jperotti@jupyter ~] curl micro.mamba.pm/install.sh | bash

2. Cree un entorno nuevo con **Micromamba**:

        [jperotti@jupyter ~]$ micromamba create -n jnb-env
        
3. Active el nuevo entorno:

        [jperotti@jupyter ~]$ micromamba activate jnb-env

4. Con el entorno activado, instale **Jupyter**:

        (jnb-env) [jperotti@jupyter ~]$ micromamba install -c anaconda jupyter      

5. Inicie una sesión de **Jupyter** en modo `no-browser` y vía el puerto especificado en el inciso **3.** durante la apertura de la sesión remota:

        (jnb-env) [jperotti@jupyter ~]$ jupyter notebook --no-browser --port=1234

6. Al abrirse, **Jupyter** proveerá de un link:

        http://localhost:1234/?token=c845f9ac70ca2e4bde0be714072c6fe52e59511b77047cc6
                           
    que Ud. tiene que copiar y pegar en su navegador para acceder a la sesión de Jupyter inciada.
    
6. Para "salir", cierre sus notebooks y cierre **Jupyter** cliqueando `Quit`. Luego puede desactivar los entornos de **Micromamba** tipeando:

        jnb-env) [jperotti@jupyter ~]$ micromamba deactivate
        (base) [jperotti@jupyter ~]$ micromamba deactivate
        [jperotti@jupyter ~]$        

## Instalando Jupyter vía Julia

En este caso, no hace falta utilizar **Micromamba** para instalar **Jupyter** ya que **Julia** hará su propia instalación.

1. Loguéese al nodo `jupyter`:

        juan@laptop> ssh usuario@jupyter.ccad.unc.edu.ar

2. Baje **Julia**:

        [jperotti@jupyter ~]$ wget https://julialang-s3.julialang.org/bin/linux/x64/1.9/julia-1.9.1-linux-x86_64.tar.gz

3. Descomprima **Julia**:

        [jperotti@jupyter ~]$ tar -xf julia-1.9.1-linux-x86_64.tar.gz
        
    Esto creará una carpeta `julia-1.9.1` en su carpeta de usuario.

4. Inicie una consola de **Julia**:

        [jperotti@jupyter ~]$ ./julia-1.9.1/bin/julia
                       _
           _       _ _(_)_     |  Documentation: https://docs.julialang.org
          (_)     | (_) (_)    |
           _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
          | | | | | | |/ _` |  |
          | | |_| | | | (_| |  |  Version 1.9.1 (2023-06-07)
         _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
        |__/                   |

        julia>
        
     Si desea salir de la consola de **Julia** tipee:

        julia> exit()   
                
5. En la consola de **Julia**, instale los paquetes de **Julia** que necesitaremos, tipeando:

        julia> using Pkg; Pkg.add("IJulia"); Pkg.add("Plots"); Pkg.add("LaTeXStrings"); Pkg.add("NBInclude"); Pkg.add("BenchmarkTools"); Pkg.add("Random"); Pkg.add("FileIO"); Pkg.add("JLD2"); Pkg.add("Dates")

### Usando notebooks en modo `detached`

El modo `detached` le permite a uno crear sesiones de **Jupyter** que permanezcan vivas aún luego de cerrar la terminal de bash. Esto le permite a Ud. desconectarse y reconectarse a la sesión que desee, desde la computadora que desee.

1. Si no lo hizo, inicie nuevamente una consola de **Julia**:

        [jperotti@jupyter ~]$ ./julia-1.9.1/bin/julia
                       _
           _       _ _(_)_     |  Documentation: https://docs.julialang.org
          (_)     | (_) (_)    |
           _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
          | | | | | | |/ _` |  |
          | | |_| | | | (_| |  |  Version 1.9.1 (2023-06-07)
         _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
        |__/                   |

        julia>

2. Active el paquete **IJulia** e inicie una sesión del administrador de notebooks de **Jupyter**:

        julia> using IJulia
        julia> notebook(detached=true)
        
    **NOTA:** Si **IJulia** le pregunte si desea instalar **Jupyter** vía conda, dígale que si. **IJulia** instalará e iniciará una sesión de **Jupyter**. Si no le pregunta, **IJulia** ha encontrado e iniciado alguna instalación preexistente de **Jupyter** (por ejemplo, la instalada vía **Micromamba**).
                
   **Aclaración:** Este comando iniciará una sesión de **Jupyter**, pero no accederá a ella. Para acceder, continúe con el siguiente punto.
                
3. Para acceder a las sesiones de **Jupyter** abiertas, Uds. necesita ejectuar el siguiente comando:
    
        julia> run(`$(IJulia.find_jupyter_subcommand("")[1]) notebook list`)
        
    Esto imprimirá algo similar a lo siguiente:
        
        Currently running servers:
        http://localhost:8890/?token=b6ffb46d7875678903fdc07edf2988c51e27d5ab68a848b4 :: /home/jperotti
        Process(`/home/jperotti/micromamba/envs/jnb-env/bin/jupyter notebook list`, ProcessExited(0))

    Aquí, identificaremos links como el siguiente:

        http://localhost:8890/?token=b6ffb46d7875678903fdc07edf2988c51e27d5ab68a848b4
        
    cada uno de los cuales corresponde a una sesión de **Jupyte** abierta.
      
4. Para acceder a alguna de las sesiones abiertas, tiene que copiar y pegar en el navegador de su computadora el link correspondiente. Pero antes, tiene que habilitar una conección o tunneling a travéz del puerto indicado en el link.
Para ello, abra otra terminal de bash y loguéese nuevamente utilizando (por ejemplo) el comando:

        juan@laptop> ssh -i /home/juan/hdd-juan/.ssh/id_rsa -L 8890:localhost:8890 jperotti@jupyter.ccad.unc.edu.ar

    Crucialmente, en este comando hemos especificado el mismo puerto que el indicado en el link. En este caso, el puerto `8890`.
    
5. Finalmente, copie el link del inciso **3.** en el navegador de su computadora para acceder a la sesión de **Jupyter** que está corriendo en el nodo `jupyter` del CCAD. 

    Luego de varia sesiones, puede que Uds. tenga varias sesiones de **Jupyter** simultaneamente abiertas en el nodo. Cada una de ellas corresponde a un link similar al que se ve en **3.**. Utilice dichos links para acceder a ellas desde su navegador. En particular, acceda a ellas para cerrarlas cliqueando en **Quit**. Alternativamente, si Uds. conoce como usar terminales de Linux, puede visualizar y matar las sesiones abiertas con el comando `htop` o el comando `ps`.

### Paralelizando y serializando el almacenamiento de datos

1. Abra con **Jupyter** el notebook para crear kernels que soporten multithreading `crear-kernel-multithread.ipynb`, cree un kernel que soporte 10 threads y cierre el notebook.

2. Luego, abra el notebook `simulador.ipynb` que proveemos en el repositorio. En el [video de la charla](https://drive.google.com/file/d/13NVqKeXdZhRhCMvDj7SiIeu5KdoFYot4/view?usp=sharing) mostramos como paralelizar simulaciones y guardar datos de manera serializada.

### Lanzando grandes simulaciones en **Serafín**

1. En el mismo directorio en que se encuentra `simulador.ipynb`, cree un script de **Julia** `simulador-script.jl` con el contenido:

        using NBInclude
        @nbinclude("simulador.ipynb")

2. Corra dicho script en la partición que crea conveniente y llamandolo un script de BATCH (ver el ejemplo `submit-script.sh`) que incluya una linea como sigue

        srun $HOME/julia-1.9.1/bin/julia -t 64 $HOME/jupyter-ccad/simulador-script.jl
        
    Aquí, la opción `-t 64` especifica el uso de **64 threads** (recordar que un nodo de **Serafín** posee 64 cores).
