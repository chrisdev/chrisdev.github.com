=========================================================================
Introducing wagtail-cookiecutter-foundation 
=========================================================================
:date: 2015-12-31
:tags: Zurb-Foundation, wagtail, CMS, Django
:category: Django
:author: Christopher Clarke
:status: draft
:summary: This article introduces wagtail-cookiecutter-foundation_, a Cookiecutter_ template for quickly spinning up Django_ sites running the highly regarded `Wagtail CMS`_ Content Management System and the `Zurb Foundation`_ front-end framework. The template also supports 


.. figure:: {filename}/images/wagtail-cookiecutter-foundation.png
   :alt: Wagtail Cookiecutter Foundation 


Introduction
-------------

In this article we introduce you to wagtail-cookiecutter-foundation_, a Cookiecutter_
template for quickly generating Django_ sites powered by `Wagtail CMS`_ and  
`Zurb Foundation 6`_

Wagtail CMS has been described by as 

    `The all around best and most flexible Django CMS currently available`_. 

One of the key selling points of `Wagtail CMS`_ is that non-technical
end-users find it that is especially easy to understand and a pleasure to use.
Indeed, many of the content managers and editors that we've introduced to `Wagtail CMS`_ have
expressed a clear preference for it over some of the content management tools 
that they've used including stardars like Wordpress and Drupal.

Another strength of Wagtail is the flexibility of CMS model that allows
for the representation of everything from the most simple pages with a few
media elements to more complex unstructured pages where text may be
interspersed with subheading, pull quotes, videos or specialized content types
like maps and charts. It is important to note that `Wagtail CMS`_ does not rely on
a plugins style architecture but rather on plain vanilla Python/Django modules and classes. 
As a consequence, it plays well with the other reusable applications  
in the Python/Django ecosystem. There are hooks into important eco system tools
like `Django Rest Framework`_ and  `ElasticSearch`_   Additionally, Wagtail CMS comes
it a built in Form builder system and has excellent Image and Document
management tools.  

`Zurb Foundation`_ is a *mobile first*  responsive framework that provides
features such as a responsive grid and HTML and CSS UI components, templates,
and code snippets, including typography, forms, buttons, navigation and other
interface components, as well as a number of optional JavaScript extensions.
While `Zurb Foundation`_  may not be a popular as some other front-end
frameworks we find that it provides a better platform for customization sites
and web apps. So
while the out-of-the-box look and feel is more or less a `flat` design that
looks good right away, a few tweaks to the Sass files can have some yeild some
dramatic changes. 

Getting Started
----------------

To create a new `Django`_ project based on this cookiecutter, 
you need to have `Cookiecutter` installed on your machine. If you have not
installed it, then install it::

    $ pip install cookiecutter

Note we installed it system wide as you are bound to want to try our some of the other
`cookiecutter templates`_ projects out theree

Next run cookiecutter against this repo ::

    $ cookiecutter https://github.com/chrisdev/wagtail-cookiecutter-foundation.git

You will be prompted to answer the following questions. ::

    Cloning into 'wagtail-cookiecutter-foundation'...
    remote: Counting objects: 611, done.
    remote: Compressing objects: 100% (13/13), done.
    remote: Total 611 (delta 3), reused 0 (delta 0), pack-reused 598
    Receiving objects: 100% (611/611), 423.98 KiB | 0 bytes/s, done.
    Resolving deltas: 100% (264/264), done.
    Checking connectivity... done.
    project_name (default is "Wagtail Project")?
    repo_name (default is "wagtail_project")?
    version_control_system (default is "hg")?,
    vcs_host (default is "bitbucket")?,
    author_name (default is "Your Name")?
    email (default is "Your email")?
    description (default is "A short description of the project.")?
    timezone (default is "UTC")?
    now (default is "2015/04/16")?
    year (default is "2015")?
    production_host_name (default is  example.org)?
    use_ssl_in_production (default is true)?
    staging_host_name (default is staging.example.org)?
    use_vagrant_staging (default is true)?
    deploy_user_name (default is django)
    django_admin_user (default is my_admin_user)    

