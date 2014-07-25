#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals
import hashlib


def get_gravatar_url(email):
    ghash = hashlib.md5(email.lower()).hexdigest()
    return 'http://www.gravatar.com/avatar/{}'.format(ghash)

AUTHOR = u'Christopher Clarke'
SITENAME = u'The ChrisDev Blog'
SITEURL = ''
SITE_EMAIL = 'cclarke@chrisdev.com'
PATH = 'content'

TIMEZONE = 'America/Port_of_Spain'

DEFAULT_LANG = u'en'

# Feed generation is usually not desired when developing
FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None
SITEGRAVATAR = get_gravatar_url(SITE_EMAIL)
PLUGIN_PATHS = ["../pelican-plugins"]
PLUGINS = ["gravatar"]

TWITTER_USERNAME = 'realchrisdev'

THEME = '../pelican-transcend-foundation'
# Blogroll
LINKS = (
    ('About', 'http://chrisdev.com/about/'),
    ('Contact Us', 'http://chrisdev.com/contact/'),
)
DISPLAY_PAGES_ON_MENU = False

MENUITEMS = LINKS
DISPLAY_CATEGORIES_ON_MENU = False
# Social widget
SOCIAL = (
    ('twitter', 'http://twitter.com/realchrisdev'),
    ('github', 'https://github.com/chrisdev'),
    ('facebook', 'http://www.facebook.com/chrisdevtt')
)
DEFAULT_PAGINATION = False

# Uncomment following line if you want document-relative URLs when developing
RELATIVE_URLS = True
VCARD = {
    'email': 'cclarke@chrisdev.com',
    'given_name': 'Christopher',
    'family_name': 'Clarke',
    'url': 'http://chrisdev.com',
    'street_address': 'A3 St Bendicts Gardens',
    'locality': 'Tunapuna',
    'country_name': 'Trinidad and Tobago',
    'tel_home': '773-4644'
}
