## Wordpress Blog Scaffold

To install wordpress on Docker:

1. build wordpress docker image:

```
docker build -t msmtp.ca.wordpress .
```

It will build wordpress image with CA certificates and send mail command.

If you have any CA certificates that need to be installed copy then to `./ca`
directory.

2. Run docker compose:

```
docker-compose up -d
```

3. After this finshes, access the server from the browser and install wordpress.

## Notes

* If you want to access wordpress like other sites change the port in `docker-compose.yml`
  to `80:80`
* If you run this on OpenStack you need to expose port 80 for your machine
* With open stack is best if you mount volume and put all files there,
  so you don't loose them when machine will restart (hopefully)
* Remember to set permission to `msmtprc` so apache user `www-data` can access it,
  otherwise you will not be able to send emails from php.

```
sudo chown www-data:www-data msmtprc
```

If that give you error (e.g. if your system don't have that user) you can run:

```
docker ps
```

it will return list of docker images you get the container id of `msmtp.ca.wordpress`
image and run:

```
docker exec -it <ID> bash
chown ww-data:www-data /etc/msmtprc
```

This will change the ownership inside container. It was needed on Fedora
that had user `apache` and not `www-data` like Ubuntu.

## NOTE

You will not be able to send emails if you run this localy since most email servers
check reverse DNS to check the source of the email.
