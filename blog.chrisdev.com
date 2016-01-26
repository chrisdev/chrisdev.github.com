<?xml version="1.0" encoding="utf-8"?>
<feed xmlns="http://www.w3.org/2005/Atom"><title>The ChrisDev Blog</title><link href="/" rel="alternate"></link><link href="/blog.chrisdev.com" rel="self"></link><id>/</id><updated>2016-01-22T00:00:00-04:00</updated><entry><title>Introducing wagtail-cookiecutter-foundation</title><link href="/introducing-wagtail-cookiecutter-foundation.html" rel="alternate"></link><updated>2016-01-22T00:00:00-04:00</updated><author><name>Christopher Clarke</name></author><id>tag:,2016-01-22:introducing-wagtail-cookiecutter-foundation.html</id><summary type="html">&lt;div class="figure"&gt;
&lt;img alt="Wagtail Cookiecutter Foundation" src="/images/wagtail-cookiecutter-foundation.png" /&gt;
&lt;/div&gt;
&lt;p&gt;In this article we introduce you to &lt;a class="reference external" href="http://wagtail-cookiecutter-foundation.readthedocs.org/en/latest/"&gt;wagtail-cookiecutter-foundation&lt;/a&gt;, a &lt;a class="reference external" href="https://github.com/audreyr/cookiecutter"&gt;Cookiecutter&lt;/a&gt;
template for quickly generating &lt;a class="reference external" href="https://djangoproject.com"&gt;Django&lt;/a&gt; sites powered by &lt;a class="reference external" href="https://wagtail.io"&gt;Wagtail&lt;/a&gt; and
&lt;a class="reference external" href="https://foundation.zurb.com"&gt;Zurb Foundation for Sites 6&lt;/a&gt;. The websites generated with our
Cookiecutter are pretty full featured and come with most of the
components you are likely to need for the typical website project, including: various
kinds of top level menus (drop-down, off-canvas), feature sliders, photo galleries,
contact forms,  various kinds of homepage designs, product and portfolio pages,
blog and events events module and so on.  But its pretty easy to customize and include only the modules and components to match your project's requirements. For an idea of what to expect check out our live &lt;a class="reference external" href="http://wagtail.chrisdev.com"&gt;demo&lt;/a&gt; site.&lt;/p&gt;
&lt;p&gt;Wagtail CMS has been described as:&lt;/p&gt;
&lt;blockquote&gt;
&lt;a class="reference external" href="http://www.revsys.com/blog/2015/apr/29/wagtail-best-django-cms/"&gt;The all around best and most flexible Django CMS currently available&lt;/a&gt;.&lt;/blockquote&gt;
&lt;p&gt;One of the big selling points for &lt;a class="reference external" href="https://wagtail.io"&gt;Wagtail&lt;/a&gt; is its easy of use especially for
non-technical end-users. Many of the content creators and editors we've
introduced to it tell us that Wagtail is especially easy understand and they are
quickly able to get useful work done.  Indeed, many of these users have expressed
a clear preference for Wagtail over some of the more well known &amp;quot;brands&amp;quot; in the
Content Managenment world such as Wordpress and Drupal.  Another strength of Wagtail, is the
flexibility of CMS model that allows for the representation of everything from
the most simple pages with a few media elements to more complex unstructured
pages where text may be interspersed with subheading, pull quotes, videos or
specialized content types like maps and charts. It is important to note that
&lt;a class="reference external" href="https://wagtail.io"&gt;Wagtail&lt;/a&gt; does not rely on any arcane plugins architecture but rather on
standard Python/Django modules, classes and methods.  As a consequence, it
plays well with the other reusable applications in the Python/Django ecosystem
such as the &lt;a class="reference external" href="http://www.django-rest-framework.org"&gt;Django Rest Framework&lt;/a&gt;. There and also hooks to important tools
like &lt;a class="reference external" href="https://github.com/elastic/elasticsearch"&gt;ElasticSearch&lt;/a&gt;.   Additionally, Wagtail CMS comes it a built in Form
builder system and has excellent Image and Document management tools.&lt;/p&gt;
&lt;p&gt;&lt;a class="reference external" href="https://foundation.zurb.com"&gt;Zurb Foundation&lt;/a&gt; is a &lt;em&gt;mobile first&lt;/em&gt;  responsive framework that provides
all the components required for building websites. These include a responsive
grid and HTML, JavaScript and CSS UI components, templates, and code snippets covering
typography, forms, buttons, navigation and other interface components.
While &lt;a class="reference external" href="https://foundation.zurb.com"&gt;Zurb Foundation&lt;/a&gt;  may not be as popular as some other front-end
frameworks, we find that it provides a better platform for customization sites
and web apps. So while the out-of-the-box look and feel is more or less
a flat design a few tweaks to the underlying Sass files can have yield some
pretty dramatic changes.&lt;/p&gt;
&lt;div class="section" id="up-and-running"&gt;
&lt;h2&gt;Up and Running&lt;/h2&gt;
&lt;p&gt;To create a new &lt;a class="reference external" href="https://djangoproject.com"&gt;Django&lt;/a&gt; project based on wagtail-cookiecutter-foundation
you need to have &lt;a class="reference external" href="https://github.com/audreyr/cookiecutter"&gt;Cookiecutter&lt;/a&gt; installed on your machine. If you have not
installed it, then install it:&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;&lt;span class="nv"&gt;$ &lt;/span&gt;pip install cookiecutter
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;Note we always recommend that you installed Cookiecutter system wide, as you are bound to want to try our some of the other &lt;a class="reference external" href="https://github.com/audreyr/cookiecutter#available-templates"&gt;cookiecutter templates&lt;/a&gt; out there.&lt;/p&gt;
&lt;p&gt;Next run cookiecutter against the wagtail-cookiecutter-foundation repo:&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;&lt;span class="nv"&gt;$ &lt;/span&gt;cookiecutter https://github.com/chrisdev/wagtail-cookiecutter-foundation.git
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;You will be prompted to answer the following questions.&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;Cloning into &lt;span class="s1"&gt;&amp;#39;wagtail-cookiecutter-foundation&amp;#39;&lt;/span&gt;...
remote: Counting objects: 611, &lt;span class="k"&gt;done&lt;/span&gt;.
remote: Compressing objects: 100% &lt;span class="o"&gt;(&lt;/span&gt;13/13&lt;span class="o"&gt;)&lt;/span&gt;, &lt;span class="k"&gt;done&lt;/span&gt;.
remote: Total &lt;span class="m"&gt;611&lt;/span&gt; &lt;span class="o"&gt;(&lt;/span&gt;delta 3&lt;span class="o"&gt;)&lt;/span&gt;, reused &lt;span class="m"&gt;0&lt;/span&gt; &lt;span class="o"&gt;(&lt;/span&gt;delta 0&lt;span class="o"&gt;)&lt;/span&gt;, pack-reused 598
Receiving objects: 100% &lt;span class="o"&gt;(&lt;/span&gt;611/611&lt;span class="o"&gt;)&lt;/span&gt;, 423.98 KiB &lt;span class="p"&gt;|&lt;/span&gt; &lt;span class="m"&gt;0&lt;/span&gt; bytes/s, &lt;span class="k"&gt;done&lt;/span&gt;.
Resolving deltas: 100% &lt;span class="o"&gt;(&lt;/span&gt;264/264&lt;span class="o"&gt;)&lt;/span&gt;, &lt;span class="k"&gt;done&lt;/span&gt;.
Checking connectivity... &lt;span class="k"&gt;done&lt;/span&gt;.
project_name &lt;span class="o"&gt;(&lt;/span&gt;default is &lt;span class="s2"&gt;&amp;quot;Wagtail Project&amp;quot;&lt;/span&gt;&lt;span class="o"&gt;)&lt;/span&gt;?
repo_name &lt;span class="o"&gt;(&lt;/span&gt;default is &lt;span class="s2"&gt;&amp;quot;wagtail_project&amp;quot;&lt;/span&gt;&lt;span class="o"&gt;)&lt;/span&gt;?
version_control_system &lt;span class="o"&gt;(&lt;/span&gt;default is &lt;span class="s2"&gt;&amp;quot;hg&amp;quot;&lt;/span&gt;&lt;span class="o"&gt;)&lt;/span&gt;?,
vcs_host &lt;span class="o"&gt;(&lt;/span&gt;default is &lt;span class="s2"&gt;&amp;quot;bitbucket&amp;quot;&lt;/span&gt;&lt;span class="o"&gt;)&lt;/span&gt;?,
author_name &lt;span class="o"&gt;(&lt;/span&gt;default is &lt;span class="s2"&gt;&amp;quot;Your Name&amp;quot;&lt;/span&gt;&lt;span class="o"&gt;)&lt;/span&gt;?
email &lt;span class="o"&gt;(&lt;/span&gt;default is &lt;span class="s2"&gt;&amp;quot;Your email&amp;quot;&lt;/span&gt;&lt;span class="o"&gt;)&lt;/span&gt;?
description &lt;span class="o"&gt;(&lt;/span&gt;default is &lt;span class="s2"&gt;&amp;quot;A short description of the project.&amp;quot;&lt;/span&gt;&lt;span class="o"&gt;)&lt;/span&gt;?
timezone &lt;span class="o"&gt;(&lt;/span&gt;default is &lt;span class="s2"&gt;&amp;quot;UTC&amp;quot;&lt;/span&gt;&lt;span class="o"&gt;)&lt;/span&gt;?
now &lt;span class="o"&gt;(&lt;/span&gt;default is &lt;span class="s2"&gt;&amp;quot;2015/04/16&amp;quot;&lt;/span&gt;&lt;span class="o"&gt;)&lt;/span&gt;?
year &lt;span class="o"&gt;(&lt;/span&gt;default is &lt;span class="s2"&gt;&amp;quot;2015&amp;quot;&lt;/span&gt;&lt;span class="o"&gt;)&lt;/span&gt;?
production_host_name &lt;span class="o"&gt;(&lt;/span&gt;default is  example.org&lt;span class="o"&gt;)&lt;/span&gt;?
use_ssl_in_production &lt;span class="o"&gt;(&lt;/span&gt;default is &lt;span class="nb"&gt;true&lt;/span&gt;&lt;span class="o"&gt;)&lt;/span&gt;?
staging_host_name &lt;span class="o"&gt;(&lt;/span&gt;default is staging.example.org&lt;span class="o"&gt;)&lt;/span&gt;?
use_vagrant_staging &lt;span class="o"&gt;(&lt;/span&gt;default is &lt;span class="nb"&gt;true&lt;/span&gt;&lt;span class="o"&gt;)&lt;/span&gt;?
deploy_user_name &lt;span class="o"&gt;(&lt;/span&gt;default is django&lt;span class="o"&gt;)&lt;/span&gt;
django_admin_user &lt;span class="o"&gt;(&lt;/span&gt;default is my_admin_user&lt;span class="o"&gt;)&lt;/span&gt;
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;Enter the project and take a look around&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;&lt;span class="nv"&gt;$ &lt;/span&gt;&lt;span class="nb"&gt;cd &lt;/span&gt;my_wagtail_project/
&lt;span class="nv"&gt;$ &lt;/span&gt;ls
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;Create a GitHub or Bitbucket repo for the project and push it there&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;&lt;span class="nv"&gt;$ &lt;/span&gt;git init
&lt;span class="nv"&gt;$ &lt;/span&gt;git add .
&lt;span class="nv"&gt;$ &lt;/span&gt;git commit -m &lt;span class="s2"&gt;&amp;quot;first awesome commit&amp;quot;&lt;/span&gt;
&lt;span class="nv"&gt;$ &lt;/span&gt;git remote add origin git@github.com:cclarke/my_wagtail_project.git
&lt;span class="nv"&gt;$ &lt;/span&gt;git push -u origin master
&lt;/pre&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;div class="section" id="quick-start"&gt;
&lt;h2&gt;Quick Start&lt;/h2&gt;
&lt;p&gt;Before you start ensure that you've installed and got the following working.&lt;/p&gt;
&lt;ul class="simple"&gt;
&lt;li&gt;&lt;a class="reference external" href="https://pip.pypa.io/en/stable/"&gt;pip&lt;/a&gt;&lt;/li&gt;
&lt;li&gt;&lt;a class="reference external" href="https://virtualenv.pypa.io/en/latest/"&gt;virtualenv&lt;/a&gt;/&lt;a class="reference external" href="https://docs.python.org/3/library/venv.html#module-venv"&gt;pyenv&lt;/a&gt;/&lt;a class="reference external" href="https://virtualenvwrapper.readthedocs.org/en/latest/"&gt;virtualenvwrapper&lt;/a&gt;&lt;/li&gt;
&lt;li&gt;&lt;a class="reference external" href="http://postgresql.org"&gt;PostgreSQL&lt;/a&gt;&lt;/li&gt;
&lt;li&gt;&lt;a class="reference external" href="https://nodejs.org/en/"&gt;node/npm&lt;/a&gt;, &lt;a class="reference external" href="http://git-scm.com"&gt;git&lt;/a&gt; (and or &lt;a class="reference external" href="https://www.mercurial-scm.org"&gt;mercurial&lt;/a&gt;) and &lt;a class="reference external" href="http://bower.io"&gt;bower&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;p&gt;Your project will contain a Makefile that allows you to setup your development
environment with a single command. To do this run:&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;make all
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;This command will create your project's virtual environment,
install all pip dependencies,  create
the development database, run migrations and load initial data to database,
install front-end dependencies and finally start the development server
for you.  You can access your site at &lt;strong&gt;http://localhost:8000&lt;/strong&gt;. The Admin
back-end is available at &lt;strong&gt;http://localhost:8000/admin/&lt;/strong&gt;.&lt;/p&gt;
&lt;p&gt;Your project will come with a set of application modules to use for building
the sites functionality including:&lt;/p&gt;
&lt;ul class="simple"&gt;
&lt;li&gt;&lt;tt class="docutils literal"&gt;pages&lt;/tt&gt; - Different kinds of pages including, Homepage, Standard Pages, Faqs Page etc.&lt;/li&gt;
&lt;li&gt;&lt;tt class="docutils literal"&gt;blog&lt;/tt&gt; - Blog or site news&lt;/li&gt;
&lt;li&gt;&lt;tt class="docutils literal"&gt;contact&lt;/tt&gt; - Contact Page with included contact us form&lt;/li&gt;
&lt;li&gt;&lt;tt class="docutils literal"&gt;events&lt;/tt&gt; - Events&lt;/li&gt;
&lt;li&gt;&lt;tt class="docutils literal"&gt;photo_gallery&lt;/tt&gt; - Create photo galleries using wagtail tags&lt;/li&gt;
&lt;li&gt;&lt;tt class="docutils literal"&gt;documents&lt;/tt&gt; - Organize documents in folders using wagtail tags .&lt;/li&gt;
&lt;li&gt;&lt;tt class="docutils literal"&gt;products&lt;/tt&gt; - Ideal for a product or portfolio showcase&lt;/li&gt;
&lt;li&gt;&lt;tt class="docutils literal"&gt;feeds&lt;/tt&gt; - RSS/Atom feeds which support enclosures to work with services like Mailchimp and Flipboard&lt;/li&gt;
&lt;li&gt;&lt;tt class="docutils literal"&gt;people&lt;/tt&gt; - For the people in your organization or team.&lt;/li&gt;
&lt;li&gt;&lt;tt class="docutils literal"&gt;faq&lt;/tt&gt; - FAQ and answers.&lt;/li&gt;
&lt;li&gt;&lt;tt class="docutils literal"&gt;utils&lt;/tt&gt; - Various utility functions, templatetags and filters&lt;/li&gt;
&lt;/ul&gt;
&lt;p&gt;However, we take a modular approach so the can pick and choose the modules to
include the project by simple adjusting the &lt;tt class="docutils literal"&gt;INSTALLED_APPS&lt;/tt&gt; in settings.&lt;/p&gt;
&lt;p&gt;When you are ready to provision your production server, simply run:&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;make provision
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;Running this commands will:&lt;/p&gt;
&lt;ul class="simple"&gt;
&lt;li&gt;Create a deployment user on the server to use for the project.&lt;/li&gt;
&lt;li&gt;Create and download download a deployment key for use on services
like Github or Bitbucket&lt;/li&gt;
&lt;li&gt;Install all the required Linux packages and libraries on the server.&lt;/li&gt;
&lt;li&gt;Install and configure the latest version of &lt;a class="reference external" href="http://postgresql.org"&gt;PostgreSQL&lt;/a&gt;.&lt;/li&gt;
&lt;li&gt;Install and configure &lt;a class="reference external" href="http://redis.io"&gt;Redis&lt;/a&gt; and &lt;a class="reference external" href="https://github.com/elastic/elasticsearch"&gt;ElasticSearch&lt;/a&gt;.&lt;/li&gt;
&lt;li&gt;Setup basic security  on the Linux box using &lt;a class="reference external" href="https://help.ubuntu.com/community/UFW"&gt;UFW Firewall&lt;/a&gt; and
&lt;a class="reference external" href="http://www.fail2ban.org/wiki/index.php/Main_Page"&gt;fail2ban&lt;/a&gt;.&lt;/li&gt;
&lt;li&gt;Clone the project's VCS repository, setup a virtual environment and install all the python and django dependencies required to run the site&lt;/li&gt;
&lt;li&gt;Install and configure all required front-end dependencies&lt;/li&gt;
&lt;li&gt;Configure and install a Celery worker process.&lt;/li&gt;
&lt;li&gt;Install and configure an Nginx Virtaul Host for your site.&lt;/li&gt;
&lt;li&gt;Install and configure your SSL certificate (if required) and ensure that
you can score an &lt;em&gt;A&lt;/em&gt; in the popular &lt;a class="reference external" href="https://www.ssllabs.com"&gt;SSL Labs&lt;/a&gt; SSL server test.&lt;/li&gt;
&lt;/ul&gt;
&lt;p&gt;Need to deploy to a staging server? Run run:&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;make provision &lt;span class="nv"&gt;DEPLOY_ENV&lt;/span&gt;&lt;span class="o"&gt;=&lt;/span&gt;staging
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;What! You're running a &lt;a class="reference external" href="https://www.vagrantup.com"&gt;Vagrant&lt;/a&gt; based staging server? Then run:&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;make provision &lt;span class="nv"&gt;DEPLOY_ENV&lt;/span&gt;&lt;span class="o"&gt;=&lt;/span&gt;vagrant
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;Finally, made some changes to your site  and ready to deploy them? Then run:&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;make deploy
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;The &lt;tt class="docutils literal"&gt;deploy&lt;/tt&gt; and &lt;tt class="docutils literal"&gt;provision&lt;/tt&gt; commands drive on suite of &lt;a class="reference external" href="http://docs.ansible.com"&gt;Ansible&lt;/a&gt; playbooks to
run the provisioning and deployment tasks on your servers.
&lt;a class="reference external" href="https://www.vagrantup.com"&gt;Vagrant&lt;/a&gt; based staging servers are supported, so you
can &amp;quot;stage&amp;quot; your site locally and tweak and experiment with different
deployment configurations before expending your resources on hosting providers.
To keep things simple, we assume that all your application components such as;
&lt;tt class="docutils literal"&gt;Django&lt;/tt&gt;, &lt;tt class="docutils literal"&gt;PostgreSQL&lt;/tt&gt;, &lt;tt class="docutils literal"&gt;redis&lt;/tt&gt; and so on, are all deployed on a single
server.  However, it is a relatively straightforward procedure to tweak the
playbooks support more complex provisioning scenarios.  In this way, you can
support for example, independent database server, multiple upstream &lt;tt class="docutils literal"&gt;wsgi&lt;/tt&gt;
servers and so on. For more check the online &lt;a class="reference external" href="http://wagtail-cookiecutter-foundation.readthedocs.org/en/latest/"&gt;documentation&lt;/a&gt;.&lt;/p&gt;
&lt;/div&gt;
&lt;div class="section" id="summary"&gt;
&lt;h2&gt;Summary&lt;/h2&gt;
&lt;p&gt;Over the last few months &lt;a class="reference external" href="http://wagtail-cookiecutter-foundation.readthedocs.org/en/latest/"&gt;wagtail-cookiecutter-foundation&lt;/a&gt; has been a great time
saver for us here at &lt;a class="reference external" href="http://chrisdev.com"&gt;ChrisDev&lt;/a&gt;, but there are many
features that we'd love to include in future releases. These include:&lt;/p&gt;
&lt;ul class="simple"&gt;
&lt;li&gt;Make more use of the Wagtail &lt;a class="reference external" href="http://docs.wagtail.io/en/v1.3.1/topics/streamfield.html"&gt;StreamField&lt;/a&gt; in more complex pages such as the
homepage&lt;/li&gt;
&lt;li&gt;The use of with &lt;a class="reference external" href="https://letsencrypt.org"&gt;Lets Encrypt&lt;/a&gt; for the generation and maintenance of SSL
certificates.&lt;/li&gt;
&lt;li&gt;Turn some of the bundled modules like Feeds into stand alone reusable Django applications.&lt;/li&gt;
&lt;li&gt;Add more funtional tests for the the projects generated with the cookiecutter&lt;/li&gt;
&lt;/ul&gt;
&lt;p&gt;You can find more of of these as well a bug reports in our &lt;a class="reference external" href="https://github.com/chrisdev/wagtail-cookiecutter-foundation/issues"&gt;issue tracker&lt;/a&gt;.
We're open to new ideas and happy to take your pull requests.&lt;/p&gt;
&lt;/div&gt;
</summary><category term="Wagtail"></category><category term="CMS"></category><category term="Content Managment"></category><category term="Django"></category><category term="Zurb-Foundation"></category><category term="Foundation-6"></category></entry><entry><title>How I Setup my Macs for Python Development</title><link href="/setting-up-your-python-development-environment-on-osx-mavericks.html" rel="alternate"></link><updated>2014-04-17T00:00:00-04:00</updated><author><name>Christopher Clarke</name></author><id>tag:,2014-04-17:setting-up-your-python-development-environment-on-osx-mavericks.html</id><summary type="html">&lt;div class="figure"&gt;
&lt;img alt="This is a test" src="/images/setting-up-my-mac-for-python-dev.jpg" /&gt;
&lt;/div&gt;
&lt;p&gt;I've been asked about this a few times already this month so I've decided to
write down what I do to set up a new Mac for (mainly) Python Development.&lt;/p&gt;
&lt;div class="section" id="first-install-dropbox-and-sync-folders"&gt;
&lt;h2&gt;First, Install Dropbox and Sync Folders&lt;/h2&gt;
&lt;p&gt;I keep my development folders on &lt;a class="reference external" href="http://dropbox.com"&gt;Dropbox&lt;/a&gt;
as this gives me some degree of machine independence.
More recently,  I've also started to keep my &lt;tt class="docutils literal"&gt;dotfiles&lt;/tt&gt;
on &lt;tt class="docutils literal"&gt;Dropbox&lt;/tt&gt; and  use &lt;a class="reference external" href="https://github.com/lra/mackup/"&gt;MackUp&lt;/a&gt; to handle
the syncing of the &lt;tt class="docutils literal"&gt;dotfiles&lt;/tt&gt; between machines.
&lt;tt class="docutils literal"&gt;MackUp&lt;/tt&gt; is a pretty straight forward symbolic linking system and it
basically does what I would have done if I had rolled my own utility.
Be aware though that &lt;tt class="docutils literal"&gt;Mackup's&lt;/tt&gt; default behavior is to put your
&lt;tt class="docutils literal"&gt;.ssh&lt;/tt&gt; folder and its contents on Dropbox.
If you don't like this behavior then it must be overridden manually.  I always
start by installing &lt;tt class="docutils literal"&gt;Dropbox&lt;/tt&gt; and syncing my Development folders, as
I typically have lots of stuff of on &lt;tt class="docutils literal"&gt;Dropbox&lt;/tt&gt; so it takes a while to
sync everything.  You  may want to consider using  the
&lt;a class="reference external" href="https://www.dropbox.com/help/175/en"&gt;Selective Sync&lt;/a&gt;
feature to control the syncing process.&lt;/p&gt;
&lt;/div&gt;
&lt;div class="section" id="upgrade-your-terminal-install-iterm-2"&gt;
&lt;h2&gt;Upgrade your Terminal: Install Iterm 2&lt;/h2&gt;
&lt;p&gt;You're going to need a decent terminal application for your command line work.
While the bundled OS X terminal application has gotten a lot better
with recent releases of the &lt;tt class="docutils literal"&gt;OS X&lt;/tt&gt; it still has a way to go to match
&lt;a class="reference external" href="http://www.iterm2.com/"&gt;Item2&lt;/a&gt;. Some of the many features of &lt;tt class="docutils literal"&gt;Iterm&lt;/tt&gt;
are listed &lt;a class="reference external" href="http://www.iterm2.com/#/section/features/full_screen"&gt;here&lt;/a&gt;. So use
&lt;a class="reference external" href="http://www.iterm2.com/"&gt;Item2&lt;/a&gt; as your terminal.&lt;/p&gt;
&lt;/div&gt;
&lt;div class="section" id="install-xcode-you-ll-need-at-least-the-command-line-tools"&gt;
&lt;h2&gt;Install XCode: You'll need at least the Command Line Tools&lt;/h2&gt;
&lt;p&gt;You need to install either the full version &lt;tt class="docutils literal"&gt;Xcode&lt;/tt&gt; or at least to the
Command line tools.
These can be actually installed from the command line by entering the following
in you terminal window&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;xcode-select --install
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;You will then be prompted to either install the full &lt;tt class="docutils literal"&gt;Xcode&lt;/tt&gt; or
just the command line developer tools, with the latter being the default.
Once you’ve installed one or the other, you can proceed to installing &lt;tt class="docutils literal"&gt;Homebrew&lt;/tt&gt;.&lt;/p&gt;
&lt;/div&gt;
&lt;div class="section" id="install-homebrew"&gt;
&lt;h2&gt;Install Homebrew&lt;/h2&gt;
&lt;p&gt;&lt;a class="reference external" href="http://brew.sh"&gt;Homebrew&lt;/a&gt; is a package management system that simplifies
the installation of libraries, tools and utilities you typically need for
development.  &lt;tt class="docutils literal"&gt;Homebrew&lt;/tt&gt; is actually a Ruby application and to install it
just visit the &lt;tt class="docutils literal"&gt;Homebrew&lt;/tt&gt;
homepage copy and paste the code listed under &lt;em&gt;Install Homebrew&lt;/em&gt; into your
terminal. The install snippet changes occasionally and it is currently&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;ruby -e &lt;span class="s2"&gt;&amp;quot;&lt;/span&gt;&lt;span class="k"&gt;$(&lt;/span&gt;curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install&lt;span class="k"&gt;)&lt;/span&gt;&lt;span class="s2"&gt;&amp;quot;&lt;/span&gt;
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;But be remember to visit &lt;a class="reference external" href="http://brew.sh"&gt;Homebrew homepage&lt;/a&gt; to get the
correct code snippet. Next run&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;brew doctor
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;and then&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;brew update
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;Then to install some packages to make sure everything works&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;brew install ssh-copy-id git mercurial mackup
&lt;/pre&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;div class="section" id="set-up-your-shell-environment"&gt;
&lt;h2&gt;Set Up Your Shell Environment&lt;/h2&gt;
&lt;p&gt;I'm a convert to  &lt;tt class="docutils literal"&gt;Zsh&lt;/tt&gt; or really
&lt;a class="reference external" href="https://github.com/robbyrussell/oh-my-zsh/"&gt;oh-my-zsh&lt;/a&gt;.  However,
the same would apply if you used &lt;tt class="docutils literal"&gt;bash&lt;/tt&gt; or any other shell
If you are using the bash shell then edit your &lt;tt class="docutils literal"&gt;bash_profile&lt;/tt&gt;&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;vi ~/.bash_profile
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;or for &lt;tt class="docutils literal"&gt;&lt;span class="pre"&gt;oh-my-zsh&lt;/span&gt;&lt;/tt&gt;&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;vi  ~/.zshrc
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;Add the following lines&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;&lt;span class="c"&gt;# set the architecture flags&lt;/span&gt;
&lt;span class="nb"&gt;export &lt;/span&gt;&lt;span class="nv"&gt;ARCHFLAGS&lt;/span&gt;&lt;span class="o"&gt;=&lt;/span&gt;&lt;span class="s2"&gt;&amp;quot;-arch x86_64&amp;quot;&lt;/span&gt;
&lt;span class="c"&gt;# Ensure that local bin is first in path&lt;/span&gt;
&lt;span class="nb"&gt;export &lt;/span&gt;&lt;span class="nv"&gt;PATH&lt;/span&gt;&lt;span class="o"&gt;=&lt;/span&gt;/usr/local/bin:&lt;span class="nv"&gt;$PATH&lt;/span&gt;
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;These changes will take effect the next time you restart the shell.
Rather, than restarting your shell simply type the following in the terminal.&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;&lt;span class="nb"&gt;source&lt;/span&gt; ~/.zshrc
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;or if you are using &lt;tt class="docutils literal"&gt;bash&lt;/tt&gt;&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;&lt;span class="nb"&gt;source&lt;/span&gt; ~/.bash_profile
&lt;/pre&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;div class="section" id="use-the-homebrew-python"&gt;
&lt;h2&gt;Use the Homebrew Python&lt;/h2&gt;
&lt;p&gt;Apple has always bundled &lt;tt class="docutils literal"&gt;Python&lt;/tt&gt; along with its OS releases.
However, we advise you not to use the bundled &lt;tt class="docutils literal"&gt;Python&lt;/tt&gt; for development
and instead to install &lt;tt class="docutils literal"&gt;Python&lt;/tt&gt; via &lt;tt class="docutils literal"&gt;homebrew&lt;/tt&gt;. We prefer the &lt;tt class="docutils literal"&gt;brew&lt;/tt&gt;
Python for a number of reasons including :&lt;/p&gt;
&lt;ul class="simple"&gt;
&lt;li&gt;Apple makes changes to its bundled Python and this can
gives rise to bugs and incompatibilities.&lt;/li&gt;
&lt;li&gt;If you use the bundled &lt;tt class="docutils literal"&gt;Python&lt;/tt&gt; you can upgrade to the latest and the
greatest version of &lt;tt class="docutils literal"&gt;OS X&lt;/tt&gt;  you may find that your packages,
&lt;tt class="docutils literal"&gt;virtualenvs&lt;/tt&gt; etc. may all need to be reinstalled and recreated&lt;/li&gt;
&lt;li&gt;As new versions of &lt;tt class="docutils literal"&gt;Python&lt;/tt&gt; are released, the bundled &lt;tt class="docutils literal"&gt;Python&lt;/tt&gt; becomes
more and more out-of-date.  &lt;tt class="docutils literal"&gt;Homebrew&lt;/tt&gt; will allow you the upgrade to
the most recent versions of Python (2 or 3).&lt;/li&gt;
&lt;li&gt;&lt;tt class="docutils literal"&gt;Homebrew&lt;/tt&gt; allows you to easily play around with &lt;tt class="docutils literal"&gt;Python 3&lt;/tt&gt; as it comes
with &lt;tt class="docutils literal"&gt;pip3&lt;/tt&gt; for installing packages&lt;/li&gt;
&lt;/ul&gt;
&lt;p&gt;To install &lt;tt class="docutils literal"&gt;Python&lt;/tt&gt; with &lt;tt class="docutils literal"&gt;homebrew&lt;/tt&gt; enter&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;brew install python
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;And optionally install Python 3&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;brew install python3
&lt;/pre&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;div class="section" id="install-virtualenv-and-virtualenv-wrapper"&gt;
&lt;h2&gt;Install VirtualEnv and VirtualEnv Wrapper&lt;/h2&gt;
&lt;p&gt;A &lt;em&gt;Virtual Environment&lt;/em&gt;, is an isolated working copy of &lt;tt class="docutils literal"&gt;Python&lt;/tt&gt; and installed
packages that allows you to work on a specific project without the worry of
affecting other projects.&lt;/p&gt;
&lt;p&gt;The &lt;tt class="docutils literal"&gt;virtualenv&lt;/tt&gt; package allows you to create virtual environments while the
&lt;tt class="docutils literal"&gt;virtualenvwrapper&lt;/tt&gt; package provides a framework for organizing
your virtual environments.  Install them using &lt;tt class="docutils literal"&gt;pip&lt;/tt&gt;&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;pip install virtualenv

