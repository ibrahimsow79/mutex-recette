package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func readMultiLines() string {
	var str string
	input := bufio.NewScanner(os.Stdin) //Creating a Scanner that will read the input from the console

	for input.Scan() {
		if input.Text() == "" {
			break
		}
		str += input.Text()
	}
	return str
}

func main() {
	script := "useradd %[1]s && mkdir /home/%[1]s/.ssh && chown 700 /home/%[1]s/.ssh && echo \"%[2]s\" > /home/%[1]s/.ssh/authorized_keys && chmod 600 /home/%[1]s/.ssh/authorized_keys && chown -R %[1]s:%[1]s /home/%[1]s"

	fmt.Println("----------------------------------------")
	fmt.Println("Création du script de génération d'utilisateur")
	fmt.Println("----------------------------------------")

	var name, publicKey string
	fmt.Print("Nom de l'utilisateur : ")
	fmt.Scanf("%s", &name)
	fmt.Println("Lecture de la clé publique :")

	publicKey = readMultiLines()
	if !strings.HasPrefix(publicKey, "ssh-rsa") {
		publicKey = "ssh-rsa " + publicKey
	}

	fmt.Println("\n--------------------------------------\n")
	fmt.Printf(script, name, publicKey)

	fmt.Println("\n--------------------------------------\n")
}