Enter the project and take a look around::

    $ cd my_wagtail_project/
    $ ls

Create a GitHub or Bitbucket repo for the project and push it there::

    $ git init
    $ git add .
    $ git commit -m "first awesome commit"
    $ git remote add origin git@github.com:cclarke/my_wagtail_project.git
    $ git push -u origin master


Quick Start
------------

Before you start ensure that you've installed and got the following working.

    * pip
    * virtualenv/pyvenv/virtualenvwrapper
    * `PostgreSQL`_
    * `node/npm`_, `git`_ (and or `mercurial`_) and `bower`_

Your project will contain a Makefile that allows you to setup your development 
environment with a single command. To do this run ::

  make all

This command will create your project's virtual environment, 
install all pip dependencies,  create
the development database, run migrations and load initial data to database,
install front-end dependencies and finally start the development server 
for you.  You can access your site at ``http://localhost:8000``. The Admin 
back-end is available at ``http://localhost:8000/admin/``.

Your project will come with a set of application modules to use for building 
the sites functionality including:

    - ``pages`` - Different kinds of pages including, Homepage, Standard Pages, Faqs Page etc.
    - ``blog`` - Blog or site news
    - ``contact`` - Contact Page with included contact us form 
    - ``events`` - Events
    - ``photo_gallery`` - Create photo galleries using wagtail tags
    - ``documents`` - Organize documents in folders using wagtail tags .
    - ``products`` - Ideal for a product or portfolio showcase
    - ``feeds`` - RSS/Atom feeds which support enclosures to work with services like Mailchimp and Flipboard
    - ``people`` - For the people in your organization or team. 
    - ``faq`` - FAQ and answers.
    - ``utils`` - Various utility functions, templatetags and filters

However, we take a modular approach so the can pick and choose the modules to
include the project by simple adjusting the ``INSTALLED_APPS`` in settings.

When you are ready to provision your production server, simply run ::

       make provision

Running this commands will:  

    - Create a deployment user on the server for the project and download their public key 
      of for you use as a deployment key on services like Github or Bitbucket
    - Install all the required Linux packages and libraries on the server.
    - Install and configure the latest version of `PostgreSQL`_. 
    - Install and configure `Redis`_ and `ElasticSearch`_.
    - Setup basic security  on the Linux box using `UFW Firewall`_ and 
      `fail2ban`_.
    - Clone the project's VCS repository, setup a virtual environment and install all the python and django dependencies required to run the site
    - Install and configure all required front-end dependencies 
    - Configure and install a Celery worker process.
    - Install and configure an Nginx Virtaul Host for your site.
    - Install and configure your SSL certificate (if required) and ensure that
      you can score an *A* in the popular `SSL Labs`_ SSL server test.

Need to deploy to a staging server? Run ::

        make provision DEPLOY_ENV=staging

You're using a `Vagrant`_ based staging server? Then ::

        make provision DEPLOY_ENV=vagrant

Finally, made some changes to your site  and ready to deploy them? Then run ::

       make deploy 


The deployment and provision rely on suite of Ansible_ playbooks to
support the provisioning your servers and deploying changes to production and
staging.  The provision of Vagrant_ based staging server is supported so you
can "stage" your site locally and tweak and experiment with different
deployment configurations. To keep things simple we assume that all your
application components i.e.  ``Django``, ``PostgreSQL``, ``redis`` and so on
are all deployed on a single server.  However, it is a relatively straightforward 
procedure to tweak the playbooks support more complex provisioning scenarios. 
In this way, you can support for example, separate database server, 
multiple upstream ``wsgi`` servers and so on. For more check our the doc

Some tips on Manually Upgrading to Foundation 6
-------------------------------------------------
If you used the earlier version of this cookiecutter to generate your project,
your site would have been based on `Foundation 5`_. If you want to manually 
upgrade to `Zurb Foundation 6`_ here are some of of the difference we noted while 
working on this project and upgrading a couple of client sites.