pip install virtualenvwrapper
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;Next, create a directory to store your virtual environments&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;mkdir -p ~/virtualenvs
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;We’ll then edit the &lt;tt class="docutils literal"&gt;&lt;span class="pre"&gt;~/.zshrc&lt;/span&gt;&lt;/tt&gt; file or (&lt;tt class="docutils literal"&gt;.bashrc&lt;/tt&gt; or &lt;tt class="docutils literal"&gt;.bash_profile&lt;/tt&gt;)&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;vim ~/.zshrc
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;and add the following lines to it&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;&lt;span class="c"&gt;# cache pip-installed packages to avoid re-downloading&lt;/span&gt;
&lt;span class="nb"&gt;export &lt;/span&gt;&lt;span class="nv"&gt;PIP_DOWNLOAD_CACHE&lt;/span&gt;&lt;span class="o"&gt;=&lt;/span&gt;&lt;span class="nv"&gt;$HOME&lt;/span&gt;/.pip/cache

&lt;span class="nb"&gt;export &lt;/span&gt;&lt;span class="nv"&gt;WORKON_HOME&lt;/span&gt;&lt;span class="o"&gt;=&lt;/span&gt;&lt;span class="nv"&gt;$HOME&lt;/span&gt;/virtualenvs
&lt;span class="nb"&gt;source&lt;/span&gt; /usr/local/bin/virtualenvwrapper.sh
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;Restart your terminal or type the following in the terminal window&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;&lt;span class="nb"&gt;source&lt;/span&gt; ~/.zshrc
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;or&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;&lt;span class="nb"&gt;source&lt;/span&gt; ~/.bash_profile
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;Next, we want to test out your setup by building a &lt;tt class="docutils literal"&gt;C&lt;/tt&gt; based python package.
Start by installing some shared libraries via brew&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;brew install libjpeg lcms libtiff libpng freetype
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;Next create a test &lt;tt class="docutils literal"&gt;virtualenv&lt;/tt&gt; and install the &lt;tt class="docutils literal"&gt;C&lt;/tt&gt; based python package
in this case &lt;a class="reference external" href="https://pypi.python.org/pypi/Pillow/"&gt;Pillow&lt;/a&gt; which
needs to be built against the shared libraries that you just installed
using &lt;tt class="docutils literal"&gt;brew&lt;/tt&gt;&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;mkvirtalenv &lt;span class="nb"&gt;test&lt;/span&gt;-env
pip install Pillow
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;Everything is fine if you get a post install message like similar to the
one shown below&lt;/p&gt;
&lt;pre class="literal-block"&gt;
PIL SETUP SUMMARY
--------------------------------------------------------------------
version      Pillow 2.4.0
platform     darwin 2.7.6 (default, Apr  9 2014, 11:48:52)
             [GCC 4.2.1 Compatible Apple LLVM 5.1 (clang-503.0.38)]
