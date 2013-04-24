A Static Blog Based on Pelican
===========================

Installation
--------------

Install Pelican, Markdown and other requirements ::

    pip install -r requirments.txt

You need the pelican-themes repo (You should probably fork it). ::

      git@github.com:chrisdev/pelican-themes.git



Settings
---------

My current `settings.py` file::

    AUTHOR = 'Christopher Clarke'
    DEFAULT_DATE_FORMAT = '%A, %B %d, %Y'
    DISQUS_SITENAME = 'chrisdev'
    GITHUB_URL = 'https://github.com/chrisdev/chrisdev.github.com'
    GOOGLE_ANALYTICS=''
    SITEURL = 'http://blog.chrisdev.com'
    FEED_DOMAIN = SITEURL
    SITENAME = 'chrisdev'
    SOCIAL = (('twitter', 'http://twitter.com/realchrisdev'),
              ('github', 'https://github.com/chrisdev'),
              ('facebook', 'http://www.facebook.com/chrisdevtt'),)
    TAG_FEED_ATOM = 'feeds/%s.atom.xml'
    THEME='../pelican-themes/chrisdev_zf'
    TIMEZONE = "America/Port_of_Spain"
    TWITTER_USERNAME = 'realchrisdev'

Updating

---------
Simply run ::

    pelican . -o . -s settings.py
    git commit
    git push

Browse to  http://chrisdev.github.io to see the site


TO Do
-----
* Set up a custom domain
* More styling of for example I want a topbar, twitter buttons my pic
  etc.
* Proper pygments styling
