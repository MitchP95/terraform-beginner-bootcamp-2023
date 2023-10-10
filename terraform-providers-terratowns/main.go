// Main package is where program execution starts in Go
package main

// fmt is format (formatted IO operations)
import (
	"bytes"
	"context"
	"encoding/json"
	"net/http"
	"log"
	"fmt"
	"github.com/google/uuid"
	"github.com/hashicorp/terraform-plugin-sdk/v2/diag"
	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema"
	"github.com/hashicorp/terraform-plugin-sdk/v2/plugin"
)

func main() {
	plugin.Serve(&plugin.ServeOpts{
		ProviderFunc: Provider
	})

	fmt.Println("Hello, world!")
}

func Provider() *schema.Provider {
	var p *schema.Provider
	p = &schema.Provider {
		/* TODO - Complete object definition */
	}
}