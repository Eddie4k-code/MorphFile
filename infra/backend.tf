terraform {
    backend "pg" {
        conn_str = var.conn_str
    }
}