--------------------------------------------------------------------
--- TKINTER support available
--- JPEG support available
*** OPENJPEG (JPEG2000) support not available
--- ZLIB (PNG/ZIP) support available
--- LIBTIFF support available
--- FREETYPE2 support available
*** LITTLECMS2 support not available
*** WEBP support not available
*** WEBPMUX support not available
&lt;/pre&gt;
&lt;/div&gt;
&lt;div class="section" id="extras"&gt;
&lt;h2&gt;Extras&lt;/h2&gt;
&lt;div class="section" id="postgresql"&gt;
&lt;h3&gt;PostgreSQL&lt;/h3&gt;
&lt;p&gt;You can of course use &lt;tt class="docutils literal"&gt;homebrew&lt;/tt&gt; to install &lt;tt class="docutils literal"&gt;PostgreSQL&lt;/tt&gt;.
However, I've found that that it takes a lot of manual tweaking to get all
the procedural languages (&lt;tt class="docutils literal"&gt;PL/pgSQL&lt;/tt&gt;, &lt;tt class="docutils literal"&gt;PL/Python&lt;/tt&gt;, &lt;tt class="docutils literal"&gt;PLV8&lt;/tt&gt; etc.) as well
as extensions like &lt;a class="reference external" href="http://postgis.net/"&gt;PostGIS&lt;/a&gt;, &lt;tt class="docutils literal"&gt;hstore&lt;/tt&gt; etc.  working.
In contrast, &lt;a class="reference external" href="http://postgresapp.com/"&gt;Postgresapp&lt;/a&gt;
pretty much works out of the box and gives you stable, up-to-date version
PostgreSQL/PostGIS pretty much configured for any kind of development that
you are likely to do.  &lt;tt class="docutils literal"&gt;Postgresapp&lt;/tt&gt; also comes with
the full set of &lt;tt class="docutils literal"&gt;PostgeSQL/PostGIS&lt;/tt&gt; command line tools however, you need to
add the bin directory to your path. As before, depending on you shell
of choice add the following to your &lt;tt class="docutils literal"&gt;.zshrc&lt;/tt&gt; , &lt;tt class="docutils literal"&gt;.bash_profile&lt;/tt&gt; or
&lt;tt class="docutils literal"&gt;.bashrc&lt;/tt&gt;&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;&lt;span class="nv"&gt;PATH&lt;/span&gt;&lt;span class="o"&gt;=&lt;/span&gt;&lt;span class="s2"&gt;&amp;quot;/usr/local/bin:/Applications/Postgres.app/Contents/MacOS/bin:&lt;/span&gt;&lt;span class="nv"&gt;$PATH&lt;/span&gt;&lt;span class="s2"&gt;&amp;quot;&lt;/span&gt;
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;Restart you terminal app or type the following in the terminal window&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;&lt;span class="nb"&gt;source&lt;/span&gt; ~/.zshrc
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;or if you use another shell example &lt;tt class="docutils literal"&gt;bash&lt;/tt&gt;&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;&lt;span class="nb"&gt;source&lt;/span&gt; ~/.bash_profile
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;Finally, test out your setup by typing&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;createdb &lt;span class="nb"&gt;test&lt;/span&gt;-db &lt;span class="c"&gt;#create a new database&lt;/span&gt;
psql &lt;span class="nb"&gt;test&lt;/span&gt;-db
dropdb &lt;span class="nb"&gt;test&lt;/span&gt;-db
&lt;/pre&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;div class="section" id="install-a-gui-version-control-client"&gt;
&lt;h3&gt;Install a GUI Version Control Client&lt;/h3&gt;
&lt;p&gt;While we can use &lt;tt class="docutils literal"&gt;Homebrew&lt;/tt&gt; to install source control tools (i.e &lt;tt class="docutils literal"&gt;git&lt;/tt&gt;
and or &lt;tt class="docutils literal"&gt;mercurical&lt;/tt&gt;) many new developers, or those coming from backgrounds
in design can sometimes feel a bit intimidated by using
&lt;tt class="docutils literal"&gt;git&lt;/tt&gt; and &lt;tt class="docutils literal"&gt;mecurical&lt;/tt&gt; from the command line.
So to help them get over the hump we usually recommend they also install a free
&lt;tt class="docutils literal"&gt;git&lt;/tt&gt; and &lt;tt class="docutils literal"&gt;mercurial&lt;/tt&gt; GUI client such as
&lt;a class="reference external" href="http://www.sourcetreeapp.com"&gt;SourceTree&lt;/a&gt;.&lt;/p&gt;
&lt;/div&gt;
&lt;div class="section" id="python-data-tools"&gt;
&lt;h3&gt;Python Data Tools&lt;/h3&gt;
&lt;p&gt;Python is becomming more and more popular for statistics, data analysis and data
science tasks.  In particular you may be interested in in developing solutions
using the &lt;a class="reference external" href="http://scipy.org"&gt;SciPy&lt;/a&gt; stack and using tools like &lt;a class="reference external" href="http://ipython.org"&gt;IPython&lt;/a&gt;,
&lt;a class="reference external" href="http://matplotlib.org"&gt;Matplotlib&lt;/a&gt;, &lt;a class="reference external" href="http://pydata.pandas.org"&gt;Pandas&lt;/a&gt; , &lt;a class="reference external" href="http://matplotlib"&gt;scikit-learn&lt;/a&gt; , etc.  The usual recommendation
is to use a binary distribution such as &lt;a class="reference external" href="https://store.continuum.io/cshop/anaconda/"&gt;Anaconda&lt;/a&gt; or &lt;a class="reference external" href="https://www.enthought.com/downloads/"&gt;Enthought Canopy&lt;/a&gt;, but
as a developer you will want/need to use the source distribution. Start by adding
these lines to your &lt;tt class="docutils literal"&gt;.zshrc&lt;/tt&gt; or &lt;tt class="docutils literal"&gt;.bash_profile&lt;/tt&gt;.&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;&lt;span class="nb"&gt;export &lt;/span&gt;&lt;span class="nv"&gt;CFLAGS&lt;/span&gt;&lt;span class="o"&gt;=&lt;/span&gt;&lt;span class="s2"&gt;&amp;quot;-arch i386 -arch x86_64&amp;quot;&lt;/span&gt;
&lt;span class="nb"&gt;export &lt;/span&gt;&lt;span class="nv"&gt;FFLAGS&lt;/span&gt;&lt;span class="o"&gt;=&lt;/span&gt;&lt;span class="s2"&gt;&amp;quot;-m32 -m64&amp;quot;&lt;/span&gt;
&lt;span class="nb"&gt;export &lt;/span&gt;&lt;span class="nv"&gt;LDFLAGS&lt;/span&gt;&lt;span class="o"&gt;=&lt;/span&gt;&lt;span class="s2"&gt;&amp;quot;-Wall -undefined dynamic_lookup -bundle -arch i386 -arch x86_64&amp;quot;&lt;/span&gt;
&lt;span class="nb"&gt;export &lt;/span&gt;&lt;span class="nv"&gt;CC&lt;/span&gt;&lt;span class="o"&gt;=&lt;/span&gt;gcc
&lt;span class="nb"&gt;export &lt;/span&gt;&lt;span class="nv"&gt;CXX&lt;/span&gt;&lt;span class="o"&gt;=&lt;/span&gt;&lt;span class="s2"&gt;&amp;quot;g++ -arch i386 -arch x86_64&amp;quot;&lt;/span&gt;
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;This should take care of problems you can sometimes encounter in building
some &lt;tt class="docutils literal"&gt;numpy&lt;/tt&gt; and &lt;tt class="docutils literal"&gt;scipy&lt;/tt&gt; extensions.&lt;/p&gt;
&lt;p&gt;Next install some of the perquisites libraries and applications using
&lt;tt class="docutils literal"&gt;homebrew.&lt;/tt&gt;&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;brew install gfortran pkg-config zeromq readline
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;Then install &lt;tt class="docutils literal"&gt;numpy&lt;/tt&gt; and &lt;tt class="docutils literal"&gt;scipy&lt;/tt&gt;  using pip. We will also install
&lt;tt class="docutils literal"&gt;nose&lt;/tt&gt; so we can run the test suite.&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;pip install numpy
pip install scipy
pip install nose
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;Note, I'm installing these packages directly to the system site packages i.e.
in &lt;tt class="docutils literal"&gt;&lt;span class="pre"&gt;/usr/local/lib/python-2.7/site-packages&lt;/span&gt;&lt;/tt&gt; as opposed to a
particular &lt;tt class="docutils literal"&gt;virtualenv&lt;/tt&gt; as I often use &lt;tt class="docutils literal"&gt;pydata&lt;/tt&gt; packages for ad-hoc
hacking and experimentation.
You can run the test suite by starting &lt;tt class="docutils literal"&gt;Python&lt;/tt&gt; and running&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;&lt;span class="kn"&gt;import&lt;/span&gt; &lt;span class="nn"&gt;scipy&lt;/span&gt;
&lt;span class="kn"&gt;import&lt;/span&gt; &lt;span class="nn"&gt;numpy&lt;/span&gt;

