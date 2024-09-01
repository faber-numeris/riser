-- name: CreateCustomer :one
        INSERT INTO customers
                    (name, email, anniversary, home_address, work_address, home_phone, mobile_phone, work_phone)
             VALUES (@name, @email, @anniversary, @home_address, @work_address, @home_phone, @mobile_phone, @work_phone)
          RETURNING *;

-- name: UpdateCustomer :one
        UPDATE customers
           SET name         = :name,
               email        = :email,
               anniversary  = :anniversary,
               home_address = :homeAddress,
               work_address = :workAddress,
               home_phone   = :homePhone,
               mobile_phone = :mobilePhone,
               work_phone   = :workPhone,
               updated_at   = :updatedAt,
               deleted_at   = :deletedAt
         WHERE id = :id
     RETURNING *;

-- name: DeleteCustomer :one
        UPDATE customers
           SET deleted_at = @deleted_at
         WHERE id = :id
     RETURNING *;

-- name: SelectOneCustomer :one
        SELECT *
          FROM customers
         WHERE id = @id;

-- name: ListCustomers :many
        SELECT *
          FROM customers
         WHERE deleted_at IS NULL
           AND (sqlc.narg('name') IS NULL OR name ILIKE sqlc.narg('name'))
           AND (sqlc.narg('email') IS NULL OR email ILIKE sqlc.narg('email'))
           AND (sqlc.narg('anniversary') IS NULL OR anniversary = sqlc.narg('anniversary'))
           AND (sqlc.narg('home_address') IS NULL OR home_address ILIKE sqlc.narg('home_address'))
           AND (sqlc.narg('work_address') IS NULL OR work_address ILIKE sqlc.narg('work_address'))
           AND (sqlc.narg('home_phone') IS NULL OR home_phone ILIKE sqlc.narg('home_phone'))
           AND (sqlc.narg('mobile_phone') IS NULL OR mobile_phone ILIKE sqlc.narg('mobile_phone'))
           AND (sqlc.narg('work_phone') IS NULL OR work_phone ILIKE sqlc.narg('work_phone'))
       LIMIT $1
      OFFSET $2;
