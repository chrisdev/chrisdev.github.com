+-------------------------------------------------+---------------------------+----------------------------------------------------+
|URL                                              | Route to                  | Note                                               |
+=================================================+===========================+====================================================+
| https://external.enterprise.co.tt/              | root on reverse proxy     | Display the static "portal" site                   |
+-------------------------------------------------+---------------------------+----------------------------------------------------+
| https://external.enterprise.co.tt/owa/          | http://192.169.X.Y/owa    | Outlook Web Access                                 |
+-------------------------------------------------+---------------------------+----------------------------------------------------+
| https://external.enterpise.co.tt/eforms/        | https://192.169.X.Y:8443/ | JBoss App with self signed SSL certificate         |
+-------------------------------------------------+---------------------------+----------------------------------------------------+
| https://external.enterprise.co.tt/django1       | http://django-app         | Internal Django App                                |
|                                                 |                           | running Nginx/Gunicorn                             |
+-------------------------------------------------+---------------------------+----------------------------------------------------+
| https://external.enterprise.co.tt/legacy-django | http://legacy-django      | Legacy Django App Django 1.4 and Apache mod_python |
+-------------------------------------------------+---------------------------+----------------------------------------------------+
