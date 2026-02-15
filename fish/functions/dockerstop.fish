function dockerstop --description "Stop all running Docker containers"
    docker kill (docker ps -q)
end
