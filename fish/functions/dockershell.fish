function dockershell --description "Connect to a running Docker container"
    if test (count $argv) -gt 1
        docker exec -e COLUMNS=(tput cols) -e LINES=(tput lines) -it $argv[1] /bin/bash -c $argv[2..]
    else
        docker exec -e COLUMNS=(tput cols) -e LINES=(tput lines) -it $argv[1] /bin/bash
    end
end
