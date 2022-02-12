# Command Examples
Here are some command examples.

## Heroku:
Get an environment variable:
```
heroku config:get STACKHERO_MARIADB_HOST
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
