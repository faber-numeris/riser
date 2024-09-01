package postgres

import "github.com/rafaelsousa/riser/generators/database"

var _ database.Generator = &Generator{}

type Generator struct {
	connectionString string
}

func New(connectionString string) *Generator {
	return &Generator{
		connectionString: connectionString,
	}
}

func (generator Generator) ConnectionString() string {
	return generator.connectionString
}

func (generator Generator) OutputDir() string {
	//TODO implement me
	panic("implement me")
}