&lt;span class="n"&gt;numpy&lt;/span&gt;&lt;span class="o"&gt;.&lt;/span&gt;&lt;span class="n"&gt;test&lt;/span&gt;&lt;span class="p"&gt;()&lt;/span&gt;
&lt;span class="n"&gt;scipy&lt;/span&gt;&lt;span class="o"&gt;.&lt;/span&gt;&lt;span class="n"&gt;test&lt;/span&gt;&lt;span class="p"&gt;()&lt;/span&gt;
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;Almost all the &lt;tt class="docutils literal"&gt;numpy&lt;/tt&gt; test should pass but interestingly there will be quite
a few known failures with &lt;tt class="docutils literal"&gt;scipy&lt;/tt&gt;. This should not be a problem&lt;/p&gt;
&lt;p&gt;Next install &lt;tt class="docutils literal"&gt;pandas&lt;/tt&gt;&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;pip install pandas
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;Then we can install &lt;tt class="docutils literal"&gt;IPython&lt;/tt&gt; (including support for the IPython notebook) ,
as well as &lt;tt class="docutils literal"&gt;matplotlib&lt;/tt&gt; and the &lt;tt class="docutils literal"&gt;ipython sql extension&lt;/tt&gt;
which allows you to to connect to a database and then issue SQL
commands within &lt;tt class="docutils literal"&gt;IPython&lt;/tt&gt; or &lt;tt class="docutils literal"&gt;IPython Notebook&lt;/tt&gt;.&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;pip install jinga2
pip install ipython pyzmq tornado pygments
pip install matplotlib
pip install pycopg2
pip install ipython-sql
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;Check that everything is setup properly by launching the IPython notebook with
&lt;tt class="docutils literal"&gt;matplotlib&lt;/tt&gt; integration.&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;ipython notebook --pylab&lt;span class="o"&gt;=&lt;/span&gt;inline
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;Here is a sample session from notebook I created&lt;/p&gt;
&lt;p&gt;Start by importing &lt;tt class="docutils literal"&gt;pandas&lt;/tt&gt; and load the &lt;tt class="docutils literal"&gt;sql&lt;/tt&gt; magics&lt;/p&gt;
&lt;pre class="code python literal-block"&gt;
&lt;span class="kn"&gt;import&lt;/span&gt; &lt;span class="nn"&gt;pandas&lt;/span&gt; &lt;span class="kn"&gt;as&lt;/span&gt; &lt;span class="nn"&gt;pd&lt;/span&gt;
&lt;span class="o"&gt;%&lt;/span&gt;&lt;span class="n"&gt;load_ext&lt;/span&gt; &lt;span class="n"&gt;sql&lt;/span&gt;
&lt;/pre&gt;
&lt;p&gt;Connect to a &lt;tt class="docutils literal"&gt;PosgreSQL&lt;/tt&gt; database with data from the Trinidad and Tobago
stock exchange and execute sql&lt;/p&gt;
&lt;pre class="code python literal-block"&gt;
&lt;span class="o"&gt;%%&lt;/span&gt;&lt;span class="n"&gt;sql&lt;/span&gt; &lt;span class="n"&gt;postgresql&lt;/span&gt;&lt;span class="p"&gt;:&lt;/span&gt;&lt;span class="o"&gt;//&lt;/span&gt;&lt;span class="n"&gt;localhost&lt;/span&gt;&lt;span class="o"&gt;/&lt;/span&gt;&lt;span class="n"&gt;mass&lt;/span&gt;&lt;span class="o"&gt;-&lt;/span&gt;&lt;span class="n"&gt;db&lt;/span&gt;
&lt;span class="n"&gt;select&lt;/span&gt; &lt;span class="n"&gt;sd&lt;/span&gt;&lt;span class="o"&gt;.&lt;/span&gt;&lt;span class="n"&gt;dateix&lt;/span&gt;&lt;span class="p"&gt;,&lt;/span&gt; &lt;span class="n"&gt;s&lt;/span&gt;&lt;span class="o"&gt;.&lt;/span&gt;&lt;span class="n"&gt;ticker&lt;/span&gt;&lt;span class="p"&gt;,&lt;/span&gt; &lt;span class="n"&gt;sd&lt;/span&gt;&lt;span class="o"&gt;.&lt;/span&gt;&lt;span class="n"&gt;close_price&lt;/span&gt;&lt;span class="p"&gt;,&lt;/span&gt; &lt;span class="n"&gt;sd&lt;/span&gt;&lt;span class="o"&gt;.&lt;/span&gt;&lt;span class="n"&gt;volume&lt;/span&gt; &lt;span class="kn"&gt;from&lt;/span&gt; &lt;span class="nn"&gt;markets_symboldata&lt;/span&gt; &lt;span class="nn"&gt;sd&lt;/span&gt;&lt;span class="p"&gt;,&lt;/span&gt; &lt;span class="n"&gt;markets_symbol&lt;/span&gt; &lt;span class="n"&gt;s&lt;/span&gt;
&lt;span class="n"&gt;where&lt;/span&gt; &lt;span class="n"&gt;s&lt;/span&gt;&lt;span class="o"&gt;.&lt;/span&gt;&lt;span class="n"&gt;id&lt;/span&gt;&lt;span class="o"&gt;=&lt;/span&gt;&lt;span class="n"&gt;sd&lt;/span&gt;&lt;span class="o"&gt;.&lt;/span&gt;&lt;span class="n"&gt;symbol_id&lt;/span&gt; &lt;span class="n"&gt;order&lt;/span&gt; &lt;span class="n"&gt;by&lt;/span&gt; &lt;span class="n"&gt;sd&lt;/span&gt;&lt;span class="o"&gt;.&lt;/span&gt;&lt;span class="n"&gt;dateix&lt;/span&gt; &lt;span class="n"&gt;desc&lt;/span&gt; &lt;span class="n"&gt;limit&lt;/span&gt; &lt;span class="mi"&gt;10&lt;/span&gt;&lt;span class="p"&gt;;&lt;/span&gt;
&lt;/pre&gt;
&lt;pre class="literal-block"&gt;
10 rows affected.
&lt;/pre&gt;
&lt;table&gt;
    &lt;tr&gt;
        &lt;th&gt;dateix&lt;/th&gt;
        &lt;th&gt;ticker&lt;/th&gt;
        &lt;th&gt;close_price&lt;/th&gt;
        &lt;th&gt;volume&lt;/th&gt;
    &lt;/tr&gt;
    &lt;tr&gt;
        &lt;td&gt;2014-01-27 00:00:00-04:00&lt;/td&gt;
        &lt;td&gt;NCBJ&lt;/td&gt;
        &lt;td&gt;1.0&lt;/td&gt;
        &lt;td&gt;1901965&lt;/td&gt;
    &lt;/tr&gt;
    &lt;tr&gt;
        &lt;td&gt;2014-01-27 00:00:00-04:00&lt;/td&gt;
        &lt;td&gt;RBL&lt;/td&gt;
        &lt;td&gt;116.52&lt;/td&gt;
        &lt;td&gt;8109&lt;/td&gt;
    &lt;/tr&gt;
    &lt;tr&gt;
        &lt;td&gt;2014-01-27 00:00:00-04:00&lt;/td&gt;
        &lt;td&gt;GHL&lt;/td&gt;
        &lt;td&gt;14.0&lt;/td&gt;
        &lt;td&gt;4294&lt;/td&gt;
    &lt;/tr&gt;
    &lt;tr&gt;
        &lt;td&gt;2014-01-27 00:00:00-04:00&lt;/td&gt;
        &lt;td&gt;JMMB&lt;/td&gt;
        &lt;td&gt;0.49&lt;/td&gt;
        &lt;td&gt;18500&lt;/td&gt;
    &lt;/tr&gt;
    &lt;tr&gt;
        &lt;td&gt;2014-01-27 00:00:00-04:00&lt;/td&gt;
        &lt;td&gt;NEL&lt;/td&gt;
        &lt;td&gt;18.25&lt;/td&gt;
        &lt;td&gt;1348&lt;/td&gt;
    &lt;/tr&gt;
    &lt;tr&gt;
        &lt;td&gt;2014-01-27 00:00:00-04:00&lt;/td&gt;
        &lt;td&gt;NFM&lt;/td&gt;
        &lt;td&gt;0.96&lt;/td&gt;
        &lt;td&gt;15500&lt;/td&gt;
    &lt;/tr&gt;
    &lt;tr&gt;
        &lt;td&gt;2014-01-27 00:00:00-04:00&lt;/td&gt;
        &lt;td&gt;AHL&lt;/td&gt;
        &lt;td&gt;11.0&lt;/td&gt;
        &lt;td&gt;1000&lt;/td&gt;
    &lt;/tr&gt;
    &lt;tr&gt;
        &lt;td&gt;2014-01-27 00:00:00-04:00&lt;/td&gt;
        &lt;td&gt;FIRST&lt;/td&gt;
        &lt;td&gt;42.4&lt;/td&gt;
        &lt;td&gt;3891&lt;/td&gt;
    &lt;/tr&gt;
    &lt;tr&gt;
        &lt;td&gt;2014-01-27 00:00:00-04:00&lt;/td&gt;
        &lt;td&gt;CIF&lt;/td&gt;
        &lt;td&gt;22.75&lt;/td&gt;
        &lt;td&gt;3210&lt;/td&gt;
    &lt;/tr&gt;
    &lt;tr&gt;
        &lt;td&gt;2014-01-27 00:00:00-04:00&lt;/td&gt;
        &lt;td&gt;SBTT&lt;/td&gt;
        &lt;td&gt;73.12&lt;/td&gt;
        &lt;td&gt;624&lt;/td&gt;
    &lt;/tr&gt;
