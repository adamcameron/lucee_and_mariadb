component {

	this.datasources["lucee_and_mariadb"] = {
        type = "mysql",
        host = "database.backend",
        port = 3306,
        database = "lucee_and_mariadb",
        username = "lucee_and_mariadb",
        password = server.system.environment.MARIADB_PASSWORD,
        custom = {
            useUnicode = true,
            characterEncoding = "UTF-8"
        }
    }

    this.datasource = "lucee_and_mariadb"
    this.localMode = "modern"
}