Installation
^^^^^^^^^^^^^^
To install the latests version of Foundation edit the ``bower.json change`` and 
change ``foundation": "~5.5.3"``  to ``foundation-sites: "~6.1.0"``

Modernizr
^^^^^^^^^^
`Modernizr` has been removed from `Foundation 6` so it can be removed from your base.html

New Top-bar
^^^^^^^^^^^^^
`The entire code for the topbar has been changed`_

New Off Canvas
^^^^^^^^^^^^^^^
* `The entire code for the offcanvas has been changed`_
* `The drop down for off canvas can now use accordion vertical menu`_

Block Grid Changed
^^^^^^^^^^^^^^^^^^^
`The html for a block grid has changed`_ : eg. medium-block-grid-4 to medium-up-4

Clearing Box is no longer included 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
In `Foundation 6` there is no more clearing box a feature which was often used 
for photo galleries. Interestingly, Orbit has made a return, but you may 
want to use a third party component like `Lightbox2`_. 

SASS changes
^^^^^^^^^^^^^
There have been many changes to the Foundation SASS it may be a good idea to read the new  `new SASS documentation`_: 


Summary
---------
wagtail-cookiecutter-foundation_ is great time saver for us here at ChrisDev but 
with any project we would like to include so the following features in 
upcoming versions. 

- Integration with `Lets Encrypt`_ for the generation and maintenence of SSL
  certificates 
- Re-factor some of the more complex pages like the HomePage to use the `StreamField`_ 

Try it out and let me know what you think. I'm open to new ideas and receiving pull requests.


.. _`The all around best and most flexible Django CMS currently available`: http://www.revsys.com/blog/2015/apr/29/wagtail-best-django-cms/
.. _Cookiecutter: https://github.com/audreyr/cookiecutter
.. _`Wagtail CMS`: https://wagtail.io
.. _`Zurb Foundation 6`: https://foundation.zurb.com
.. _`Zurb Foundation`: https://foundation.zurb.com
.. _`Foundation 5`: http://foundation.zurb.com/sites/docs/v/5.5.3/
.. _wagtail-cookiecutter-foundation: http://wagtail-cookiecutter-foundation.readthedocs.org/en/latest/   
.. _Django: https://djangoproject.com
.. _`Cookiecutter templates`:  https://github.com/audreyr/cookiecutter#available-templates
.. _`The entire code for the topbar has been changed`: http://foundation.zurb.com/sites/docs/top-bar.html
.. _`The entire code for the offcanvas has been changed`: http://foundation.zurb.com/sites/docs/off-canvas.html
.. _`The drop down for off canvas can now use accordion vertical menu`: http://foundation.zurb.com/sites/docs/accordion-menu.html
.. _`The html for a block grid has changed`: http://foundation.zurb.com/sites/docs/grid.html
.. _`Lightbox2`: http://lokeshdhakar.com/projects/lightbox2/
.. _`new SASS documentation` : http://foundation.zurb.com/sites/docs/sass.html
.. _`Django Rest Framework`: http://www.django-rest-framework.org
.. _`ElasticSearch`: https://github.com/elastic/elasticsearch 
.. _`node/npm`: https://nodejs.org/en/ 
.. _`bower`: http://bower.io
.. _`git`: http://git-scm.com 
.. _`mercurial`: https://www.mercurial-scm.org 
.. _`PostgreSQL`: http://postgresql.org
.. _redis: http://redis.io
.. _`UFW Firewall`: https://help.ubuntu.com/community/UFW
.. _`Fail2ban`: http://www.fail2ban.org/wiki/index.php/Main_Page 
.. _`Vagrant`: https://www.vagrantup.com
.. _`SSL Labs`: https://www.ssllabs.com
.. _`Ansible`: http://docs.ansible.com 
.. _`lets encrypt`: https://letsencrypt.org
.. _`StreamField`: http://docs.wagtail.io/en/v1.3.1/topics/streamfield.html 
