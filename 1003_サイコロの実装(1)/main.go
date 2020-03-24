package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
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

func intMap(callback func(int) int, arr []int) []int {
	var res []int = []int{}
	for _, v := range arr {
		res = append(res, callback(v))
	}
	return res
}

func intFilter(callback func(int) bool, arr []int) []int {
	var res []int = []int{}
	for _, v := range arr {
		if callback(v) {
			res = append(res, v)
		}
	}
	return res
}

func intAll(callback func(int) bool, arr []int) bool {
	var res bool = true
	for _, v := range arr {
		res = res && callback(v)
	}
	return res
}

func main() {
	// var input = scanner().getLine()
	var input = "6"
	var n, _ = strconv.Atoi(input)

	var l1 []int = intMap(func(i int) int {
		return i%6 + 1
	}, getRange(1, n))

	var l2 []int = intMap(func(i int) int {
		ll := intFilter(func(j int) bool {
			return i == j
		}, l1)
		return len(ll)
	}, getRange(1, 6))

	var result bool = intAll(func(i int) bool {
		return i == l2[0]
	}, l2)

	if result {
		fmt.Println("Yes")
	} else {
		fmt.Println("No")
	}
}
