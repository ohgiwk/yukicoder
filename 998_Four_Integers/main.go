package main

import (
	"bufio"
	"fmt"
	"os"
	"reflect"
	"sort"
	"strconv"
	"strings"
)

func scanner() func() string {
	var scanner = bufio.NewScanner(os.Stdin)
	return func() string {
		scanner.Scan()
		return scanner.Text()
	}
}

func getRange(start int, end int) []int {
	var l = []int{}
	for i := start; i <= end; i++ {
		l = append(l, i)
	}
	return l
}

func max(a []int) int {
	max := a[0]
	for _, i := range a {
		if i > max {
			max = i
		}
	}
	return max
}

func min(a []int) int {
	min := a[0]
	for _, i := range a {
		if i < min {
			min = i
		}
	}
	return min
}

func main() {
	var readLine = scanner()
	var input string = readLine()
	// var input string = "1 2 3 4"

	var l1 []int = []int{}
	for _, x := range strings.Split(input, " ") {
		i, _ := strconv.Atoi(x)
		l1 = append(l1, i)
	}
	sort.Ints(l1)

	var l2 []int = getRange(min(l1), max(l1))

	if reflect.DeepEqual(l1, l2) {
		fmt.Println("Yes")
	} else {
		fmt.Println("No")
	}
}
