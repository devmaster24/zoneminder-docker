# Run Zoneminder in Docker
This repo is an easy implementation of running Zoneminder (zm) portably in docker.


## Benefits
The perks of using Zoneminder in this manner is that everything is fully scripted. If your computer fails to boot or a drive goes bad, there is no lengthy install process to get zm back up and running. Simply re-build the containers and you back in action! Plus, if you keep backups of your database data, all your settings & config will be present!


## Included In This Repo
### ./Build
This directory contains the resources necessary to build the Zoneminder docker image.

### ./docker-compose.yml
The docker compose file which details in yaml format how docker should create this stack and its dependencies.


## Pre-requisites
You should have the below before proceeding

1. Docker 
2. Docker Compose
3. About 10 minutes of time


# Setup
This repo contains all the leg work to get Zoneminder running, however there are a few configurations you need to make.

## 1. Clone this repo to your local machine
Run this command to clone the repo to your machine:

`git clone https://github.com/devmaster24/zoneminder-docker.git`


## 2. Configure the volume mounts
I chose to use bind volume mounts which allows me to manage my data Zoneminder creates separate from the application. The benefit of this is that I need to worry about backing up only this data and everything else can be torn down and brought back up on a whim.

Bind mounts require a location on your computer and are (AT A VERY HIGH LEVEL) a shared folder with this docker container and your machine. Everything you put in this directory will be accessable to the docker container and vice versa.

1. Open the `docker-compose.yml` file
2. Edit line 16 - set this to the absolute path on your computer where you want to store Zoneminder's images
3. Edit line 19 - set this to the absolute path on your computer where you want to store Zoneminder's videos
4. Edit line 22 - set this to the absolute path on your computer where you want to store the Maria DB's data

On my machine I put everything in a `zm` directory with the 3 sub directories below it - making it very easy to locate and back up all my data. An example of this folder structure on linux would look like:

```bash
/mnt/data/zm/images
/mnt/data/zm/events
/mnt/data/zm/zm_db
```

If these directories do not exist, docker-compose will fail to start the containers with an error stating something like `Error response from daemon: invalid mount config for type "bind": bind source path does not exist:`. If you see this, double check you've created these folders and the path is correct.

Also - the images & events data need to be owned by www-data (ID: 33) else the container will fail to write to them.

```bash
sudo chown -R 33:33 /path/to/images
sudo chown -R 33:33 /path/to/events
```

## 3 Set The Timezone
In the `docker-compose.yml` file, edit the 2 timezone environment variables (lines 13) to reflect your local timezone if not in Chicago.

Assuming you have a linux based machine, you can list avaiable timezones by looking in this directory: 

`ls -l /usr/share/zoneinfo/`

## 4. Start Zoneminder
Now all the pieces are in place, we can finally taste the fruits of our labour. Start the zoneminder stack - which will also build the image if it does not exist already.

`docker compose up -d`

This will take a while as it creates a Docker container and installs Zoneminder from the Debian package archive. Inspect the output for any failures - there should be none.

For those curious, I scripted most of the install process outlined in the doc: https://zoneminder.readthedocs.io/en/latest/installationguide/debian.html#easy-way-debian-11-bullseye


You should now be able to access Zoneminder at `http://127.0.0.1:8080/zm` in your browser.

If Zoneminder does not come up, see the troubleshooting section or create an issue on this repo.

## 5. Backup and Maintenance
Make sure you have back-ups of the locations you set in step 2 - this is the data for your Zoneminder server. If you lose this all your zoneminder data & config will be gone.

On the plus side - if you change computers running Zoneminder all you need is to copy this data (and this repo) and you can re-start Zoneminder by simply running `docker compose up -d`.

Also, as is good pratice, you should rebuild your Zoneminder container on a regular basis to ensure it and Zoneminder receive software updates.


# Troubleshooting
Here are some helpful commands to assist in troubleshooting if needed

```sh
# To view the logs of the Zoneminder container:
docker logs zoneminder

# To view all containers
docker container ls -a

# To manually start/stop a container
docker container stop zoneminder
docker container start zoneminder

# To list all the images
docker image ls -a

# To delete an image 
docker image rm zoneminder:<tag>

# To list the docker networks
docker network ls
```

If you need to check the users in your SQL server
```sql
SELECT host, user FROM mysql.user;
```

# Resources:
- https://zoneminder.readthedocs.io/en/latest/installationguide/debian.html
- https://github.com/ZoneMinder/zmdockerfiles/blob/master/docker-compose.yaml
- https://zoneminder.readthedocs.io/en/latest/installationguide/debian.html#easy-way-debian-11-bullseye
- https://zoneminder.readthedocs.io/en/stable/installationguide/multiserver.html