package test

import (
	"math/rand"
	"strconv"
	"testing"
	"os"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)


// Test the Terraform module in examples/complete using Terratest.
func TestExamplesComplete(t *testing.T) {
	t.Parallel()

	randId := strconv.Itoa(rand.Intn(100000))
	attributes := []string{randId}

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../../examples/complete",
		Upgrade:      true,
		// Variables to pass to our Terraform code using -var-file options
		VarFiles: []string{"fixtures.tfvars"},
		// We always include a random attribute so that parallel tests
		// and AWS resources do not interfere with each other
		Vars: map[string]interface{}{
			"attributes": attributes,
			"tfc_agent_token": os.Getenv("TFC_AGENT_TOKEN"),
		},
	})
	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the value of an output variable
	service_account_name := terraform.Output(t, terraformOptions, "service_account_name")
	namespace := terraform.Output(t, terraformOptions, "namespace")

	// Verify we're getting back the outputs we expect
	assert.Equal(t, "eg-ue2-test-example-"+randId, service_account_name)
	assert.Equal(t, "tfc-agent", namespace)
}
