package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

type scanner struct {
	scanner *bufio.Scanner
}

func (m scanner) nextLine() string {
	m.scanner.Scan()
	return m.scanner.Text()
}

func split(str string) []int {
	var list []string = strings.Split(str, " ")
	s := []int{}

	for _, x := range list {
		i, _ := strconv.Atoi(x)
		s = append(s, i)
	}
	return s
}

func contains(s []int, e int) bool {
	for _, v := range s {
		if v == e {
			return true
		}
	}
	return false
}

func main() {
	var s scanner = scanner{bufio.NewScanner(os.Stdin)}
	var list []int = split(s.nextLine())
	var mrMaxList []int = split(s.nextLine())
	var maxValuList []int = split(s.nextLine())

	var wantedNum int = list[0]

	var isMrMax bool = contains(mrMaxList, wantedNum)
	var isMaxValu bool = contains(maxValuList, wantedNum)

	if isMrMax && isMaxValu {
		fmt.Println("MrMaxValu")
	} else if isMrMax {
		fmt.Println("MrMax")
	} else if isMaxValu {
		fmt.Println("MaxValu")
	} else {
		fmt.Println("-1")
	}
}
