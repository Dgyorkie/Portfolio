# Portfolio

A collection of web development and database projects.

## Projects

### CV Website (`CV website/`)

A PHP and MySQL website with user registration, session-based access, and a page for viewing course information. The folder also contains the site's CSS and image assets.

The PHP pages use PDO to connect to a local MySQL database named `course`. Update the connection settings in `connectdb.php` for your environment. The login links refer to `index.php`, which is not currently included in this repository.

### Employee Database (`Employee Database/`)

A MySQL database project for managing clients, projects, available team members, skills, experience levels, and project assignments.

- `schema.sql` defines the database tables and relationships.
- `queries.sql` contains example data inserts and reporting queries. Review the SQL statements and date values before running the script.

## Requirements

- PHP with PDO MySQL support and a MySQL server for the CV website.
- MySQL for the employee database project.
