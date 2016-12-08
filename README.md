# Awstats

This is a simple way to analysis the apache (webserver) log in a full graphic web page.

# Awstats and postfix / zimbra

This is a simple way to analysis the postfix / zimbra log in a full graphic web page.


## Config

[Install](http://get.docker.com) docker in your awstat host server.

### Step 1

Create a copy of "awstats.linoxide.conf". We have taken "example.com" as domain.

```
cp -av awstats.linoxide.conf awstats.example.com.conf

```


### Step 2

Change the following details according to the need in "awstats.example.com.conf".

```
#LogFile="/example.com.access.log"
LogFile="/var/log/apache2/example.com.access.log"
SiteDomain="example.com"
HostAliases="example.com www.example.com"
```

### Step 3

Change the following details according to the need in "mycron".

```
Replace :

01 *  * * * /usr/lib/cgi-bin/awstats.pl -config=nroer -update


With :

01 *  * * * /usr/lib/cgi-bin/awstats.pl -config=example.com -update
```


### Step 4

Change the following details according to the need in "docker-compose.yml".

```
Change dir name and file name as domain name also change access log name and uncomment it:

#    - /logs/example.com/access.log:/root/example.com/access.log			# Change domain name as dir name and access log name
#    - ./awstats.example.com.conf:/usr/lib/cgi-bin/awstats/awstats.example.com.conf	# Change domain name as file name in conf
```


## Run with your own config

Build your image incase you have changed Dockerfile:
```
bash build-docker-image.sh
```


### Start container with run command

If your log is saved in the path: /var/log/mail.log, and you can mount this file to the awstats server for analysis use.

```
docker run -d --name awstats --hostname ServerName \
  -v /var/log/mail.log:/var/log/mail.log \
  -v /path/to/your.conf:/usr/lib/cgi-bin/awstats/awstats.linoxide.conf && \
  -p 8080:80 mrunal/awstats:7.6
```
In this command, you will also run your server into host port 8080.


### Start container with docker-compose command

The `docker-compose.yml` is a file example to run container with `docker-compose up`


## Browse

```
http://your-awstats-ip-addr:8080/cgi-bin/awstats/awstats.pl?config=linoxide
```


## References

```
https://github.com/linkerlab/awstats                - For basic awstats installation and configuration
```
```
https://github.com/marcelofmatos/awstats_postfix    - For docker-compose.yml file
```

Thanks to [linkerlab](https://github.com/linkerlab)
