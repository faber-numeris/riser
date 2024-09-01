package cmd

import (
	"fmt"

	"github.com/rafaelsousa/riser/postgres"
	"github.com/spf13/cobra"
)

var postgresCmd = &cobra.Command{
	Use:   "postgres",
	Short: "Generate code for a Postgres database",
	Long:  `Generate code for a Postgres database.`,
	RunE: func(cmd *cobra.Command, args []string) error {
		conn, err := cmd.Flags().GetString("connection")
		if err != nil {
			fmt.Printf("Error: %s\n", err)
			return err
		}

		postgres := postgres.New(conn)

		postgres.Generate()

		return nil
	},
}
