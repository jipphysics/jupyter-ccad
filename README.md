# jupyter-ccad

## ¿Que ventajas trae usar **jupyter notebooks**?

1. Ud. puede programar, calcular, analizar resultados, comentarlos y graficarlos, en un mismo entorno de trabajo.

2. Facilita el paradigma de programación interactiva o [REPL](https://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop) (Read, Eval, Print, Loop). Esto le permite a Ud. evaluar el código a medida que lo va desarrollando, acelerando el proceso y reduciendo la probabilidad de que se cometan errores.

## ¿Que ventajas trae usar **jupyter notebooks** en el cluster `jupyter` del CCAD?

1. Poder usar notebooks de [Julia](https://julialang.org/), [Python](https://www.python.org/) o [R](https://www.r-project.org/) para desarrollar y testear código en el nodo `jupyter` del **CCAD**.

2. Luego, usar el cluster `serafin` y/o el cluster `mendieta` para lanzar grandes corridas.

3. Usar [serialización](https://es.wikipedia.org/wiki/Serializaci%C3%B3n) para almacenar los datos. Por ejemplo, usar [pickle](https://docs.python.org/3/library/pickle.html) en **Python** o [JLD2](https://github.com/JuliaIO/JLD2.jl) en **Julia**.

4. Volver a usar notebooks para analizar y graficar los resultados.

## ¿Cómo usar el nodo `jupyter` del CCAD?

### Conectarse al nodo

1. Abrir una cuenta en el CCAD llenando un formulario: [https://ccad.unc.edu.ar/servicios/pedido-de-cuentas/](https://ccad.unc.edu.ar/servicios/pedido-de-cuentas/). Los **sysadmin** del CCAD le abrirán una cuenta para acceder a los clusters, y para acceder a un chat de consultas en Zulip: [https://ccadunc.zulipchat.com](https://ccadunc.zulipchat.com). Recomendamos utilizar **Zulip** para evacuar sus dudas.

2. Configurar su acceso a los clusters del CCAD utilizando el protocolo de llaves publicas y privadas: [https://dokuwiki.ccad.unc.edu.ar/doku.php?id=conexion](https://dokuwiki.ccad.unc.edu.ar/doku.php?id=conexion).

3. Desde una terminal de bash en su **Linux** (o consola equivalente en **Windows**), conéctese al nodo `jupyter` vía el comando:

        juan@laptop> ssh -L 8083:localhost:8083 usuario@jupyter.ccad.unc.edu.ar
        
    remplazando `usuario` por su nombre de usuario que le fué asignado al inscribirse. Si el puerto `8083` no funciona, pruebe con otros puertos. Por ejemplo `8080`, `8081` o incluso `1234`, etc. Si usa **Windows**, asegúrese que el puerto que intenta utilizar no está bloqueado.

Una vez en la terminal de bash en el nodo `jupyter`, el siguiente paso consiste en instalar [Jupyter](https://jupyter.org/) en su carpeta de usuario. Existen diferentes formas de instalar **Jupyter**, como se describe a continuación.
  
### Instalando Jupyter vía Micromamba
  
1. En la terminal conectada al nodo `jupyter` del CCAD, baje **Micromamba**:

        [jperotti@jupyter ~] curl micro.mamba.pm/install.sh | bash

2. Cree un entorno nuevo con **Micromamba**:

        [jperotti@jupyter ~]$ micromamba create -n notebook-env
        
3. Active el nuevo entorno:

        [jperotti@jupyter ~]$ micromamba activate notebook-env

4. Con el entorno activado, instale **Jupyter**:

        (notebook-env) [jperotti@jupyter ~]$ micromamba install -c anaconda jupyter      

### Instalando Julia en Jupyter

5. Baje **Julia**:

        (notebook-env) [jperotti@jupyter ~]$ wget https://julialang-s3.julialang.org/bin/linux/x64/1.9/julia-1.9.1-linux-x86_64.tar.gz
        
6. Descomprima **Julia**:

        (notebook-env) [jperotti@jupyter ~]$ tar -xf julia-1.9.1-linux-x86_64.tar.gz
        
    Esto creará una carpeta `julia-1.9.1` en su carpeta de usuario.
    
6. Inicie la terminal de **Julia**:

        (notebook-env) [jperotti@jupyter ~]$ ./julia-1.9.1/bin/julia 
                       _
           _       _ _(_)_     |  Documentation: https://docs.julialang.org
          (_)     | (_) (_)    |
           _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
          | | | | | | |/ _` |  |
          | | |_| | | | (_| |  |  Version 1.9.1 (2023-06-07)
         _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
        |__/                   |

        julia>
    
7. Instale algunos paquetes necesarios de **Julia**, incluyendo **IJulia** (la interface entre Julia y Jupyter)

        julia> using Pkg; Pkg.add("IJulia"); Pkg.add("Plots"); Pkg.add("LaTeXStrings"); Pkg.add("NBInclude")
        
   Esto debería acoplar el paquete **IJulia** con la instalación de **Jupyter** que Ud. tiene en su entorno de **Micromamba**.

8. Salga de la terminal de Julia.

        julia> exit()
        
9. Inicie una sesión de **Jupyter**:

        (notebook-env) [jperotti@jupyter ~]$ jupyter notebook --no-browser --port=8083        
        
        To access the notebook, open this file in a browser:
            file:///home/jperotti/.local/share/jupyter/runtime/nbserver-3417387-open.html
        Or copy and paste one of these URLs:
            http://localhost:8083/?token=5d58cbd50a995f886b91a6b2aa037f88a3cc3ca1d098b69f
         or http://127.0.0.1:8083/?token=5d58cbd50a995f886b91a6b2aa037f88a3cc3ca1d098b69f
        
10. Entre la información arrojada por **Jupyter**, deberá encontrar una dirección similar a la siguiente:

        http://localhost:8083/?token=5d58cbd50a995f886b91a6b2aa037f88a3cc3ca1d098b69f
        
    Copiela y peguela en el navegador de su computadora personal. Esto debería abrirle una sesión del administrador de notebooks de **Jupyter** en su navegador.

11. Cierre el administrador de notebooks clickeando en 

**IMPORTANTE:** El nº de puerto espeficado en el comando `ssh` tiene que ser el mismo especificado en el comando `jupyter`.

## Clonando repositorios para trabajar

Este paso es alternativo. Lo incluimos para mostrarles como trabajar con git. 
    
1. Clone en su carpeta de usuario el repositorio del presente tutorial:
    
        (notebook-env) [jperotti@jupyter ~]$ git clone git@github.com:jipphysics/jupyter-ccad.git
        
2. Cambie el directorio de trabajo al del repositorio clonado:
    
        (notebook-env) [jperotti@jupyter ~]$ cd jupyter-ccad/

## Detaching y reattaching de notebooks usando `screen`

Algunas veces resulta muy útil levantar una sesión de trabajo que sobreviva al cierre o a la desconección de la terminal de trabajo creada en el inciso **3.**. Es decir, resulta útil poder crear una sesión de la cuál podamos desconectarnos para volver a reconectarnos posteriormente desde la misma computadora o, incluso de alguna otra. Esto resulta útil, por ejemplo, para dejar programas corriendo, o sesiones con notebooks que requieran un tiempo considerable de iniciación.

El comando [screen](https://linuxhint.com/linux-screen-command-tutorial/) permite crear y administrar sesiones de las que uno pueda desconectarse y reconectarse. A continuación damos un breve ejemplo:

1. Cree una sesión de nombre `mi-sesion`:

        (notebook-env) [jperotti@jupyter ~]$ screen -S mi-sesion
       
2. Levante un administrador de notebooks dentro de la sesión:

        [jperotti@jupyter jupyter-ccad]$ jupyter notebook --no-browser --port=8083
        ...
            http://localhost:8083/?token=648d7a6b6e2343e75d1723456f3647a0a897ddaa4debd44d
        ...
        
3. Abra el administrador de notebooks de **Jupyter** en su computadora, copiando el link anterior en el navegador. 

4. Desde el administrador, abra la notebook `simulations.ipynb`. 

5. Cierre el navegador. Esto no matará ni el administrador de notebooks ni la notebook.

6. Vuelva a la terminal de bash y presione `Ctrl. a + d`. Esto hará un **detach** de la sesión llamada `mi-sesion`.

7. Cierre el tunel con el nodo de `jupyter` typeando:

        (notebook-env) [jperotti@jupyter jupyter-ccad]$ exit
        
8. Reconectese al nodo de `jupyter`:

        juan@laptop> ssh -L 8083:localhost:8083 usuario@jupyter.ccad.unc.edu.ar
        
9. Liste las sesiones activas typeando:

        [jperotti@jupyter ~]$ screen -ls        
        There is a screen on:
	        3468235.mi-sesion	(Detached)
        
    Vemos que existe una sesión activa llamada `mi-sesion`        
        
10. Reconectese a la sesión typeando

        [jperotti@jupyter ~]$ screen -r mi-sesion

    Esto debería mostrarle lo que veía en la sesión en el momento que se desconectó de la misma (ver inciso **6.**). En particular, debería ver nuevamente el link que le permite abrir la sesión de **Jupyter** en su navegador.

11. Reabra el administrador de notebooks de **Jupyter**, copiando nuevamente el link en el navegador:

12. Habra nuevamente la notebook `simulation.ipybn` en la que estaba trabajando.

## Serialización de datos

## Paralelización usando threads

## Corriendo notebooks en Serafín
