package database

type Generator interface {
	Generate()
	ConnectionString() string
	OutputDir() string
}