&lt;/table&gt;&lt;p&gt;Execute another query using the connection established above to retrieve
the last 100 days of data for GHL. Store the result in a variable called
results&lt;/p&gt;
&lt;pre class="code python literal-block"&gt;
&lt;span class="n"&gt;result&lt;/span&gt; &lt;span class="o"&gt;=&lt;/span&gt; &lt;span class="o"&gt;%&lt;/span&gt;&lt;span class="n"&gt;sql&lt;/span&gt; &lt;span class="n"&gt;select&lt;/span&gt; &lt;span class="n"&gt;sd&lt;/span&gt;&lt;span class="o"&gt;.&lt;/span&gt;&lt;span class="n"&gt;dateix&lt;/span&gt;&lt;span class="p"&gt;,&lt;/span&gt; &lt;span class="n"&gt;s&lt;/span&gt;&lt;span class="o"&gt;.&lt;/span&gt;&lt;span class="n"&gt;ticker&lt;/span&gt;&lt;span class="p"&gt;,&lt;/span&gt; &lt;span class="n"&gt;sd&lt;/span&gt;&lt;span class="o"&gt;.&lt;/span&gt;&lt;span class="n"&gt;close_price&lt;/span&gt;&lt;span class="p"&gt;,&lt;/span&gt; &lt;span class="n"&gt;sd&lt;/span&gt;&lt;span class="o"&gt;.&lt;/span&gt;&lt;span class="n"&gt;volume&lt;/span&gt; &lt;span class="kn"&gt;from&lt;/span&gt; &lt;span class="nn"&gt;markets_symboldata&lt;/span&gt; &lt;span class="nn"&gt;sd&lt;/span&gt;&lt;span class="p"&gt;,&lt;/span&gt; &lt;span class="n"&gt;markets_symbol&lt;/span&gt; &lt;span class="n"&gt;s&lt;/span&gt; &lt;span class="n"&gt;where&lt;/span&gt; &lt;span class="n"&gt;s&lt;/span&gt;&lt;span class="o"&gt;.&lt;/span&gt;&lt;span class="n"&gt;id&lt;/span&gt;&lt;span class="o"&gt;=&lt;/span&gt;&lt;span class="n"&gt;sd&lt;/span&gt;&lt;span class="o"&gt;.&lt;/span&gt;&lt;span class="n"&gt;symbol_id&lt;/span&gt; &lt;span class="ow"&gt;and&lt;/span&gt; &lt;span class="n"&gt;s&lt;/span&gt;&lt;span class="o"&gt;.&lt;/span&gt;&lt;span class="n"&gt;ticker&lt;/span&gt;&lt;span class="o"&gt;=&lt;/span&gt;&lt;span class="s"&gt;'GHL'&lt;/span&gt; &lt;span class="n"&gt;order&lt;/span&gt; &lt;span class="n"&gt;by&lt;/span&gt; &lt;span class="n"&gt;sd&lt;/span&gt;&lt;span class="o"&gt;.&lt;/span&gt;&lt;span class="n"&gt;dateix&lt;/span&gt; &lt;span class="n"&gt;desc&lt;/span&gt; &lt;span class="n"&gt;limit&lt;/span&gt; &lt;span class="mi"&gt;100&lt;/span&gt;
&lt;/pre&gt;
&lt;pre class="literal-block"&gt;
100 rows affected.
&lt;/pre&gt;
&lt;p&gt;Because pandas is available we can use the &lt;tt class="docutils literal"&gt;DataFrame&lt;/tt&gt; method to
create a DataFrame from the resultset&lt;/p&gt;
&lt;pre class="code python literal-block"&gt;
&lt;span class="n"&gt;df&lt;/span&gt; &lt;span class="o"&gt;=&lt;/span&gt; &lt;span class="n"&gt;result&lt;/span&gt;&lt;span class="o"&gt;.&lt;/span&gt;&lt;span class="n"&gt;DataFrame&lt;/span&gt;&lt;span class="p"&gt;()&lt;/span&gt;
&lt;span class="n"&gt;df&lt;/span&gt;&lt;span class="o"&gt;.&lt;/span&gt;&lt;span class="n"&gt;info&lt;/span&gt;&lt;span class="p"&gt;()&lt;/span&gt;
&lt;/pre&gt;
&lt;pre class="literal-block"&gt;
&amp;lt;class 'pandas.core.frame.DataFrame'&amp;gt;
Int64Index: 100 entries, 0 to 99
Data columns (total 4 columns):
dateix         100 non-null object
ticker         100 non-null object
close_price    100 non-null float64
volume         100 non-null int64
dtypes: float64(1), int64(1), object(2)
&lt;/pre&gt;
&lt;p&gt;Convert the &lt;tt class="docutils literal"&gt;df&lt;/tt&gt; to a time series by setting the index to the
&lt;tt class="docutils literal"&gt;dateix&lt;/tt&gt;&lt;/p&gt;
&lt;pre class="code python literal-block"&gt;
&lt;span class="n"&gt;df&lt;/span&gt;&lt;span class="o"&gt;.&lt;/span&gt;&lt;span class="n"&gt;set_index&lt;/span&gt;&lt;span class="p"&gt;(&lt;/span&gt;&lt;span class="s"&gt;'dateix'&lt;/span&gt;&lt;span class="p"&gt;,&lt;/span&gt; &lt;span class="n"&gt;inplace&lt;/span&gt;&lt;span class="o"&gt;=&lt;/span&gt;&lt;span class="bp"&gt;True&lt;/span&gt;&lt;span class="p"&gt;)&lt;/span&gt;
&lt;/pre&gt;
&lt;p&gt;Statistical summary of the closing price and volume&lt;/p&gt;
&lt;pre class="code python literal-block"&gt;
&lt;span class="n"&gt;df&lt;/span&gt;&lt;span class="o"&gt;.&lt;/span&gt;&lt;span class="n"&gt;describe&lt;/span&gt;&lt;span class="p"&gt;()&lt;/span&gt;
&lt;/pre&gt;
&lt;div style="max-height:1000px;max-width:1500px;overflow:auto;"&gt;
&lt;table border="1" class="dataframe"&gt;
  &lt;thead&gt;
    &lt;tr style="text-align: right;"&gt;
      &lt;th&gt;&lt;/th&gt;
      &lt;th&gt;close_price&lt;/th&gt;
      &lt;th&gt;volume&lt;/th&gt;
    &lt;/tr&gt;
  &lt;/thead&gt;
  &lt;tbody&gt;
    &lt;tr&gt;
      &lt;th&gt;count&lt;/th&gt;
      &lt;td&gt; 100.000000&lt;/td&gt;
      &lt;td&gt;   100.000000&lt;/td&gt;
    &lt;/tr&gt;
    &lt;tr&gt;
      &lt;th&gt;mean&lt;/th&gt;
      &lt;td&gt;  14.806300&lt;/td&gt;
      &lt;td&gt; 11008.670000&lt;/td&gt;
    &lt;/tr&gt;
    &lt;tr&gt;
      &lt;th&gt;std&lt;/th&gt;
      &lt;td&gt;   0.902168&lt;/td&gt;
      &lt;td&gt; 16633.468579&lt;/td&gt;
    &lt;/tr&gt;
    &lt;tr&gt;
      &lt;th&gt;min&lt;/th&gt;
      &lt;td&gt;  13.500000&lt;/td&gt;
      &lt;td&gt;    21.000000&lt;/td&gt;
    &lt;/tr&gt;
    &lt;tr&gt;
      &lt;th&gt;25%&lt;/th&gt;
      &lt;td&gt;  14.000000&lt;/td&gt;
      &lt;td&gt;  1718.750000&lt;/td&gt;
    &lt;/tr&gt;
    &lt;tr&gt;
      &lt;th&gt;50%&lt;/th&gt;
      &lt;td&gt;  14.975000&lt;/td&gt;
      &lt;td&gt;  4447.000000&lt;/td&gt;
    &lt;/tr&gt;
    &lt;tr&gt;
      &lt;th&gt;75%&lt;/th&gt;
      &lt;td&gt;  15.600000&lt;/td&gt;
      &lt;td&gt; 12569.250000&lt;/td&gt;
    &lt;/tr&gt;
    &lt;tr&gt;
      &lt;th&gt;max&lt;/th&gt;
      &lt;td&gt;  16.450000&lt;/td&gt;
      &lt;td&gt; 82430.000000&lt;/td&gt;
    &lt;/tr&gt;
  &lt;/tbody&gt;
