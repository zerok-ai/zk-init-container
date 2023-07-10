package cmd

import (
	"fmt"
	"net/http"
	"os"
	"time"
)

func main() {
	url := os.Getenv("URL")
	if url == "" {
		fmt.Println("URL not provided")
		os.Exit(1)
	}

	// Start hitting the URL
	for {
		fmt.Println("Hitting URL: ", url)
		resp, err := http.Get(url)
		if err == nil && resp.StatusCode == http.StatusOK {
			fmt.Println("Received 200 OK response")
			break
		}
		fmt.Println("Retrying...")
		time.Sleep(2 * time.Second)
	}
}
