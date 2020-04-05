#!/bin/bash

platform drush sql:dump > database.sql \
  && drush -y sql:drop \
  && sudo mysql -uroot d8_personalsite < database.sql \
  && rm -f database.sql \
  && drush cr
