package main

import (
	"fmt"
	"os"
	"path/filepath"
	"strings"
)

func main() {
	path := os.Args[1]
	name := strings.TrimSuffix(path, filepath.Ext(path))
	noIndex := strings.ReplaceAll(name, "/index", "")
	fmt.Println(noIndex)
}
