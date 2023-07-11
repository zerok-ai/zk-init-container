package main

import (
	"fmt"
	"net/http"
	"os"
	"time"
)

var envVar = "URL"
var retryInterval = 2 * time.Second

func main() {
	url := os.Getenv(envVar)
	if url == "" {
		fmt.Println("URL not provided")
		panic("URL not provided")
	}

	// Start hitting the URL
	for {
		fmt.Println("Hitting URL: ", url)
		resp, err := http.Get(url)
		if err == nil && RespCodeIsOk(resp.StatusCode) {
			fmt.Println("Received OK response")
			break
		}
		fmt.Println("Retrying...")
		time.Sleep(retryInterval)
	}
}

func RespCodeIsOk(status int) bool {
	if status > 199 && status < 300 {
		return true
	}
	return false

}
