using IJulia
jupyter = IJulia.find_jupyter_subcommand("")[1]
run(`$(jupyter) notebook list`)
