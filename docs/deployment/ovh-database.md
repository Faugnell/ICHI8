# OVH Database

The current OVH database available for ICHI8 is MySQL 8.4.

Do not commit real credentials to the repository. Put them in `.env` locally or in the production environment variables on the server.

The current backend scaffold was initially configured for PostgreSQL. To use the OVH MySQL database in production, the backend SQLx configuration and migrations must be switched to MySQL.

## Required Information

- Database engine: MySQL 8.4
- Hostname
- Port
- Database name
- Username
- Password
- SSL requirement, if enabled by OVH

## Format

```txt
DATABASE_URL=mysql://USER:PASSWORD@HOST:PORT/DATABASE
```

## Example

```txt
DATABASE_URL=mysql://ichi8_user:secret@example.mysql.db:3306/ichi8
```

## Notes

The frontend must never connect directly to MySQL. The Rust backend owns all database access.

Some OVH shared hosting databases are designed for use from the OVH hosting cluster and may not accept external connections from another provider. This must be checked before choosing where to host the Rust API.
