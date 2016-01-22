=========================================================================
Introducing wagtail-cookiecutter-foundation 
=========================================================================
:date: 2016-01-22
:tags: Wagtail,CMS, Content Managment,Django, Zurb-Foundation, Foundation-6 
:category: Django
:author: Christopher Clarke
:status: draft
:summary: This article introduces wagtail-cookiecutter-foundation_, a Cookiecutter_ template for quickly spinning up Django_ sites running the highly regarded `Wagtail`_ Content Management System and the `Zurb Foundation`_ front-end framework. 


.. figure:: {filename}/images/wagtail-cookiecutter-foundation.png
   :alt: Wagtail Cookiecutter Foundation 



In this article we introduce you to wagtail-cookiecutter-foundation_, a Cookiecutter_
template for quickly generating Django_ sites powered by `Wagtail`_ and  
`Zurb Foundation for Sites 6`_. The websites generated with our 
Cookiecutter are pretty full featured and come with most of the
components you are likely to need for the typical website project, including: various
kinds of top level menus (drop-down, off-canvas), feature sliders, photo galleries, 
contact forms,  various kinds of homepage designs, product and portfolio pages, 
blog and events events module and so on.  But its pretty easy to customize and include only the modules and components to match your project's requirements. For an idea of what to expect check out our live `demo`_.

Wagtail CMS has been described as:   

    `The all around best and most flexible Django CMS currently available`_. 

One of the big selling points for `Wagtail`_ is its easy of use especially for
non-technical end-users. Many of the content creators and editors we've
introduced to it tell us that Wagtail is especially easy understand and they are
quickly able to get useful work done.  Indeed, many of these users have expressed 
a clear preference for Wagtail over some of the more well known "brands" 
such as Wordpress and Drupal.  Another strength of Wagtail, is the
flexibility of CMS model that allows for the representation of everything from
the most simple pages with a few media elements to more complex unstructured
pages where text may be interspersed with subheading, pull quotes, videos or
specialized content types like maps and charts. It is important to note that
`Wagtail`_ does not rely on any arcane plugins architecture but rather on
standard Python/Django modules, classes and methods.  As a consequence, it
plays well with the other reusable applications in the Python/Django ecosystem
such as the `Django Rest Framework`_. There and also hooks to important tools
like `ElasticSearch`_.   Additionally, Wagtail CMS comes it a built in Form
builder system and has excellent Image and Document management tools.  

`Zurb Foundation`_ is a *mobile first*  responsive framework that provides
all the components required for building websites. These include a responsive 
grid and HTML, JavaScript and CSS UI components, templates, and code snippets covering 
typography, forms, buttons, navigation and other interface components.
While `Zurb Foundation`_  may not be as popular as some other front-end
frameworks, we find that it provides a better platform for customization sites
and web apps. So while the out-of-the-box look and feel is more or less
a flat design a few tweaks to the underlying Sass files can have yield some 
pretty dramatic changes.

Up and Running
----------------

To create a new `Django`_ project based on wagtail-cookiecutter-foundation 
you need to have `Cookiecutter`_ installed on your machine. If you have not
installed it, then install it:

.. code-block:: sh 

    $ pip install cookiecutter

Note we always recommend that you installed Cookiecutter system wide, as you are bound to want to try our some of the other `cookiecutter templates`_ out there.

Next run cookiecutter against the wagtail-cookiecutter-foundation repo:

.. code-block:: sh 

    $ cookiecutter https://github.com/chrisdev/wagtail-cookiecutter-foundation.git

You will be prompted to answer the following questions. 

.. code-block:: sh 

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

Enter the project and take a look around

.. code-block:: sh 

    $ cd my_wagtail_project/
    $ ls

Create a GitHub or Bitbucket repo for the project and push it there

.. code-block:: sh 

    $ git init
    $ git add .
    $ git commit -m "first awesome commit"
    $ git remote add origin git@github.com:cclarke/my_wagtail_project.git
    $ git push -u origin master


Quick Start
------------

Before you start ensure that you've installed and got the following working.

* `pip`_
* virtualenv_/pyenv_/virtualenvwrapper_ 
* PostgreSQL_ * `node/npm`_, `git`_ (and or `mercurial`_) and `bower`_ 

Your project will contain a Makefile that allows you to setup your development 
environment with a single command. To do this run: 

