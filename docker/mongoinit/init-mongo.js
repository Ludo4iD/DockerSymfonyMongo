db.createUser(
  {
    user: "root",
    pwd: "secret",
    roles: {
      role: "readWrite",
      db: "your-database-name"
    }
  }
)