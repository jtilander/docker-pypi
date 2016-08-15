# Python PyPi server image

This brings up a server that hosts python packages.

# Adding users

If you need to add more users you can enter the running instance, e.g. 

```
docker exec -it <container image> bash
```

and issue the following command:

```
htpasswd /data/.htaccess <username>
```

## Environment variables

|Name          |Default       |Notes                                          |
|--------------|--------------|-----------------------------------------------|
|DEFAULT_USER  |python        |An authorized user                             |
|DEFAULT_PASSWD|              |                                               |

## Volumes

There is a /data volume where all the data is stored on.

