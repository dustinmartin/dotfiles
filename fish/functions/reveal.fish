function reveal --description "Open the current directory in the system file manager"
    if test (uname) = Darwin
        open .
    else if command -q xdg-open
        xdg-open .
    else
        echo "reveal: no supported file manager found"
        return 1
    end
end
