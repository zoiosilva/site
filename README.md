# Command Examples
Here are some command examples.

## Heroku:
Get an environment variable:
```
heroku config:get STACKHERO_MARIADB_HOST
```
List all environment variables:
```
heroku config
```
Open PHPMyAdmin:
```
heroku addons:open ah-mariadb-stackhero
```

PHPMyAdmin configuratrion: https://dashboard.stackhero.io/account/organizations/org-a9ursj/stacks/stk-j7gfyn/services/svc-2h47k2/configure/

Client:
```
mysql -h yqk6vk.stackhero-network.com -u root -p --ssl
```

## Drush:
```
heroku run drush uli
```

## Redis
Reference: https://devcenter.heroku.com/articles/heroku-redis
```
# List all addons
heroku addons
# Adding redis
heroku addons:create heroku-redis:hobby-dev -a polar-basin-71973
heroku addons:info heroku-redis
heroku config | grep REDIS
```
Issue found: https://help.heroku.com/HC0F8CUS/redis-connection-issues

## Filesystem
https://www.fomfus.com/articles/how-to-create-a-drupal-8-project-for-heroku-part-1/
https://www.drupal.org/project/flysystem_s3
