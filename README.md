# Run Zoneminder in Docker
This repo is an easy implementation of running Zoneminder (zm) portably in docker. This is achieved by using a separate container for the database and bind mounts to store data in a location which (ideally) can be persisted and backed up.


## Benefits
The perks of using Zoneminder in this manner is that everything is fully scripted. If your computer fails to boot or a drive goes bad, there is no lengthy install process to get zm back up and running. Simply re-build the containers and you back in action! Plus, if you keep backups of your database data, all your settings & config will be present!

TL;DR - I see this as a fully portable and reusable way to run Zoneminder without the hastle of needing to undergo a complex install process each time. Plus you can store data where you want without any zm restrictions.


## Included In This Repo
### ./Build
This directory contains the resources necessary to build the Zoneminder docker image.

### ./docker-compose.yml
The docker compose file which details in yaml format how docker should create this stack and its dependencies.


## Pre-requisites
You should have the below before proceeding

1. Docker 
2. Docker Compose
3. About 20 minutes of time


# Setup
This repo contains all the leg work to get Zoneminder running, however there are a few configurations you need to make.

## 1. Clone this repo to your local machine
Run this command to clone the repo to your machine:

`git clone https://github.com/devmaster24/zoneminder-docker.git`

## 2. (Optional) Configure Email Address for Email alerts
If you want to receive email alerts from Zoneminder, we need to configure msmtprc. 

1. Navigate to the build directory in this repo and open the `msmtprc` file
2. On line 9 - set the host to your SMTP mail server
    - For reference, Google's SMTP mail server is: `smtp.gmail.com`
3. Confirm the port on line 10 is correct 
4. On line 11 - set the email address you would like emails to appear to originate from
5. On line 12 - set the email address you are going to send emails from (should be the same as line 11)
6. On line 13 - put the password to the email you entered on line 12
7. Save and close the file

## 3. Build the Zoneminder Docker Image
In the same directory as the `docker-compose.yml` file, run:

`docker-compose build`

This will take a while as it creates a Docker container and installs Zoneminder from scratch. Inspect the output for any failures - there should be none.

For those curious, I scripted most of the install process outlined in the doc: https://zoneminder.readthedocs.io/en/latest/installationguide/debian.html#easy-way-debian-11-bullseye

## 4. Configure the volume mounts
I chose to use bind volume mounts which allows me to manage my data Zoneminder creates separate from the application. The benefit of this is that I need to worry about backing up only this data and everything else can be torn down and brought back up on a whim.

Bind mounts require a location on your computer and are (AT A VERY HIGH LEVEL) a shared folder with this docker container and your machine. Everything you put in this directory will be accessable to the docker container and vice versa.

1. Open the `docker-compose.yml` file
2. Edit line 20 - set this to the absolute path on your computer where you want to store Zoneminder's images
3. Edit line 23 - set this to the absolute path on your computer where you want to store Zoneminder's videos
4. Edit line 40 - set this to the absolute path on your computer where you want to store the Maria DB's data

On my machine I put everything in a `zm` directory with the 3 sub directories below it - making it very easy to locate and back up all my data. An example of this folder structure on linux would look like:

```sh
/mnt/data/zm/images
/mnt/data/zm/events
/mnt/data/zm/zm_db
```

If these directories do not exist, docker-compose will fail to start the containers with an error stating something like `Error response from daemon: invalid mount config for type "bind": bind source path does not exist:`. If you see this, double check you've created these folders and the path is correct.


## 5 Set The Timezone
In the `docker-compose.yml` file, edit the 2 timezone environment variables (lines 17 & 33) to reflect your local timezone if not in Chicago.

Assuming you have a linux based machine, you can list avaiable timezones by looking in this directory: 

`ls -l /usr/share/zoneinfo/`

## 6. Set Maria DB Credentails
Open the `docker-compose.yml` file and edit lines 35 & 36.

Line 35 will be the password Zoneminder uses to log into the database - you can use the default `zmpass`

Line 36 will be the root (admin) user's password for the Maria DB - only you should be using this during our install

Replace the text `<PICK_A_PASSWORD>` with your password - I.E. `zmpass`.

