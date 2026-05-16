# OVH Database

To connect ICHI8 to an OVH PostgreSQL database, the backend needs a `DATABASE_URL`.

Do not commit real credentials to the repository. Put them in `.env` locally or in the production environment variables on the server.

The current backend is configured for PostgreSQL. If the OVH service is MySQL, the backend database layer must be switched from PostgreSQL to MySQL before using it in production.

## Required Information

- Database engine: PostgreSQL
- Hostname
- Port
- Database name
- Username
- Password
- SSL requirement, usually `sslmode=require` for hosted databases

## Format

```txt
DATABASE_URL=postgres://USER:PASSWORD@HOST:PORT/DATABASE?sslmode=require
```

## Example

```txt
DATABASE_URL=postgres://ichi8_user:secret@postgresql-example.clusterXXX.database.cloud.ovh.net:20184/ichi8?sslmode=require
```

## Notes

The initial schema uses UUID defaults through a PostgreSQL extension. If the OVH database does not allow `CREATE EXTENSION`, the server can generate UUIDs in application code instead.
