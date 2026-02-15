function dockerclean --description "Stop and remove all Docker containers"
    set -l count (docker ps -a | tail -n +2 | wc -l | string trim)
    echo "Clearing $count Docker processes"
    for name in (docker ps -a --format '{{.Names}}')
        docker stop $name
        docker rm $name
    end
    echo "Done"
end
