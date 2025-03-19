package main

import (
	"fmt"
	"os"
	"os/exec"
	"strings"
)

func main() {
	if len(os.Args) < 2 {
		fmt.Println("Uso: ./killport <porta>")
		return
	}

	port := os.Args[1]
	cmd := exec.Command("lsof", "-i", ":"+port)
	output, err := cmd.Output()
	if err != nil {
		fmt.Println("Erro ao executar lsof:", err)
		return
	}

	lines := strings.Split(string(output), "\n")
	if len(lines) < 2 {
		fmt.Println("Nenhum processo encontrado na porta", port)
		return
	}

	fields := strings.Fields(lines[1])
	if len(fields) < 2 {
		fmt.Println("Erro ao obter PID")
		return
	}

	pid := fields[1]
	fmt.Println("Matando processo com PID:", pid)
	killCmd := exec.Command("kill", "-9", pid)
	if err := killCmd.Run(); err != nil {
		fmt.Println("Erro ao matar processo:", err)
	} else {
		fmt.Println("Processo", pid, "finalizado com sucesso!")
	}
}



