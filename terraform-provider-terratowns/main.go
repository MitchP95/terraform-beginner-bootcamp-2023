// Main package is where program execution starts in Go
package main

// fmt is format (formatted IO operations)
import (
	// "bytes"
	// "context"
	// "encoding/json"
	// "net/http"
	// "log"
	"fmt"
	// "github.com/google/uuid"
	// "github.com/hashicorp/terraform-plugin-sdk/v2/diag"
	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema"
	"github.com/hashicorp/terraform-plugin-sdk/v2/plugin"
)

func main() {
	plugin.Serve(&plugin.ServeOpts{
		ProviderFunc: Provider,
	})
	
	fmt.Println("Hello, world!")
}

// Title case functions are exported
func Provider() *schema.Provider {
	var p *schema.Provider
	p = &schema.Provider {
		ResourcesMap:  map[string]*schema.Resource{
			// "terratowns_home": Resource(),
		},
		DataSourcesMap:  map[string]*schema.Resource{
			
		},
		Schema: map[string]*schema.Schema{
			"endpoint": {
				Type: schema.TypeString,
				Required: true,
				Description: "Endpoint for hte external service",
			},
			"token": {
				Type: schema.TypeString,
				Sensitive: true,
				Required: true,
				Description: "Bearer token for authorization",
			},
			"user_uuid": {
				Type: schema.TypeString,
				Required: true,
				Description: "UUID for configuration",
				// ValidateFunc: validateUUID,
			},
		},
	}
	
	// p.ConfigureContextFunc = providerConfigure(p)
	return p
}

// func validateUUID(v interface{}, k string) (ws []string, errors []error) {
// 	log.Print("validateUUID:start")
// 	value := v.(string)
// 	if _, err := uuid.Parse(value); err != nil {
// 		errors = append(errors, fmt.Errorf("invalid UUID format"))
// 	}
// 	log.Print("validateUUID:end")
// 	return
// }