===================
Welcome to the Blog
===================

:date: 2013-05-01
:tags: static-site blogging peilcan foundation4 compass sass
:category: python
:slug: welcome
:author: Christopher Clarke
:summary: Welcome to my new static plog

I'm trying out a static blog as maybe this will
encourage me to post on a more frequent bases. I've decided to go with
`pelican`_ as it's written in python, is a  was really easy to
set up and has good documentation.

.. _pelican : https://github.com/getpelican/pelican

Getting Started
----------------
First, I created a virtualenv for
the project and installed the main requirements.

.. code-block:: sh

    mkvirtualenv chrisdev-blog
    pip install pelican


I then used ``pelican-quickstart`` to create the skeleton of my project

.. code-block:: sh

   pelican-quickstart

Since I was going to host on Github I felt that I did not need the
generated Makefile, and other helper scripts.
Instead I created a settings file that initially
looked like this:

.. code-block:: python

    AUTHOR = 'Christopher Clarke'
    DEFAULT_DATE_FORMAT = '%A, %B %d, %Y'
    DISQUS_SITENAME = 'chrisdev'
    GITHUB_URL = 'https://github.com/chrisdev/chrisdev-blog'
    GOOGLE_ANALYTICS=''
    SITEURL = 'http://blog.chrisdev.com'
    FEED_DOMAIN = SITEURL
    SITENAME = 'ChrrisDev Blog'
    SOCIAL = (('twitter', 'http://twitter.com/realchrisdev'),
              ('github', 'https://github.com/chrisdev'),
              ('facebook', 'http://www.facebook.com/chrisdevtt'),)
    TAG_FEED_ATOM = 'feeds/%s.atom.xml'
    TIMEZONE = "America/Port_of_Spain"
    TWITTER_USERNAME = 'realchrisdev'

To generate the site I created a test ``rst`` file and ran the
following command:

.. code-block:: bash

    pelican content -s settings.py -o .

To view your site just open the index file in your browser or if you are
on a Mac

.. code-block:: sh

    open index.html

Theming The Blog
-----------------

By default your Blog will be based on the ``notmyidea`` theme which is
pretty nice but we wanted to use a theme based on `Zurb Foundation 4`_.
Fortunately,  the official `pelican-themes`_ repository already contained
a ``Foundation 4`` theme called ``tuxlite_zf``.
This is a minimalist theme with a main column and a right sidebar.
That we felt that this would
provide a good starting point for our custom theme.  To install the
pelican-themes we simply cloned the repository to our local machine.

.. code-block:: sh

  git clone https://github.com/getpelican/pelican-themes ~/pelican-themes

We then copied the ``tuxlite_zf`` theme folder to a folder called ``chrisdev_zf``
so that we could customize it. Next we edited our  ``settings.py``
file to include this line:

.. code-block:: python

    THEME = "../pelican-themes/chrisdev_zf"

Then we regenerated the site as before to confirm that ``tuxlite_zf`` was
indeed a ``Foundation 4`` theme.



SASS and Compass
^^^^^^^^^^^^^^^^^

The best way to customize a ``Foundation 4`` site is to use
`Sass <http://sass-lang.com/>`_  and Compass_

.. _Compass: http://compass-style.org


This involves just a little bit of ``ruby`` but bear with us.
Just run the following to
the update you system and install ``Foundation 4`` gem and all the
necessary dependencies.

.. code-block:: sh

    sudo gem update --system

    sudo gem install zurb-foundation


Next create a project for the custom theme

.. code-block:: sh

    compass create custom-foundation4 -r zurb-foundation --using foundation

You can view ``index.html`` in your browser confirm that your project is
a standard ``Foundation 4`` site. So for example, if you want to modify the
any CSS component we just need to edit ``_settings.scss`` file which
is located in the ``sass`` folder of the ``custom-foundation`` project.
For example to change the colors of the ``Top-nav`` we made the following changes

.. code-block:: ruby

    $topbar-dropdown-bg: #3498db;
    $topbar-dropdown-toggle-alpha: 0.1;
    $dropdown-label-color: #fff;

Next run

.. code-block:: sh

     compass compile

You can also set compass to watch mode so that it watches your sass for
changes and compiles them to CSS when ever changes are detected.

You can configure compass to generate compressed code by editing the 'config.rb'
and uncommenting

.. code-block:: sh

   output_style =  :compact # or :compressed expanded or :nested or

Once you are satisfied you can copy the  ``app.css`` file to your
custom pelican-theme's static directory


.. _Zurb Foundation 4 : http://foundation.zurb.com

.. _`pelican-themes` : https://github.com/getpelican/pelican-themes

Github setup
^^^^^^^^^^^^