&lt;/table&gt;
&lt;p&gt;8 rows × 2 columns&lt;/p&gt;
&lt;/div&gt;&lt;p&gt;Use &lt;tt class="docutils literal"&gt;matplotlib&lt;/tt&gt; to plot the closing price&lt;/p&gt;
&lt;pre class="code python literal-block"&gt;
&lt;span class="n"&gt;df&lt;/span&gt;&lt;span class="p"&gt;[&lt;/span&gt;&lt;span class="s"&gt;'close_price'&lt;/span&gt;&lt;span class="p"&gt;]&lt;/span&gt;&lt;span class="o"&gt;.&lt;/span&gt;&lt;span class="n"&gt;plot&lt;/span&gt;&lt;span class="p"&gt;()&lt;/span&gt;
&lt;/pre&gt;
&lt;pre class="literal-block"&gt;
&amp;lt;matplotlib.axes.AxesSubplot at 0x11650bcd0&amp;gt;
&lt;/pre&gt;
&lt;div class="figure"&gt;
&lt;img alt="map to buried treasure" src="/theme/images/output_13_1.png" /&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
</summary><category term="Python"></category><category term="Development"></category><category term="OS X"></category><category term="Mavericks"></category><category term="homebrew"></category></entry><entry><title>Book Review: Getting Started with Zurb Foundation 4 by Andrew D. Patterson</title><link href="/book-review-getting-started-with-zurb-foundation.html" rel="alternate"></link><updated>2014-02-23T00:00:00-04:00</updated><author><name>Christopher Clarke</name></author><id>tag:,2014-02-23:book-review-getting-started-with-zurb-foundation.html</id><summary type="html">&lt;p&gt;I was really looking forward to reviewing this book as I'm a big fan of &lt;a class="reference external" href="http://foundation.zurb.com"&gt;Zurb
Foundation&lt;/a&gt; as I think that it is by far the &lt;a class="reference external" href="http://responsive.vermilion.com/compare.php?framework=current"&gt;best&lt;/a&gt; responsive framework out
there. Indeed, at work here at &lt;a class="reference external" href="http://chrisdev.com"&gt;ChrisDev&lt;/a&gt;,  we use Foundation for all our web
based projects.&lt;/p&gt;
&lt;p&gt;The book is supposed to aimed at web architects, designers, and builders who
were already familiar with the basics principles of responsive design and
is divided up into four chapters. I found that
&lt;cite&gt;Chapter 1: Getting The Most from the Grid System&lt;/cite&gt; was the most useful of the
lot. The author discussed in some detail his approach
to dealing with a number of practical layout issues including: nesting rows in
columns; understanding and customizing column gutters; maintaining row and page
width; mobile first design (or what the author calls designing from small to to
large); rearranging columns and so on.  While I found that this chapter hit
all the basics I felt more emphasis should have been placed on the implications
of mobile first design as this has always been Foundation's big selling
point over rivals such as &lt;a class="reference external" href="http://getbootstrap.com"&gt;Twitter BootStrap&lt;/a&gt;.  Also, it was strange
that there was no mention of some of the great resources provided by Zurb such
as the &lt;a class="reference external" href="http://foundation.zurb.com/templates4.html"&gt;Foundation 4 Templates&lt;/a&gt; which provide a number of canned layouts for
various kinds of sites (blogs, marketing product page etc.) that can be a great
starting point for customizing layout.&lt;/p&gt;
&lt;p&gt;I was a little disappointed in the next two chapters which covered the CSS and
JavaScript components provided with Foundation. These seemed a little cursory and
there was little that went beyond the &lt;a class="reference external" href="http://docs.foundation.com"&gt;online documentation&lt;/a&gt;.
Of course Foundation comes with more than twenty CSS components about twelve
JavaScript Plugins so it would have been unrealistic to expect a comprehensive
treatment of all these components, but maybe the author could have singled out
the more popular component such as Orbit for more comprehensive treatment.&lt;/p&gt;
&lt;p&gt;The final chapter covered &lt;a class="reference external" href="http://sass-lang.com"&gt;Sass&lt;/a&gt;. I felt that there was a lot of good material
here and readers unfamiliar with Sass would find it quite enlightening.
I particularly liked the sections entitled &lt;em&gt;Customizing with Variables&lt;/em&gt; and
&lt;em&gt;Understanding functions and mixins&lt;/em&gt;. However, I felt that more emphasis should
have been placed on this topic given that Sass has become the most efficient
way to customize and style layout, components and plugins.  I would have
preferred if Sass could have been introduced very early on (probably as Chapter
2) and the subsequent chapters covering CSS and JavaScript components each
contain a section on how to customize one or more of the components or plugins
with Sass.&lt;/p&gt;
&lt;p&gt;Overall, I would have to give this book a 3 out of 5 stars since it covers the
basics and provides a good supplement for the &lt;a class="reference external" href="http://docs.foundation.com"&gt;online documentation&lt;/a&gt;. However,
I feel that for more experienced designers, architects and builders the book
will prove to be a bit of a disappointment. Aside from &lt;cite&gt;Chapter 1&lt;/cite&gt;, it provides
little in the way of a practical approach or even  some guidelines for building
real world responsive sites with Foundation.  This is important in the context
of a rapidly evolving framework like Zurb Foundation, where we are we are
reviewing a book about &lt;cite&gt;version 4&lt;/cite&gt; while &lt;a class="reference external" href="http://foundation.zurb.com/docs/changelog.html"&gt;Foundation 5&lt;/a&gt; has been out since
November 21, 2013.&lt;/p&gt;
</summary><category term="Zurb Foundation"></category><category term="book review"></category><category term="foundation 4"></category><category term="responsive"></category><category term="CSS"></category><category term="Sass"></category></entry><entry><title>Welcome To My Blog</title><link href="/welcome.html" rel="alternate"></link><updated>2014-02-28T00:00:00-04:00</updated><author><name>Christopher Clarke</name></author><id>tag:,2013-05-01:welcome.html</id><summary type="html">&lt;p&gt;I've started experimenting with a static blog in the hope that this will
encourage me to post on a more frequently . I've decided to go with
&lt;a class="reference external" href="https://github.com/getpelican/pelican"&gt;pelican&lt;/a&gt; as it's written in python, set up and has good documentation and
I'm using &lt;tt class="docutils literal"&gt;github pages&lt;/tt&gt; for hosting.&lt;/p&gt;
&lt;div class="section" id="getting-started"&gt;
&lt;h2&gt;Getting Started&lt;/h2&gt;
&lt;p&gt;First, I created a virtualenv for
the project and installed the main requirements.&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;mkvirtualenv chrisdev-blog
pip install pelican
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;I then used &lt;tt class="docutils literal"&gt;&lt;span class="pre"&gt;pelican-quickstart&lt;/span&gt;&lt;/tt&gt; to create the skeleton of my project&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;pelican-quickstart
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;Since I was going to host on Github I felt that I did not need the
generated Makefile, and all the other helper scripts.
Instead, I created a settings file that initially
looked like this:&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;&lt;span class="n"&gt;AUTHOR&lt;/span&gt; &lt;span class="o"&gt;=&lt;/span&gt; &lt;span class="s"&gt;&amp;#39;Christopher Clarke&amp;#39;&lt;/span&gt;
&lt;span class="n"&gt;DEFAULT_DATE_FORMAT&lt;/span&gt; &lt;span class="o"&gt;=&lt;/span&gt; &lt;span class="s"&gt;&amp;#39;%A, %B &lt;/span&gt;&lt;span class="si"&gt;%d&lt;/span&gt;&lt;span class="s"&gt;, %Y&amp;#39;&lt;/span&gt;
&lt;span class="n"&gt;DISQUS_SITENAME&lt;/span&gt; &lt;span class="o"&gt;=&lt;/span&gt; &lt;span class="s"&gt;&amp;#39;chrisdev&amp;#39;&lt;/span&gt;
&lt;span class="n"&gt;GITHUB_URL&lt;/span&gt; &lt;span class="o"&gt;=&lt;/span&gt; &lt;span class="s"&gt;&amp;#39;https://github.com/chrisdev/chrisdev-blog&amp;#39;&lt;/span&gt;
&lt;span class="n"&gt;GOOGLE_ANALYTICS&lt;/span&gt;&lt;span class="o"&gt;=&lt;/span&gt;&lt;span class="s"&gt;&amp;#39;&amp;#39;&lt;/span&gt;
&lt;span class="n"&gt;SITEURL&lt;/span&gt; &lt;span class="o"&gt;=&lt;/span&gt; &lt;span class="s"&gt;&amp;#39;http://blog.chrisdev.com&amp;#39;&lt;/span&gt;
&lt;span class="n"&gt;FEED_DOMAIN&lt;/span&gt; &lt;span class="o"&gt;=&lt;/span&gt; &lt;span class="n"&gt;SITEURL&lt;/span&gt;
&lt;span class="n"&gt;SITENAME&lt;/span&gt; &lt;span class="o"&gt;=&lt;/span&gt; &lt;span class="s"&gt;&amp;#39;TheChrisDev Blog&amp;#39;&lt;/span&gt;
&lt;span class="n"&gt;SOCIAL&lt;/span&gt; &lt;span class="o"&gt;=&lt;/span&gt; &lt;span class="p"&gt;((&lt;/span&gt;&lt;span class="s"&gt;&amp;#39;twitter&amp;#39;&lt;/span&gt;&lt;span class="p"&gt;,&lt;/span&gt; &lt;span class="s"&gt;&amp;#39;http://twitter.com/realchrisdev&amp;#39;&lt;/span&gt;&lt;span class="p"&gt;),&lt;/span&gt;
          &lt;span class="p"&gt;(&lt;/span&gt;&lt;span class="s"&gt;&amp;#39;github&amp;#39;&lt;/span&gt;&lt;span class="p"&gt;,&lt;/span&gt; &lt;span class="s"&gt;&amp;#39;https://github.com/chrisdev&amp;#39;&lt;/span&gt;&lt;span class="p"&gt;),&lt;/span&gt;
          &lt;span class="p"&gt;(&lt;/span&gt;&lt;span class="s"&gt;&amp;#39;facebook&amp;#39;&lt;/span&gt;&lt;span class="p"&gt;,&lt;/span&gt; &lt;span class="s"&gt;&amp;#39;http://www.facebook.com/chrisdevtt&amp;#39;&lt;/span&gt;&lt;span class="p"&gt;),)&lt;/span&gt;
&lt;span class="n"&gt;TAG_FEED_ATOM&lt;/span&gt; &lt;span class="o"&gt;=&lt;/span&gt; &lt;span class="s"&gt;&amp;#39;feeds/&lt;/span&gt;&lt;span class="si"&gt;%s&lt;/span&gt;&lt;span class="s"&gt;.atom.xml&amp;#39;&lt;/span&gt;
&lt;span class="n"&gt;TIMEZONE&lt;/span&gt; &lt;span class="o"&gt;=&lt;/span&gt; &lt;span class="s"&gt;&amp;quot;America/Port_of_Spain&amp;quot;&lt;/span&gt;
&lt;span class="n"&gt;TWITTER_USERNAME&lt;/span&gt; &lt;span class="o"&gt;=&lt;/span&gt; &lt;span class="s"&gt;&amp;#39;realchrisdev&amp;#39;&lt;/span&gt;
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;To generate the site I created a test &lt;tt class="docutils literal"&gt;rst&lt;/tt&gt; file in the content directory
and ran the following:&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;pelican content -s settings.py -o .
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;To view the generated site just open the index file in your browser or if you are
on a Mac&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;open index.html
&lt;/pre&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;div class="section" id="theming-the-blog"&gt;
&lt;h2&gt;Theming The Blog&lt;/h2&gt;
&lt;p&gt;By default &lt;a class="reference external" href="https://github.com/getpelican/pelican"&gt;pelican&lt;/a&gt;  will theme your site using &lt;tt class="docutils literal"&gt;notmyidea&lt;/tt&gt;.
But I wanted to use a theme based on &lt;a class="reference external" href="http://foundation.zurb.com"&gt;Zurb Foundation 4&lt;/a&gt;.
Fortunately,  the official &lt;a class="reference external" href="https://github.com/getpelican/pelican-themes"&gt;pelican-themes&lt;/a&gt; repository already contained
a &lt;tt class="docutils literal"&gt;Foundation 4&lt;/tt&gt; theme called &lt;tt class="docutils literal"&gt;tuxlite_zf&lt;/tt&gt;.
This is a minimalist theme with a main column and a right sidebar.
That I felt would provide a good starting point for a custom theme.
To install the
&lt;tt class="docutils literal"&gt;&lt;span class="pre"&gt;pelican-themes&lt;/span&gt;&lt;/tt&gt; we simply cloned the repository to our local machine.&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;git clone https://github.com/getpelican/pelican-themes ~/Development/pelican-themes
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;We then copied the &lt;tt class="docutils literal"&gt;tuxlite_zf&lt;/tt&gt; theme folder to a new folder  &lt;tt class="docutils literal"&gt;chrisdev_zf&lt;/tt&gt;
so that we could customize it. Next,  we edited  &lt;tt class="docutils literal"&gt;settings.py&lt;/tt&gt;
file to include this line:&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;&lt;span class="n"&gt;THEME&lt;/span&gt; &lt;span class="o"&gt;=&lt;/span&gt; &lt;span class="s"&gt;&amp;quot;../pelican-themes/chrisdev_zf&amp;quot;&lt;/span&gt;
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;Finall, we regenerated the site as before to confirm that &lt;tt class="docutils literal"&gt;tuxlite_zf&lt;/tt&gt; was
indeed generating a &lt;tt class="docutils literal"&gt;Foundation 4&lt;/tt&gt; site.&lt;/p&gt;
&lt;/div&gt;
&lt;div class="section" id="customization-with-sass-and-compass"&gt;
&lt;h2&gt;Customization with SASS and Compass&lt;/h2&gt;
&lt;p&gt;The best way to customize a &lt;tt class="docutils literal"&gt;Foundation 4&lt;/tt&gt; site is to use
&lt;a class="reference external" href="http://sass-lang.com/"&gt;Sass&lt;/a&gt; and &lt;a class="reference external" href="http://compass-style.org"&gt;Compass&lt;/a&gt;&lt;/p&gt;
&lt;p&gt;This normally means that &lt;tt class="docutils literal"&gt;ruby&lt;/tt&gt; needs to be installed on your system.
If you are on a Mac then you are in luck since a fairly recent version of
&lt;tt class="docutils literal"&gt;ruby&lt;/tt&gt; ships with &lt;tt class="docutils literal"&gt;Mountain Lion&lt;/tt&gt;.
Update your &lt;tt class="docutils literal"&gt;ruby&lt;/tt&gt; installation and install &lt;tt class="docutils literal"&gt;Foundation 4&lt;/tt&gt; and all the
necessary dependencies i.e. &lt;a class="reference external" href="http://sass-lang.com/"&gt;Sass&lt;/a&gt; and &lt;a class="reference external" href="http://compass-style.org"&gt;Compass&lt;/a&gt; .&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;sudo gem update --system
sudo gem install compass
sudo gem install zurb-foundation
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;Next create a project for
your custom theme.&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;compass create custom-foundation4 -r zurb-foundation --using foundation
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;You can view &lt;tt class="docutils literal"&gt;index.html&lt;/tt&gt; in your browser confirm that your project is
a standard &lt;tt class="docutils literal"&gt;Foundation 4&lt;/tt&gt; site. Next, you will want to start
by making changes to the &lt;tt class="docutils literal"&gt;Scsss&lt;/tt&gt; files and  use
with &lt;tt class="docutils literal"&gt;compass&lt;/tt&gt; to generate &lt;tt class="docutils literal"&gt;css&lt;/tt&gt; output.&lt;/p&gt;
&lt;p&gt;The Foundation folks have made this easy for us as you can
modify almost any Foundation &lt;tt class="docutils literal"&gt;CSS&lt;/tt&gt; component by editing &lt;tt class="docutils literal"&gt;_settings.scss&lt;/tt&gt;
file which is located in the &lt;tt class="docutils literal"&gt;sass&lt;/tt&gt;
folder of the &lt;tt class="docutils literal"&gt;&lt;span class="pre"&gt;custom-foundation&lt;/span&gt;&lt;/tt&gt; project.
For example, to change the colors of the &lt;tt class="docutils literal"&gt;&lt;span class="pre"&gt;Top-nav&lt;/span&gt;&lt;/tt&gt; we made the following
changes to &lt;tt class="docutils literal"&gt;_settings.scss&lt;/tt&gt;&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;&lt;span class="vg"&gt;$topbar&lt;/span&gt;&lt;span class="o"&gt;-&lt;/span&gt;&lt;span class="n"&gt;dropdown&lt;/span&gt;&lt;span class="o"&gt;-&lt;/span&gt;&lt;span class="ss"&gt;bg&lt;/span&gt;&lt;span class="p"&gt;:&lt;/span&gt; &lt;span class="c1"&gt;#3498db;&lt;/span&gt;
&lt;span class="vg"&gt;$topbar&lt;/span&gt;&lt;span class="o"&gt;-&lt;/span&gt;&lt;span class="n"&gt;dropdown&lt;/span&gt;&lt;span class="o"&gt;-&lt;/span&gt;&lt;span class="n"&gt;toggle&lt;/span&gt;&lt;span class="o"&gt;-&lt;/span&gt;&lt;span class="ss"&gt;alpha&lt;/span&gt;&lt;span class="p"&gt;:&lt;/span&gt; &lt;span class="mi"&gt;0&lt;/span&gt;&lt;span class="o"&gt;.&lt;/span&gt;&lt;span class="mi"&gt;1&lt;/span&gt;&lt;span class="p"&gt;;&lt;/span&gt;
&lt;span class="vg"&gt;$dropdown&lt;/span&gt;&lt;span class="o"&gt;-&lt;/span&gt;&lt;span class="n"&gt;label&lt;/span&gt;&lt;span class="o"&gt;-&lt;/span&gt;&lt;span class="ss"&gt;color&lt;/span&gt;&lt;span class="p"&gt;:&lt;/span&gt; &lt;span class="c1"&gt;#fff;&lt;/span&gt;
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;Next run&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;compass compile
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;You can also set &lt;tt class="docutils literal"&gt;compass&lt;/tt&gt; in watch mode so that it
will watch for saves and compile each time you save an Scss file.
Additionally, you can also configure compass to generate compressed code
by editing the 'config.rb'
and uncommenting&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;&lt;span class="nv"&gt;output_style&lt;/span&gt; &lt;span class="o"&gt;=&lt;/span&gt;  :compressed &lt;span class="c"&gt;# or :compressed expanded or :nested or&lt;/span&gt;
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;Once you are satisfied, you can copy &lt;tt class="docutils literal"&gt;app.css&lt;/tt&gt; as &lt;tt class="docutils literal"&gt;foundation.css&lt;/tt&gt; to your
custom pelican-theme's static directory.&lt;/p&gt;
&lt;p&gt;Once you have gained more experience with compass/sass you will want to
target particular CSS components to modify them instead of
regenerating the entire
&lt;tt class="docutils literal"&gt;foundation.css&lt;/tt&gt; every time you make a few changes to components.
To achieve this we
simply created a new &lt;tt class="docutils literal"&gt;scss&lt;/tt&gt; called &lt;tt class="docutils literal"&gt;style.scss&lt;/tt&gt; and imported just those
components that we wished to modify.
So as in the example above where we just wanted to change the
&lt;tt class="docutils literal"&gt;&lt;span class="pre"&gt;top-nav&lt;/span&gt;&lt;/tt&gt; colors we just add the following lines to  &lt;tt class="docutils literal"&gt;style.sccs&lt;/tt&gt;&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;&lt;span class="vg"&gt;$topbar&lt;/span&gt;&lt;span class="o"&gt;-&lt;/span&gt;&lt;span class="n"&gt;dropdown&lt;/span&gt;&lt;span class="o"&gt;-&lt;/span&gt;&lt;span class="ss"&gt;bg&lt;/span&gt;&lt;span class="p"&gt;:&lt;/span&gt; &lt;span class="c1"&gt;#3498db;&lt;/span&gt;
&lt;span class="vg"&gt;$topbar&lt;/span&gt;&lt;span class="o"&gt;-&lt;/span&gt;&lt;span class="n"&gt;dropdown&lt;/span&gt;&lt;span class="o"&gt;-&lt;/span&gt;&lt;span class="n"&gt;toggle&lt;/span&gt;&lt;span class="o"&gt;-&lt;/span&gt;&lt;span class="ss"&gt;alpha&lt;/span&gt;&lt;span class="p"&gt;:&lt;/span&gt; &lt;span class="mi"&gt;0&lt;/span&gt;&lt;span class="o"&gt;.&lt;/span&gt;&lt;span class="mi"&gt;1&lt;/span&gt;&lt;span class="p"&gt;;&lt;/span&gt;
&lt;span class="vg"&gt;$dropdown&lt;/span&gt;&lt;span class="o"&gt;-&lt;/span&gt;&lt;span class="n"&gt;label&lt;/span&gt;&lt;span class="o"&gt;-&lt;/span&gt;&lt;span class="ss"&gt;color&lt;/span&gt;&lt;span class="p"&gt;:&lt;/span&gt; &lt;span class="c1"&gt;#fff;&lt;/span&gt;

&lt;span class="vi"&gt;@import&lt;/span&gt; &lt;span class="s2"&gt;&amp;quot;foundation/components/grid&amp;quot;&lt;/span&gt;&lt;span class="p"&gt;;&lt;/span&gt;
&lt;span class="vi"&gt;@import&lt;/span&gt; &lt;span class="s2"&gt;&amp;quot;foundation/components/top-bar&amp;quot;&lt;/span&gt;&lt;span class="p"&gt;;&lt;/span&gt;
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;Note, you need to define the new colors etc. &lt;strong&gt;before&lt;/strong&gt; you
import the foundation components.&lt;/p&gt;
&lt;p&gt;As before, compile the  &lt;tt class="docutils literal"&gt;style.css&lt;/tt&gt; and copy this
to the static directory of your pelican theme.&lt;/p&gt;
&lt;/div&gt;
&lt;div class="section" id="deployment-on-github"&gt;
&lt;h2&gt;Deployment On Github&lt;/h2&gt;
&lt;p&gt;I started by creating a repository on my &lt;a class="reference external" href="http://github.com"&gt;github&lt;/a&gt;
called &lt;tt class="docutils literal"&gt;chrisdev.github.com&lt;/tt&gt;.
The use of my &lt;tt class="docutils literal"&gt;github&lt;/tt&gt; account name as the first part of the
repository name was necessary to indicate that this was a special repository
for serving &lt;tt class="docutils literal"&gt;User&lt;/tt&gt; or &lt;tt class="docutils literal"&gt;Organization&lt;/tt&gt; html pages from the master branch of a
repository. The site would be viewable at &lt;a class="reference external" href="http://chrisdev.github.io"&gt;http://chrisdev.github.io&lt;/a&gt;.&lt;/p&gt;
&lt;p&gt;Next in the the directory where I created the pelican blog I ran the followig&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;git init
git add .
git commit -m &lt;span class="s2"&gt;&amp;quot;initial commit&amp;quot;&lt;/span&gt;
git remote add origin git@github.com:chrisdev/chrisdev.github.com.git
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;To update the site I just have to push to the origin&lt;/p&gt;
&lt;div class="highlight"&gt;&lt;pre&gt;git push -u origin master
&lt;/pre&gt;&lt;/div&gt;
&lt;p&gt;I also set up a custom domain for the blog at &lt;a class="reference external" href="http://blog.chrisdev.com"&gt;http://blog.chrisdev.com&lt;/a&gt;
by simply setting up a &lt;tt class="docutils literal"&gt;CNAME&lt;/tt&gt; record in my DNS
to set  &lt;tt class="docutils literal"&gt;blog.chrisdev.com&lt;/tt&gt; as an alias for &lt;tt class="docutils literal"&gt;chrisdev.github.com&lt;/tt&gt;.
I also had to add a file to the &lt;tt class="docutils literal"&gt;github&lt;/tt&gt; repository  called
&lt;tt class="docutils literal"&gt;CNAME&lt;/tt&gt; which contained
a sigle line with the alias i.e  &lt;tt class="docutils literal"&gt;blog.chrisdev.com&lt;/tt&gt;.&lt;/p&gt;
&lt;/div&gt;
</summary><category term="static-site"></category><category term="pelican"></category><category term="foundation4"></category><category term="compass"></category><category term="sass"></category></entry></feed>