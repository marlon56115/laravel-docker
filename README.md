
## About ##

Docker setup to run a laravel app

##  Containers ##

:heavy_check_mark: Laravel app\
:heavy_check_mark: Database\
:heavy_check_mark: PhpMyAdmin

## Requirements ##

- Before starting :checkered_flag:, you need to have [Git](https://git-scm.com) and [Docker](https://docs.docker.com/engine/install/) installed.
- Laravel project to run
## :checkered_flag: configurations ##
Add or Edit the followings variables to your .env file

`DB_CONNECTION=mysql` <br>
`DB_HOST=app-service-mysql`<br>
`DB_PORT=3306`<br>
`DB_DATABASE=app-service`<br>
`DB_USERNAME=yourname`<br>
`DB_PASSWORD=yourpassword`<br>
`FORWARD_DB_PORT=3310`<br>
`PHP_MY_ADMIN_PORT=9001`<br>
`APP_URL=http://localhost`<br>
`APP_PORT=9000`
## :checkered_flag: Starting ##

```bash
# Clone this project
$ git clone https://github.com/marlon56115/docker-laravel

# Copy the files inside your project
$ mkdir  {{your_project_directory}}/docker && cp docker/*  {{your_project_directory}}/docker && cp docker-compose.yml  {{your_project_directory}}

# Create the docker network
$ docker network create app-network

# Run the app
$ docker-compose up --build

# The server will initialize in the <http://localhost:9000>
# The phpmyadmin will initialize in the <http://localhost:9001>

```

## :memo: License ##

This project is under license from MIT. For more details, see the [LICENSE](LICENSE.md) file.


Made with :heart: by <a href="https://github.com/marlon56115" target="_blank">Marlon</a>

&#xa0;

<a href="#top">Back to top</a>
