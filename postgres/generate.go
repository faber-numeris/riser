package postgres

import "database/sql"

func (generator Generator) Generate() {
	db, err := sql.Open("postgres", generator.ConnectionString())
}
