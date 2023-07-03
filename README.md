# jupyter-ccad

## ¿Que ventajas trae usar **jupyter notebooks**?

1. Ud. puede programar, calcular, analizar resultados, comentarlos y graficarlos, en un mismo entorno de trabajo.

2. Facilita el paradigma de programación interactiva o [REPL](https://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop) (Read, Eval, Print, Loop). Esto le permite a Ud. evaluar el código a medida que lo va desarrollando, acelerando el proceso y reduciendo la probabilidad de que se cometan errores.

## ¿Que ventajas trae usar **jupyter notebooks** en el cluster `jupyter` del CCAD?

1. Poder usar notebooks de [Julia](https://julialang.org/), [Python](https://www.python.org/) o [R](https://www.r-project.org/) para desarrollar y testear código en el nodo `jupyter` del **CCAD**.

2. Luego, usar el cluster `serafin` o `mendieta` para lanzar grandes corridas.

3. Usar [serialización](https://es.wikipedia.org/wiki/Serializaci%C3%B3n) para almacenar los datos. Por ejemplo, usar [pickle](https://docs.python.org/3/library/pickle.html) en **Python** o [JLD2](https://github.com/JuliaIO/JLD2.jl) en **Julia**.

4. Volver a usar notebooks para analizar y graficar los resultados.

## ¿Cómo usar el nodo `jupyter` del CCAD?

1. Abrir una cuenta en el CCAD llenando un formulario: [https://ccad.unc.edu.ar/servicios/pedido-de-cuentas/](https://ccad.unc.edu.ar/servicios/pedido-de-cuentas/). Los sys-admin del CCAD le abrirán una cuenta para acceder a los clusters, y para acceder a un chat de consultas en Zulip: [https://ccadunc.zulipchat.com](https://ccadunc.zulipchat.com). Utilice Zulip para evacuar sus dudas.

2. Configurar su acceso a los clusters del CCAD utilizando el protocolo de llaves publicas y privadas: [https://dokuwiki.ccad.unc.edu.ar/doku.php?id=conexion](https://dokuwiki.ccad.unc.edu.ar/doku.php?id=conexion)

3. 
