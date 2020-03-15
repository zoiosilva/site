#!/bin/bash

platform drush sql:dump > banco.sql \
  && drush -y sql:drop \
  && sudo mysql -uroot d8_personalsite < banco.sql \
  && rm -f banco.sql \
  && drush cr
