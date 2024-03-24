package case5

import (
	"fmt"
	"math/rand"
	"sync"
	"time"

	"github.com/gin-gonic/gin"
)

type Token struct {
	Token            string
	mu               sync.Mutex
	isConcurrencyRun bool
	stopCh           chan struct{}
}

func (t *Token) Stopconcurrency(ctx *gin.Context) {
	t.mu.Lock()
	defer t.mu.Unlock()

	if t.isConcurrencyRun {
		close(t.stopCh)
		t.isConcurrencyRun = false
	}
}

func (t *Token) Startconcurrency(ctx *gin.Context) {
	t.mu.Lock()
	defer t.mu.Unlock()

	if !t.isConcurrencyRun {
		t.stopCh = make(chan struct{})
		t.isConcurrencyRun = true

		go t.concurrentProcess()
	}
}

func (t *Token) concurrentProcess() {
	for {
		select {
		case <-t.stopCh:
			return
		default:
			t.Token = fmt.Sprintf("Token-%d", rand.Intn(100))
			fmt.Println("Random Number:", t.Token)
			// fmt.Println("Random Number:", rand.Intn(100))
			time.Sleep(time.Second)
		}
	}
}

func (t *Token) GetToken(ctx *gin.Context) {
	t.mu.Lock()
	defer t.mu.Unlock()

	ctx.JSON(200, gin.H{
		"token": t.Token,
	})
}
