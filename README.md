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

        juan@laptop> ssh -L 8088:localhost:8088 usuario@jupyter.ccad.unc.edu.ar
        
    remplazando `usuario` por su nombre de usuario que le fué asignado al inscribirse. Si el puerto `8088` no funciona, pruebe con otros puertos. Por ejemplo `8080`, `8081` o incluso `1234`, etc. Si usa **Windows**, asegúrese que el puerto que intenta utilizar no está bloqueado.

Una vez en la terminal de bash en el nodo `jupyter`, el siguiente paso consiste en instalar [Jupyter](https://jupyter.org/) en su carpeta de usuario. Existen diferentes formas de instalar **Jupyter**, como se describe a continuación.
  
### Instalando Jupyter vía `micromamba`
  
Si a Ud. le interesa usar notebooks de **Python** o **R**, le recomendamos:

#### Instalar micromamba

Para instalar el administrador de entornos de [micromamba](https://mamba.readthedocs.io/en/latest/user_guide/micromamba.html), le recomendamos seguir el [tutorial](https://gitlab.com/-/snippets/2527216) proveído por los sysadmins del CCAD. 

Alternativamente, explicamos aquí como hacerlo:

1.

2.

#### Crear un environment en `micromamba`



#### Instalar Jupyter en el environment creado en `micromamba`


#### Instalar Julia


#### Anexar Julia al Jupyter del environment de `micromamba`



### Instalando Jupyter vía Julia 

Alternativamente a utlizar `micromamba`, se puede instalar el administrador de notebooks de **Jupyter** vía el administrador de paquetes de **Julia**. Para ello, primero hay que instalar **Julia** y luego instalar **Jupyter** vía **Julia**.

#### Instalando Julia

1. Seleccione y copie de [https://julialang.org/downloads/](https://julialang.org/downloads/) el archivo comprimido con la versión de Julia que desea bajar. Por ejemplo:

    https://julialang-s3.julialang.org/bin/linux/x64/1.9/julia-1.9.1-linux-x86_64.tar.gz

corresponde a `Generic Linux on x86 [help] 	64-bit (glibc)`.

2. Baje dicho archivo al nodo `jupyter` ejecutando el siguiente comando en la terminal de bash del nodo `jupyter`:

        [jperotti@jupyter ~]$ wget https://julialang-s3.julialang.org/bin/linux/x64/1.9/julia-1.9.1-linux-x86_64.tar.gz

3. Descomprima dicho archivo ejecutando

        [jperotti@jupyter ~]$ tar -xf julia-1.9.1-linux-x86_64.tar.gz

Esto creará una carpeta `julia-1.9.1` dentro de su carpeta de usuario. Allí se encuentran los ejecutables de **Julia**.

4. Inicie Julia ejecutando

        [jperotti@jupyter ~]$ ./julia-1.9.1/bin/julia
    
Esto iniciará una consola de **Julia**

           _       _ _(_)_     |  Documentation: https://docs.julialang.org
          (_)     | (_) (_)    |
           _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
          | | | | | | |/ _` |  |
          | | |_| | | | (_| |  |  Version 1.9.1 (2023-06-07)
         _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
        |__/                   |

        julia>
    
5. Ejecute el siguiente comando para instalar algunos paquetes de **Julia** que resultan necesarios para nuestros propósitos:

        julia> using Pkg; Pkg.add("IJulia"); Pkg.add("Plots"); Pkg.add("LaTeXStrings"); Pkg.add("FileIO"); Pkg.add("JLD2")
                
#### Instalando e iniciando Jupyter desde Julia

**Julia** y **Jupyter** son programas diferentes. **Julia** es un lenguaje de programación y **Jupyter** un administrador de notebooks. A continuación instalaremos **Jupyter** vía **Julia**. Para ello:
                
1. Active la libreria `IJulia` ejecutando en la consola de **Julia**:

        julia> using IJulia
        
2. Inicie una notebook ejecutando en la consola de **Julia**:        
        
        julia> notebook()
        
    La notebook no aparecerá en ninguna parte, porque aún faltan completar algunos pasos. En cambio, **Julia** le preguntará si desea instalar **Jupyter** vía **Conda**:
    
        julia> notebook()
        install Jupyter via Conda, y/n? [y]

    Póngale que sí (oprima `y`), y espere a que **Conda** se termine de instalar. Esto va a demorar un buen rato.

2. Al terminarse de instalar **Conda**, deberá aparecer algo cómo lo que sigue:

        julia> notebook()
        [ Info: running setenv(`/home/jperotti/.julia/conda/3/x86_64/bin/jupyter notebook`,...
        
   indicándole a Uds., entre otras cosas, la carpeta en donde se ha instalado **Conda** y **Jupyter**. En este caso, en un directorio oculto llamado `.julia/` en su directorio de usario.

3. A continuación, oprima `Ctrl. + C` para que se cierre la notebook, y luego salga de la consola de **Julia** ejecutando:

        julia> exit()
        
4. Finalmente, ha llegado el momento de iniciar de manera remota, el administrador de notebooks de **Jupyter** que instaló **Julia**. Para ello, ejecute:

        [jperotti@jupyter ~]$ ~/.julia/conda/3/x86_64/bin/jupyter notebook --no-browser --port=8088
        
   Deberá aparecer, entre otras cosas, un link como el siguiente:
   
        http://localhost:8088/?token=346e35e52098854117eb109f5419111df556139c4a550320

5. Copie el link y péguelo en el navegador de su computadora de escritorio. En el mismo, deberá abrirse un administrador de notebooks de **Jupyter** que está corriendo en el nodo `jupyter` del CCAD. Deberá ver en el mismo, el contenido de su carpeta de usuario en el CCAD.

#### Iniciando Jupyter en sesiones posteriores

1. Conectese al nodo `jupyter` ejecutando en una terminal:

        juan@laptop> ssh -L 8088:localhost:8088 usuario@jupyter.ccad.unc.edu.ar
        
    recordando remplazar `usuario` por su nombre de usuario.
   
2. Inicie el administrador de notebooks de **Julia** en modo `no-browser`. Para ello, ejecute

        [jperotti@jupyter ~]$ ~/.julia/conda/3/x86_64/bin/jupyter notebook --no-browser --port=8088
        
    Cómo resultado, debería aparecerle una línea similar a la siguiente:        
    
        http://localhost:8088/?token=346e35e52098854117eb109f5419111df556139c4a550320    
        
3. Copie la linea en el navegador de su computadora de escritorio. Debería aparecerle el administrador de notebooks de **Jupyter** que está corriendo en el nodo `jupyter` del CCAD.
