===================
Welcome To My Blog
===================

:date: 2013-05-01
:tags: static-site, pelican, foundation4, compass, sass
:category: python
:slug: welcome
:author: Christopher Clarke
:summary: Welcome to my new static plog

I've started experimenting with a static blog in the hope that this will
encourage me to post on a more frequently . I've decided to go with
`pelican`_ as it's written in python, set up and has good documentation and
I'm using ``github pages`` for hosting.

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
generated Makefile, and all the other helper scripts.
Instead, I created a settings file that initially
looked like this:

.. code-block:: python

    AUTHOR = 'Christopher Clarke'
    DEFAULT_DATE_FORMAT = '%A, %B %d, %Y'
    DISQUS_SITENAME = 'chrisdev'
    GITHUB_URL = 'https://github.com/chrisdev/chrisdev-blog'
    GOOGLE_ANALYTICS=''
    SITEURL = 'http://blog.chrisdev.com'
    FEED_DOMAIN = SITEURL
    SITENAME = 'TheChrisDev Blog'
    SOCIAL = (('twitter', 'http://twitter.com/realchrisdev'),
              ('github', 'https://github.com/chrisdev'),
              ('facebook', 'http://www.facebook.com/chrisdevtt'),)
    TAG_FEED_ATOM = 'feeds/%s.atom.xml'
    TIMEZONE = "America/Port_of_Spain"
    TWITTER_USERNAME = 'realchrisdev'

To generate the site I created a test ``rst`` file in the content directory
and ran the following:

.. code-block:: bash

    pelican content -s settings.py -o .

To view the generated site just open the index file in your browser or if you are
on a Mac

.. code-block:: sh

    open index.html

Theming The Blog
-----------------

By default `pelican`_  will theme your site using ``notmyidea``. 
But I wanted to use a theme based on `Zurb Foundation 4`_.
Fortunately,  the official `pelican-themes`_ repository already contained
a ``Foundation 4`` theme called ``tuxlite_zf``.
This is a minimalist theme with a main column and a right sidebar.
That I felt would provide a good starting point for a custom theme. 
To install the
``pelican-themes`` we simply cloned the repository to our local machine.

.. code-block:: sh

  git clone https://github.com/getpelican/pelican-themes ~/Development/pelican-themes

We then copied the ``tuxlite_zf`` theme folder to a new folder  ``chrisdev_zf``
so that we could customize it. Next,  we edited  ``settings.py``
file to include this line:

.. code-block:: python

    THEME = "../pelican-themes/chrisdev_zf"

Finall, we regenerated the site as before to confirm that ``tuxlite_zf`` was
indeed generating a ``Foundation 4`` site.


Customization with SASS and Compass
-----------------------------------
The best way to customize a ``Foundation 4`` site is to use
Sass_ and Compass_

.. _Compass: http://compass-style.org
.. _Sass: http://sass-lang.com/

This normally means that ``ruby`` needs to be installed on your system.
If you are on a Mac then you are in luck since a fairly recent version of 
``ruby`` ships with `Mountain Lion``.
Update your ``ruby`` installation and install ``Foundation 4`` and all the
necessary dependencies i.e. Sass_ and Compass_ .

.. code-block:: sh

    sudo gem update --system
    sudo gem install compass
    sudo gem install zurb-foundation


Next create a project for to generate the custom ``css`` for
your theme.

.. code-block:: sh

    compass create custom-foundation4 -r zurb-foundation --using foundation

You can view ``index.html`` in your browser confirm that your project is
a standard ``Foundation 4`` site. Next you will want to start 
by making changes to the ``Scsss`` files and compiling
with ``compass`` to generate ``css`` output.

The Foundation folks have made this easy for us as you can
modify almost any Foundation ``CSS`` component by editing ``_settings.scss`` 
file which is located in the ``sass`` 
folder of the ``custom-foundation`` project.
For example, to change the colors of the ``Top-nav`` we made the following 
changes to ``_settings.scss``

.. code-block:: ruby

    $topbar-dropdown-bg: #3498db;
    $topbar-dropdown-toggle-alpha: 0.1;
    $dropdown-label-color: #fff;

Next run

.. code-block:: sh

     compass compile

You can also set ``compass`` in watch mode so that it
will watch for saves and compile each time you save an Scss file.
Additionally, you can also configure compass to generate compressed code
by editing the 'config.rb'
and uncommenting

.. code-block:: sh

   output_style =  :compressed # or :compressed expanded or :nested or

Once you are satisfied, you can copy ``app.css`` as ``foundation.css`` to your
custom pelican-theme's static directory. 

Once you have more experience with compass/sass you may want to 
target particular CSS components instead of regenerating the entire 
``foundation.css`` just to make changes to a few components. To achieve this we
simply created a new ``scss`` called ``style.scss`` and imported just those 
modify those components that we wished to target. 
So as in the example above we just wanted to change the
``top-nav`` colors we just add the following lines to  ``style.sccs`` file

.. code-block:: ruby

    $topbar-dropdown-bg: #3498db;
    $topbar-dropdown-toggle-alpha: 0.1;
    $dropdown-label-color: #fff;
    
    @import "foundation/components/grid";
    @import "foundation/components/top-bar";

Note, you need to define the new colors etc. **before** you
import the foundation components.

As before generate ``style.css`` and copy this to the static directory of your pelican
theme.


.. _Zurb Foundation 4 : http://foundation.zurb.com

.. _`pelican-themes` : https://github.com/getpelican/pelican-themes

Deployment On Github
--------------------
I started by creating a repository on my `github <http://github.com>`_
called ``chrisdev.github.com``.
The use of my ``github`` account name as the first part of the 
repository name was necessary to indicate that this was a special repository 
for serving ``User`` or ``Organization`` html pages from the master branch of a
repository. The site would be viewable at http://chrisdev.github.io.

Next in the the directory where I created the pelican blog I ran the followig

.. code-block:: sh

    git init
    git add .
    git commit -m "initial commit"
    git remote add origin git@github.com:chrisdev/chrisdev.github.com.git

To update the site I just have to push to the origin

.. code-block:: sh

    git push -u origin master

I also set up a custom domain for the blog at http://blog.chrisdev.com 
by simply setting up a ``CNAME`` record in my DNS  
to set  ``blog.chrisdev.com`` as an alias for ``chrisdev.github.com``. 
I also had to add a file to the ``github`` repository  called 
``CNAME`` which contained 
a sigle line with the alias i.e  ``blog.chrisdev.com``.

