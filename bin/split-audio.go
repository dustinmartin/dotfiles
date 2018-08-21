package main

import (
	"fmt"
	// "os"
	"log"
	"os/exec"
)

func main() {
	// audioFilePath := os.Args[1]

	// cmdStr := "echo 'foo'"

	// cmd := exec.Command(cmdStr)
	cmd := exec.Command("ffmpeg")
	// cmd := exec.Command("bash", cmdStr)

	out, err := cmd.CombinedOutput()

	if err != nil {
		// log.Fatalf("cmd.Run() failed with %s\n", err)
		// fmt.Printf("error:\n%s\n", string(err))
		log.Fatal(err)
	}

	fmt.Printf("combined out:\n%s\n", string(out))
}
