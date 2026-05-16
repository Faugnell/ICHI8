# ichi8.gg Deployment Plan

The planned production domain is:

```txt
https://ichi8.gg
```

## Target Architecture

```txt
Browser / mobile app
        |
        v
https://ichi8.gg
        |
        v
Nginx / reverse proxy
        |
        +--> Flutter Web static files
        |
        +--> Rust API service
                 |
                 v
              Database
```

## Recommended DNS

```txt
ichi8.gg      A / AAAA -> server IP
www.ichi8.gg  CNAME    -> ichi8.gg
api.ichi8.gg  A / AAAA -> server IP
```

## Suggested Routing

```txt
https://ichi8.gg       -> Flutter Web app
https://api.ichi8.gg   -> Rust API
```

## Build Flutter Web

For a root-domain deployment, build without a repository subpath:

```sh
cd apps/client
flutter build web --release
```

The generated files will be in:

```txt
apps/client/build/web
```

## Backend

The Rust API should run as a long-lived service behind Nginx, Docker, or a hosting platform that supports Rust services.

The frontend should never connect directly to the database. All database access must go through the backend.
