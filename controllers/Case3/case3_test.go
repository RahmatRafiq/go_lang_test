package case3_test

import (
	"Golang_CRUD_Native/routes"
	"net/http"
	"net/http/httptest"
	"testing"

	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
)

func TestCase3(t *testing.T) {
	RegisterFailHandler(Fail)
	t.Run("get all Student", unittestgetall)
	t.Run("get Student by id", unittestget)
	RunSpecs(t, "MinMax Test")
}

func unittestgetall(t *testing.T) {
	router := routes.Routes()

	Describe("Get All Students", func() {
		w := httptest.NewRecorder()
		req, _ := http.NewRequest("GET", "/students/all", nil)
		router.ServeHTTP(w, req)

		It("Should return 200", func() {
			Expect(w.Code).To(Equal(200))
		})

	})
}

func unittestget(t *testing.T) {
	router := routes.Routes()

	Describe("Get Student by id 18", func() {
		w := httptest.NewRecorder()
		req, _ := http.NewRequest("GET", "/students?id=18", nil)
		router.ServeHTTP(w, req)
		It("Should return 200", func() {
			Expect(w.Code).To(Equal(200))
		})
	})
	Describe("Get Student by id 1", func() {
		w := httptest.NewRecorder()
		req, _ := http.NewRequest("GET", "/students?id=1", nil)
		router.ServeHTTP(w, req)
		It("Should return data not found", func() {
			Expect(w.Code).To(Equal(404))
		})
	})
}