If you use a password other than `zmpass` for the Zoneminder account, please follow the instructions in the article from the Zoneminder docs on how to configure Zoneminder to use this new password https://zoneminder.readthedocs.io/en/stable/installationguide/multiserver.html. You will also need to rebuild the zoneminder docker image - `docker-compose build`.

Storing passwords in a docker-compose.yml file is not the most secure as your credentials are in plain text. If you want to be secure - look into docker secrets https://docs.docker.com/engine/reference/commandline/secret_create/.

## 7. Configure the database
Start only the maria db container so we can perform our one time configurations.

`docker-compose up db -d`  - The -d flag is to detatch from the running container's output

Once this container is started, we need to attach to it and create the zoneminder database.
1. First copy our SQL scripts from the build directory
    - Copy `build/init.sql` and `build/init_2.sql` to the location you set on line 40 in the `docker-compose.yml` file. This will make these files avaiable in your docker image so we can execute them. Note you may need to use sudo to do the copy.
      - These files are also available in the Zoneminder docker container if you wanted to grab them from there. I copied them to make life easier and tweaked line 1124 to point to the triggers which are stored in the init_2.sql file.
2. Attach to the maria db container
    - Run: `docker container exec -it zm_maria_db /bin/bash`
    - Welcome to the maria db docker container :)
3. Start a maria db shell session
    - Run: `mariadb -p`
    - You'll be prompted to enter the password you set in step 6 for the root user
    - Upon successful login, you should see a prompt like: `MariaDB [(none)]>` 
    - Welcome to your database :)
4. Run the below commands (changing zmpass if you used something different):
    ```sql
    CREATE USER 'zmuser'@'172.20.0.3' IDENTIFIED BY 'zmpass';
    GRANT ALL ON zm.* TO 'zmuser'@'172.20.0.3';
    FLUSH PRIVILEGES;
    exit;
    ```
5. Execute our init scripts we copied
    - Run: `mariadb -u zmuser -pzmpass < /var/lib/mysql/init.sql`
    - Where zmpass is your password for Zoneminder's SQL account
    - There should be no output after running this command, meaning it was successful
    - You can check if it was successful by checking the exit code of the previous command by running `echo $?` which should yeild 0
6. Detach from the container - goodbye :(
    - Run: `exit`

Thanks for sticking with me - this was the most complex step, and you don't need to do this again as long as you don't lose your database data.

Lets shut off our database in preperation for the final step.

`docker-compose down`

## 8. Start Zoneminder
Now all the pieces are in place, we can finally taste the fruits of our labour. Start the zoneminder stack:

`docker-compose up -d`

You should now be able to access Zoneminder at `http://127.0.0.1:8080/zm` in your browser.

If Zoneminder does not come up, see the troubleshooting section or create an issue on this repo.

## 9. Backup and Maintenance
Make sure you have back-ups of the locations you set in step 4 - this is the data for your Zoneminder server. If you lose this you'll need to re-execute the setup steps and all your zoneminder settings will be gone. 

On the plus side - if you change computers running Zoneminder all you need is to copy this data (and this repo) and you can re-start Zoneminder by simply running `docker-compose up`.

Also, as is good pratice, you should rebuild your Zoneminder container on a regular basis to ensure it and Zoneminder receive software updates.


# Troubleshooting
Here are some helpful commands to assist in troubleshooting if needed

```sh
# To view the logs of the Zoneminder container:
docker logs zoneminder

# To view the logs of the Maria DB container:
docker logs zm_maria_db

# To view all containers
docker container ls -a

# To manually start/stop a container
docker container stop <container_name>
docker container start <container_name>

# To list all the images
docker image ls -a

# To delete an image 
docker image rm <image_name>

# To list the docker networks
docker network ls
```

If you need to check the users in your SQL server
```sql
SELECT host, user FROM mysql.user;
```

# Resources:
- https://github.com/ZoneMinder/zmdockerfiles/blob/master/docker-compose.yaml
- https://zoneminder.readthedocs.io/en/latest/installationguide/debian.html#easy-way-debian-11-bullseye
- https://zoneminder.readthedocs.io/en/stable/installationguide/multiserver.html