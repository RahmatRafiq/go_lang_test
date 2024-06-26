# Golang Concurrency and Automation Testing


## Description

<p>This application is designed to perform two main operations: fetching all student data (Get All Students) and fetching student data based on ID (Get Student by ID). Additionally, the application also supports concurrency functions such as starting and stopping processes through available endpoints.</p>

## Instalation

### Software Requirement
>- go version go1.22.0
>- mysql 8
>- ginkgo
>- air
>- postman

**1. Clone the project and Install dependencies**

Follow steps 1 and 2 from the previous procedure:

```bash
git clone https://github.com/RahmatRafiq/go_lang_test.git 
cd go_lang_test
go mod download
```

**2. Install Ginkgo (if not already installed)**

Ginkgo might not be included as a project dependency. You can install it globally using Go:

```bash
go get github.com/onsi/ginkgo/v2
go get github.com/onsi/gomega/...
go install github.com/onsi/ginkgo/v2/ginkgo
```

**3. Run the server (if applicable)**

Similar to step 4 in the previous procedure, run the server if your project includes one:

```bash
go run . 
# or
air
```

**4. Run the Ginkgo tests**

Navigate to the project directory and run the Ginkgo tests:

```bash
ginkgo -r *
```


# ISSUES AND SUGGESTIONS
<br>
<h1 align="center"><strong>Thank you</strong> and <em>good luck</em></h>
