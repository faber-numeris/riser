package cmd

import (
	"os"

	"github.com/spf13/cobra"
)

var rootCmd = &cobra.Command{
	Use:   "riser",
	Short: "Opinionated CRUD generator for Go",
	Long:  `Riser is a Database First code generator for Go. We assume you have a database schema and want to generate a simple CRUD API.`,
}

func Execute() {
	rootCmd.PersistentFlags().StringP("connection", "c", "", "Database connection string")

	rootCmd.AddCommand(postgresCmd)

	err := rootCmd.Execute()
	if err != nil {
		os.Exit(1)
	}
}