.. code-block:: sh 
 
   make all

This command will create your project's virtual environment, 
install all pip dependencies,  create
the development database, run migrations and load initial data to database,
install front-end dependencies and finally start the development server 
for you.  You can access your site at **http://localhost:8000**. The Admin 
back-end is available at **http://localhost:8000/admin/**.

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

When you are ready to provision your production server, simply run:

.. code-block:: sh 

       make provision

Running this commands will:  

- Create a deployment user on the server to use for the project.
- Create and download download a deployment key for use on services 
  like Github or Bitbucket
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

Need to deploy to a staging server? Run run: 

.. code-block:: sh 

   make provision DEPLOY_ENV=staging

What! You're running a `Vagrant`_ based staging server? Then run:

.. code-block:: sh 

   make provision DEPLOY_ENV=vagrant

Finally, made some changes to your site  and ready to deploy them? Then run:

.. code-block:: sh 

    make deploy 


The ``deploy`` and ``provision`` commands drive on suite of Ansible_ playbooks to
run the provisioning and deployment tasks on your servers. 
Vagrant_ based staging servers are supported, so you
can "stage" your site locally and tweak and experiment with different
deployment configurations before expending your resources on hosting providers. 
To keep things simple, we assume that all your application components such as; 
``Django``, ``PostgreSQL``, ``redis`` and so on, are all deployed on a single
server.  However, it is a relatively straightforward procedure to tweak the
playbooks support more complex provisioning scenarios.  In this way, you can
support for example, independent database server, multiple upstream ``wsgi``
servers and so on. For more check the online `documentation`_.

Some tips on Manually Upgrading to Foundation 6
-------------------------------------------------
If you've used an earlier version of this Cookiecutter then the generated 
site would have been based on `Foundation 5`_. If you want to manually
upgrade one of these sites to `Zurb Foundation 6`_, here are some the tweaks 
that you have to make.

Upgrade to Foundation 6
^^^^^^^^^^^^^^^^^^^^^^^^
To install the latests version of Foundation edit the :code:`bower.json` and 
change the line :code:`foundation": "~5.5.3"`  to :code:`foundation-sites: "~6.1.0"`

Modernizr
^^^^^^^^^^
Modernizr_ has been removed as an external dependency from :code:`Foundation 6` so 
it can be removed from your base.html

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
for photo galleries. You may want to up grade it with an open source
component like like `Lightbox2`_. 

SASS changes
^^^^^^^^^^^^^
There have been many changes to the way that the Foundation SASS is organized
it may be a good idea to read the new  `new SASS documentation`_: 


Summary
---------
Over the last few months wagtail-cookiecutter-foundation_ has been a great time saver for us here at `ChrisDev <http://chrisdev.com>`_, but there are many features that we'd  love to include in future releases. These include:

- Integration with `Lets Encrypt`_ for the generation and maintenance of SSL
  certificates 
- Turn some of the bundled modules like :code:Feeds into independent Django applications. 
- Add more tests and an automated build system for the default `wagtail-cookiecutter-foundation` project. 
- Make more use of the Wagtail `StreamField`_ in more complex pages such as the
  homepage

You can find more of of these as well a bug reports in our `issue tracker`_. 
We're open to new ideas and happy to take your pull requests.


.. _`The all around best and most flexible Django CMS currently available`: http://www.revsys.com/blog/2015/apr/29/wagtail-best-django-cms/
.. _Cookiecutter: https://github.com/audreyr/cookiecutter
.. _`Wagtail`: https://wagtail.io
.. _`Zurb Foundation 6`: https://foundation.zurb.com
.. _`Zurb Foundation for Sites 6`: https://foundation.zurb.com
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
.. _`Pip`: https://pip.pypa.io/en/stable/ 
.. _`virtualenv`: https://virtualenv.pypa.io/en/latest/
.. _`virtualenvwrapper`: https://virtualenvwrapper.readthedocs.org/en/latest/
.. _`pyenv`: https://docs.python.org/3/library/venv.html#module-venv
.. _`modernizr`: https://modernizr.com
.. _`demo`: http://wagtail.chrisdev.com>`
.. _`issue tracker`: https://github.com/chrisdev/wagtail-cookiecutter-foundation/issues 
.. _documentation: http://wagtail-cookiecutter-foundation.readthedocs.org/en/latest/  
