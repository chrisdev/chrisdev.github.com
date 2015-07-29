=========================================================================
No hassle Corporate Web Application Proxy with Hyper-V, Ubuntu and Nginx
=========================================================================
:date: 2015-07-21
:tags: nginx, Hyper-V, ubuntu, reverse-proxy, ssl
:category: devops
:author: Christopher Clarke
:status: draft
:summary: A step by step guide on how to setup a secure reverse proxy for you
    company to provide access to multiple internal applications using MS
    Hyper-V, Ubuntu 14.04 and Nginx


A few weeks ago I was asked by a long standing client if we could set up a *Web
Application Proxy* to provide a group of external customers with access to
a ``JBoss`` application running on the corporate LAN.  A quick Google search
revealed that a `Web Application Proxy
</https://technet.microsoft.com/en-us/library/dn584113.aspx>`_ was 

   a service that provides reverse proxy functionality for web 
   applications inside your corporate network to allow users to access them 
   for out side the network [#f1]_.
    
Of course Microsoft's version of a reverse proxy server probably
integrates really tightly with other MS products but for a number of reasons
the client did not want to use a proprietary approach.  Instead, they wanted a "open"
solution similar to one that I had built for them some years ago to provide
external access to a couple of ``Django`` applications running on the corporate
LAN. In that implementation, we had used an Apache web server running
``mod_proxy`` and ``mod_rewrite`` and a simple port-forwarding rule on the
corporate firewall to build the reverse proxy.  

However, the requirements for the new setup were a bit more ambitious, They
wanted us to  provide: 

    - external access to the ``JBoss`` application 
    - external access to one or more ``Django`` applications 
    - SSL encryption for all the exposed web applications
    - Encrypted access to ``Outlook Web Access [OWA]`` and ``Active Sync`` which previously used HTTP
    - A static portal site to act a directory to the various services 
    - Standardize the Client (40x.html) and Server (50x.html) error 
      pages across all applications

The make things more interesting the client only had a single external IP
address and time constraints meant that we could only use a single URL
name space i.e.  ``external.enterprise.co.tt``. 

In this article we will detail how we set up a corporate reverse proxy with strong
SSL security using a ``Ubuntu`` virtual machine running on ``Hyper-V`` and
an ``nginx`` web server to provide secure external access to a number of internal
web applications. The article is targeted at system administrators and others who
work primarily with Microsoft tools but are interested in exploring how they can
leverage Linux and other open source tools like ``nginx`` to make their jobs easier.
If you want to set up your own reverse proxy implementation it would
probably help to familiarize your self with the Linux command line and some of
the basic shell commands. Zed Shaw's `The Command
Line Crash Course <http://cli.learncodethehardway.org/book/>`_ is and excellent
way to get started learning the ``shell``. You will also need to use one
of the Linux text editors (Vi, EMACS, Nano). If you are new to Linux you should
probably stick with Nano which is the default text editor on Ubuntu
distributions.

In the next section we start by recapping some some of the benefits for having
a corporate reverse proxy.


What is a Reverse Proxy?
========================
A reverse proxy sits between the internet and the *upstream*
application servers accepting requests, inspecting and transforming them and
then forwarding them to one or many application servers. 

 .. figure:: {filename}images/reverse_proxy_server.png
   :alt: Web Applicaton or Reverse Proxy

Having a point at which you can inspect, transform and route HTTP requests
before they reach your web servers provides a whole host of benefits. These
include:

SSL Termination
----------------

You just need a single Certificate Authority (CA) signed SSL certificate 
to secure all the applications that you want to access externally. This
certificate needs to be installed only on the reverse proxy.  In most cases you
can use use HTTP on the upstream web application servers (remember most of
these are built to run on the relatively secure corporate LAN).  In some 
cases, for instance ``Jboss`` upstream application servers, to run under HTTPS, 
to serve HTTPS traffic but but since
the ``Jboss`` application is never directly exposed outside the enterprise a self-signed
certificate should suffice.  The reverse proxy thus provides a single point of
configuration and management for SSL/TLS. It takes the processing load of
encrypting/decrypting HTTPS traffic away from the internal web application
servers and makes testing and intercepting HTTP requests to individual web
servers easier.


Aggregating Multiple web applications Into the Same URL Space
--------------------------------------------------------------

The reverse proxy can route different branches of a single URL address space to
different internal web servers. So for the URL space implied in our
requirements above we can route these from the single external domain using the
reverse proxy. So for the JBoss application we have
``https://external.enterprise.co.tt/jboss``, and for OWA we have
``https://external.enterprise.co.tt/owa`` and for the Django we have
``https://external.enterprise.co.tt/django``. Multiple application all mapped
into one URI name space.

Security
---------
A reverse proxy can hide the topology and characteristics of the back-end
servers by removing the need for direct internet access to them. You can place
your reverse proxy in your DMZ, but hide your web servers inside
a non-public subnet.

Load Balancing and Compression
-------------------------------

General purpose reverse proxy applications like Nginx also provide load
balancing functionality. You can run multiple instances of a particular
*upstream* application server and the proxy routes incoming requests to
a particular instance of the upstream application using mechanisms such
a round-robin, least-connected or ip-hash or something more sophisticated.  

In order to reduce the bandwidth needed for individual requests, the reverse
proxy can decompress incoming requests and compress outgoing ones. This reduces
the load on the back-end servers that would otherwise have to do the
compression, and makes debugging requests to, and responses from, the back-end
servers easier.



Authentication and Logging
---------------------------

The reverse proxy  provide a single point of authentication for all HTTP
requests.  Because all HTTP requests are routed through the reverse proxy, it
makes an excellent point for logging and auditing. 

The next section we start our journey by creating a Linux virtual machine to
host the reverse proxy.


Step 1: Create an Ubuntu Virtual Machine on Hyper-V 
=====================================================
In my opinion ``Hyper-V`` is the best thing to come out of Microsoft since ``Excel
4.O``.  Setting up a Ubuntu Box on on Hyper-V is quite straight forward. I'm
assuming that Windows 8.1 or Windows Server 2012 R2 has already
installed. We will use Ubuntu 14.04 LTS as this is the first Linux release to
support running inside of a Generation 2 virtual machine. Generation 2 virtual machines 
come with all the cool features like dynamic memory, online backup and
so on already enabled and ready to go. The term LTS stands for
Long Term Support which means that security patches and kernel updates etc. are
available until 2019.

We will use the Server edition of 14.04 and which you can download form `here
<http://www.ubuntu.com/download/server>`_.  Ensure that you get the 64-bit
versions.  You can use the Desktop edition but be aware that this comes with
with a lot of extra packages and dependencies that may be out do place in the
context of a secure reverse proxy.

Next create a new Generation 2 virtual machine and configure it any thing above
2GB of RAM is great and you do not need a lot of HD space any thing above 10 GB
should be sufficient.  Before you start the installation you will need to go
into the virtual machine settings, change to the Firmware settings page and
uncheck Enable Secure Boot.   


.. figure:: {filename}images/hyper-v-settings.png
  :alt: Configure Hyper-V Virtual Machine 

You can then boot from the downloaded Ubuntu ISO image and select it to start
the installation.  The installation process is quite simple, and there are no
tricks / special options to get it running well under Hyper-V.  


.. figure:: {filename}images/hyper-v-install-ubuntu.png
  :alt: Install Ubuntu 14.04 

Soon you will be done - and you will have an Ubuntu Generation 2 virtual
machine, :


.. figure:: {filename}images/hyper-v-install-ubuntu.png
  :alt: Ubuntu 14.04 Server Edition running in Hyper-V


Next ssh into the Ubuntu VM as root and install the following packages.

.. code-block:: sh

   sudo apt-get update
   sudo apt-get install openssl nginx

We're not going to install our usual security packages such as `Fail2ban <http://www.fail2ban.org>`_
and `UFW <https://help.ubuntu.com/community/UFW>`_  since the corporate
`CheckPoint <http://checkpoint.com>`_ firewall will be used to secure the reverse proxy. 

Step 2: Acquire and Install the SSL Certificate 
=================================================
In this section we show you how to acquire and install an
SSL certificate from a trusted, commercial Certificate Authority (CA).  

Generate the Private Key and Certificate Signing Request 
---------------------------------------------------------
We start by creating a secure location to store the certificates login to 
new VM and 

.. code-block:: sh

   mkdir -p /svr/ssl
   chmod 700 /svr/ssl

Next ``cd`` to the ssl directory and use ``openssl``  to generate your private key
and CSR on your web server. 

.. code-block:: sh

    openssl req -newkey rsa:2048 -nodes -keyout external.enterprise.co.tt.key -out external.enterprise.co.tt.csr

You will then be prompted to answer a number of questions
The most important of which is the Common Name field which should match the name
of the DNS host that you want to use the certificate on for i.e.
``external.enterprise.com``. 
If you are planning on getting an EV certificate, is important to fill the  other
fields accurately in keeping your organization or business details.

.. code-block:: sh

    Country Name (2 letter code) [AU]: TT
    State or Province Name (full name) [Some-State]: Trinidad
    Locality Name (eg, city) []:Port of Spain
    Organization Name (eg, company) [Internet Widgits Pty Ltd]: The Enterprise
    Organizational Unit Name (eg, section) []: IT
    Common Name (e.g. server FQDN or YOUR name) []:external.enterprise.com
    Email Address []: webmaster@enterprise.com

This will generate a ``.key`` and ``.csr`` file. The ``.key`` file is your private key,
you should keep a backup to this file in a secure location. 

The ``.csr`` file is what you will send to the CA to request your SSL certificate.

You will need to copy and paste your CSR when submitting your certificate signing request to your CA.
To view the contents of your CSR as follows 

.. code-block:: sh
    
    cd /svr/ssl
    cat external.enterprise.co.tt.csr

You can check that you filled out the questions correctly by running the
following command

.. code-block:: sh
     
     openssl -in external.enterprise.co.tt.csr -noout -text

Submit the CSR to the Commercial Certificate Authority
-------------------------------------------------------

You are now ready to submit you CSR to the commercial Certificate Authority. We
choose to go with a Domain Validated (DV) certificate from Comodo largely due
to time pressures. A DV certificates is issued once the CA validates that the
requester owns or controls the domain in question. The process will usually
involve the CA sending an email to the controller of the domain as well as some
additional validation step. In contrast an Organization Validation (OV)
certificates can be issued only after the CA validates the legal identity of
the requester.  Extended Validation (EV) certificates can be issued only after the
issuing CA validates the legal identity, among other things, of the requester,
according to a strict set of guidelines. An EV certificate is supposed to
provide additional assurance of the legitimacy of your organization's identity
to your site's visitors. 

However, it should be noted that all flavors of the certificate provide the
same degree on encryption. Additionally, we have encountered many cases in the
wild where EV certificates have been configured in such a manner that 
leave the users of these services venerable to a whole range of exploits. The
lesson being that acquiring an expensive EV certificate is not sufficient to
protect your customers from these exploits and venerabilities  if
they are running older unpatched version of some browsers.

We actually get our certificated via `Namecheap <https://namecheap.com>`_ 
which provides a convenient way buy SSL certificates from a variety of CAs. We
will walk through the process of acquiring a single domain certificate from
PositiveSSL, but you can deviate if you want a different type of certificate.

Select and Purchase the Certificate
```````````````````````````````````
Go to `Namecheap's SSL certificate page
<https://www.namecheap.com/security/ssl-certificates.aspx>`_. Select the Domain
Validation  Compare Products button in the "Domain Validation" box. Find 
will find "PositiveSSL", and click the ``Add to Cart`` button.

.. figure:: {filename}images/namecheap_add_to_cart.jpg
   :alt: Purchase PositiveSSL certificate from name cheap 


At this point, you must register or log in to Namecheap to complete the
payment process.  

To submit the CSR click on Manage SSL Certificates link, under the "Hi Username" section.

.. figure:: {filename}images/namecheap_manage_ssl.jpg
   :alt: Namecheap Manage SSL certifcate 

Here, you will see a list of all of the SSL certificates that you have
purchased through Namecheap. 

 .. figure:: {filename}images/namecheap_activate.jpg
   :alt: Namecheap Manage SSL certifcate 

Click on the Activate Now link to submit the CSR.   Choose ``nginx`` from the
``Select web server`` drop down and pate in the CSR into the ``Enter csr`` box

 .. figure:: {filename}images/namecheap_submitt_csr.jpg
   :alt: Namecheap submitt CSR 

then click the ``Next``.  The CSR that you submitted will be parsed and
validated and the output presented to you.  You should take this opportunity to
look over the certificate information to ensure that everything is OK.
Finally, select an approver email from the either the list of administrator
type emails addresses or the email address in the domain's WHOIS administrative
contact.  Once you have completed this step the email address that you selected
will receive an email from Comodo. This email will contain a validation token
and a link to Comodo's domain control validation form.
Click on the link in the email, enter the token in the form and  press enter 
to verify that you have control of the domain.  

Once the certificate has been approved an email will be sent to the 
Technical Contact listed in the Namecheap account.  Attached to the email will
be a ``zip`` file with the certificate issued for your domain as well as 
the Comodo's root and intermediate certificates. 

    - Root CA Certificate - AddTrustExternalCARoot.crt
    - Intermediate CA Certificate - COMODORSAAddTrustCA.crt
    - Intermediate CA Certificate - COMODORSADomainValidationSecureServerCA.crt
    - Your PositiveSSL Certificate - external.enterprise.co.tt.crt 


Copy these files to the Ubuntu reverse proxy box using the same location
where you generated your private key and CSR i.e. ``/srv/ssl``.

Create a Certificate bundle
````````````````````````````
In order to use the newly issued certificate with nginx you first must combine all
the files sent by Comodo into a single file or bundle. 
This is required since the certificate issued for the domain constitutes
just one part of the certificate chain. It must be combined with the Comodo's  root and
Intermediate certificates to improve compatibility and ensure that browsers and other
clients recognize the certificate In 
Unix like systems as we can simply use the ``cat`` command.

.. code-block:: sh
    
    cd /svr/ssl
    cat external.enterprise.co.tt.crt ComodoRSADomainValidationSecureServerCA.crt COMODORSAAddTrustCA.crt AddTrustExternalRoot.crt >> bundle.external.enterprise.co.tt.crt

Note the order in which the files are concatenated is important.

Install the certificate
````````````````````````

To install the certificate bundle you need to edit your Nginx virtual host files. If
you are new to Linux you may want to use the ``nano`` editor instead of 
the classics like ``vi`` or ``emacs``.

The nginx configuration files are located in ``/etc/nginx`` directory. The sub
directories of interest are:
- ``sites-available`` - the configuration file of each virtual host is defined here.
- ``sites-enabled`` which contains a reference to the virtual hosts that are currently active.

To enable or activate a virtual host you simply create a symbolic link (soft link) in the
``sites-enabled`` folder that references the virtual host in sites-enabled. 

.. code-block:: sh
   
   cd /etc/nginx/site-enabled
   ln -s ../sites-enabled/default default

As we are setting up a reverse proxy we are only going to have one virtual host
running. Indeed, we are just going to modify the ``default`` virtual host
that is  when you install the Ubuntu nginx package. 

.. code-block:: sh
    
   cd /etc/nginx/sites-available
   nano default
   

First remove everything in  ``default`` except the section headed ``# HTTPS
Server``. Next uncomment the configuration by removing the ``#`` character form
the lines. Your initial configuration should look like this:

.. code-block:: nginx
    :linenos: inline

    server {
        listen 443;
        server_name localhost;

        root html;
        index index.html index.htm;

        ssl on;
        ssl_certificate cert.pem;
        ssl_certificate_key cert.key;

        ssl_session_timeout 5m;

        ssl_protocols SSLv3 TLSv1 TLSv1.1 TLSv1.2;
        ssl_ciphers "HIGH:!aNULL:!MD5 or HIGH:!aNULL:!MD5:!3DES";
        ssl_prefer_server_ciphers on;

        location / {
                try_files $uri $uri/ =404;
        }
    }


The ``VirtualHost`` has already to listen on port 443 and ``ssl`` has been
turned on on line 6 ``ssl on``. Make the following changes to ``default``

Change the server name to ``external.enterprise.co.tt``

.. code-block:: nginx
    
    server_name external.enterprise.co.tt;

Indicate the location of the bundled ssl certificate you created in step
2 above

.. code-block:: nginx
    
    ssl_certificate    /svr/ssl/bundle.external.enterprise.co.tt.crt;

Point ``nginx`` to the file containing the SSL Private key


.. code-block:: nginx

    ssl_certificate_key    /svr/ssl/external.enterprise.co.tt.key;

Set the root directory for requests. 

.. code-block:: nginx

    root /usr/share/nginx/html/portal;

Completed ``VirtualHost`` record should look like this:

.. code-block:: nginx
    :linenos: inline
    :hl_lines: 3 9 10 5 6

    server {
        listen 443 default_server;
        server_name external.enterprise.co.tt;

        root /usr/share/nginx/html/portal;
        index index.html;

        ssl on;
        ssl_certificate  /svr/ssl/bundle.external.enterprise.co.tt.crt;
        ssl_certificate_key /svr/ssl/external.enterprise.co.tt.key

        ssl_session_timeout 5m;

        ssl_protocols SSLv3 TLSv1 TLSv1.1 TLSv1.2;
        ssl_ciphers "HIGH:!aNULL:!MD5 or HIGH:!aNULL:!MD5:!3DES";
        ssl_prefer_server_ciphers on;

        location / {
                try_files $uri $uri/ =404;
        }
    }

Before you can load the new configuration you need to create the ``protal``
directory and a placeholder index page.

.. code-block:: sh
    
    cd /usr/share/nginx/html
    mkdir protal
    cd portal
    nano index.html

Add some placeholder text for example "Welcome to the Reverse Proxy".

Once you are done with this you need to test your configuration by running

.. code-block:: sh
    
    service nginx configtest 

Finally, restart the ``nginx`` to reload the new default configuration

.. code-block:: sh
    
    service nginx restart 

Test the Certificate
`````````````````````
Start by using you browser to navigate to ``https://external.enterprise.co.tt``
You should observe the familiar lock icon associated with an SSL protected
site. There should be no warnings for current browsers.
Click on the lock icon to seethe details of the SSL certificate have be entered
correctly.

.. figure:: {filename}images/certificate.jpg
   :alt: SSL Certificate details 

While you SSL certificate has been installed correctly the level of protection
that it provides is quite weak. Qualys, Inc. a leading provider of cloud
security and compliance provides service that provides a free online analysis
of the configuration of SSL servers at `SSL Labs
<https://ww.ssllabs.com/ssltest>`_.  Navigate to the SSL Server Test page and
enter the URL of your reverse proxy and click ``submit``. Your current
configuration will only a give you a "C" grade.  We'll show you how to get an
"A".

.. figure:: {filename}images/ssl_certificate_test_before.png
   :alt: SSL Labs test results before

Redirect HTTP Requests to HTTPS
````````````````````````````````
One problem you may have noticed that you can always need to remember to keep
entering the ``https`` part of the URL to access the site. It would be convenient to if any 
HTTP (``http://external.enterprise.co.tt``) request could be redirected to HTTPS.
This problem is solved by adding the highlighted lines to your default virtual
host configuration.

.. code-block:: nginx
    :linenos: inline
    :hl_lines: 2 3 4

    server {
        listen 80;
        server_name external.enterprise.co.tt
        return 301 https:/external.enterprise.co.tt$request_uri;
    }

    server {
        listen 443 default_server;
        server_name external.enterprise.co.tt

        root /usr/share/nginx/html/portal;
        index index.html;

        ssl on;
        ssl_certificate  /svr/ssl/bundle.external.enterprise.co.tt.crt;
        ssl_certificate_key /svr/ssl/external.enterprise.co.tt.key

        ssl_session_timeout 5m;

        ssl_protocols SSLv3 TLSv1 TLSv1.1 TLSv1.2;
        ssl_ciphers "HIGH:!aNULL:!MD5 or HIGH:!aNULL:!MD5:!3DES";
        ssl_prefer_server_ciphers on;

        location / {
                try_files $uri $uri/ =404;
        }
    }

This sets up a separate server for HTTP request which return always returns a
``301`` or ``moved permanaently`` HTTP status code response. The new address would be the 
to the HTTPS server

Harden the SSL Certificate
--------------------------
SSLlabs test highlights the main problems with the certificate.
- Weak Diffle-Hellman key exchange parameters
- Venerability to POODLE due the use of the deprecated protocols like SSL
- The use of weak ciphers such as RC4
- Lack of forward secrecy 

Disable old Protocols
`````````````````````
The first issue to address is the fact that the current configuration allows for
sessions using vulnerable deprecated protocols i.e. SSLv3 and TLSv1 that leave
users open to a range of exploits and could allow attackers to capture and
alter information passed between a client and the server. 
So we need to modify line 14 in our the default virtual host configuration as
followw:

.. code-block:: nginx

    ssl_protocols TLSv1.1 TLSv1.2;

Optimize th Cipher Suite
`````````````````````````

We need also to disable weak ciphers (DES, RC4) which nginx defaults to 
in favour of modern ciphers such as (AES) and modes (GCM) as recommended by
`Mozilla <https://wiki.mozilla.org/Security/Server_Side_TLS>`_

.. code-block:: nginx


    ssl_ciphers 'ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!3DES:!MD5:!PSK'; 
    ssl_prefer_server_ciphers on;

This configuration is compatible with all Firefox 27+, Chrome 22+, IE 11, Opera 14,
Safari 7, Android 4.4, Java 8. Note legacy clients including IE8 on WinXP 
will not be supported. If there is a need to support legacy clients the Mozilla
article also provides a Intermediate compatibility Chipersuite suitable for 
Firefox 1, Chrome 1, IE 7, Opera 5, Safari 1, Windows XP IE8, Android 2.3, Java 7.
The  ``ssl_prefer_server_chipers on``  ensures the server ciphers are preferred over
client ciphers.

Enhance Forward Secerecy
`````````````````````````
Mozilla summarizes the The concept of forward secrecy as ::

    client and server negotiate a key that never hits the wire, and is destroyed at
    the end of the session. The RSA private from the server is used to sign
    a Diffie-Hellman key exchange between the client and the server. The pre-master
    key obtained from the Diffie-Hellman handshake is then used for encryption.
    Since the pre-master key is specific to a connection between a client and
    a server, and used only for a limited amount of time, it is called Ephemeral.

In other words with forward secrecy even if an attacker gets a hold of the
private keys they will not be able to decrypt past communications.
Unfortunately, by default the Ephemeral Diffie-Hellman (DHE) key for exchange
provided by OpenSSL is a 1024-bit key.  So even though we are using a 2048-bit
certificate, DHE clients will use a weaker key for key-exchange than
non-ephemeral DH clients. 

We need generate a stronger DHE parameter:

.. code-block:: sh

    cd /svr/ssl/
    openssl dhparam -out dhparam.pem 2048 

Then add the following line to the default config: 

.. code-block:: nginx 

    ssl_dhparam /etc/ssl/dhparam.pem;

Connections Credentials Caching
```````````````````````````````

Almost all of the overhead with SSL/TLS is during the initial connection setup,
so by caching the connection parameters for the session, will drastically
improve subsequent requests 

.. code-block:: nginx

    ssl_session_timeout 1d;
    ssl_session_cache shared:SSL:50m;

This will create a cache shared between all worker processes. 
The cache size is specified in bytes (i.e. 50 MB).

Enable HTTP Strict Transport Security (HSTS)
`````````````````````````````````````````````
In step 2 above we already made all HTTP requests redirect to HTTPS. Strict
Transport Security builds upon this by using the HSTS feature enabled in modern
browsers. The server just need to give a response with HSTS header and the
client browser will not try to contact the server over regular HTTP again for
the given time period (max-age).  Indeed, the browser will interpret all requests to this
hostname as HTTPS, no matter what. 

.. code-block:: nginx

   add_header Strict-Transport-Security "max-age=15768000";

The max-age is set in seconds. 15768000 seconds is equivalent to 6 months.

Enable OCSP SSL Stapling
`````````````````````````
Online Certificate Status Protocol (OCSP) is a protocol for checking the
revocation status of the presented certificate. When the browser is
presented a certificate, it will contact the issuer of that certificate to
ascertain if it has been revoked. This, of course, adds overhead to the
connection initialization and also presents a privacy issue involving a 3rd
party.

This OCSP stapling allows the web server (at regular intervals) to contact the
CA's OCSP server to get a signed response and staple it on
to the handshake to use when the connection is set up. This provides for a much more
efficient connection initialization and does not involve any third party.

The first thing that we have to set up the CA's certificate bundle so we can
verify that the OCSP response indeed came from the CA 

.. code-block:: sh

    cat  ComodoRSADomainValidationSecureServerCA.crt COMODORSAAddTrustCA.crt AddTrustExternalRoot.crt >> comodo.crt


Next Add the following lines to the config for your default virtual host

.. code-block:: nginx

    ssl_stapling on;
    ssl_stapling_verify on;
    ssl_trusted_certificate /svr/ssl/comodo.crt;
    resolver 208.67.222.222 208.67.220.220;

The IP addresses for resolver are  for the OpenDNS public DNS servers.
Alternatively you can use Google or some other service.

The final configuration should look like.

.. code-block:: nginx

    server {
        listen 80;
        server_name external.enterprise.co.tt
        return 301 https:/external.enterprise.co.tt$request_uri;
    }

    server {
        listen 443 default_server;
        root /usr/share/nginx/html/portal;
        index index.html;

        server_name external.enterprise.co.tt.crt;
        
        ssl on;
        ssl_certificate  /svr/ssl/bundle.external.enterprise.co.tt.crt;
        ssl_certificate_key /svr/ssl/external.enterprise.co.tt.key

        ssl_session_timeout 1d;
        ssl_session_cache shared:SSL:50m;

        # Diffie-Hellman parameter for DHE ciphersuites, recommended 2048 bits
        ssl_dhparam /svr/ssl/dhparam.pem;

        # modern configuration..
        ssl_protocols TLSv1.1 TLSv1.2;
        ssl_ciphers 'ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!3DES:!MD5:!PSK';
        ssl_prefer_server_ciphers on;

        add_header Strict-Transport-Security max-age=15768000;

        # OCSP Stapling
        # fetch OCSP records from URL in ssl_certificate and cache them
        ssl_stapling on;
        ssl_stapling_verify on;

        ssl_trusted_certificate /svr/ssl/comodo.crt;
        resolver 208.67.222.222 208.67.220.220

        location / {
                try_files $uri $uri/ =404;
        }

    }

Test the new configuration by first run 

.. code-block:: sh
    
    service nginx configtest 

Finally, restart ``nginx`` to restart and reload the new default configuration

.. code-block:: sh
    
    service nginx restart 

Revisit SSL Server Test page submit you site for testing and
congratulate your self for earing a well deserved A+

.. figure:: {filename}images/ssl_certificate_test_before.png
   :alt: SSL Labs test results After

Now is a good time to chat with you firewall administrator to confirm that 
only external HTTP and HTTPS is being allowed in to your reverse proxy box and in
turn your reverse proxy can connect with the ``upstream`` application servers
on the internal network.

Step 3: Configure the Reverse Proxy 
=====================================
Finally you are ready to set up the reverse proxy.  Our configuration will provide
external users with access to following URL space. 

==================================    =====================================
External URL                          Route to   
==================================    ===================================== 
external.enterprise.co.tt             Static site showing
                                      directory of the services
                                      available through the reverse
                                      proxy
external.enterprise.co.tt/jboss       The JBoss application running as an HTTPS
                                      service on a machine on the internal
                                      network. The JBoss applicaton must run as HTTPS 
                                      on the corporate LAN.  But you can use a 
                                      self signed certificate since it is never directly
                                      exposed to the internet. This handy guide
                                      shows you how to `configure JBoss for 
                                      SSL <https://docs.jboss.org/jbossweb/7.0.x/ssl-howto.html>`_
external.enterprise.co.tt/django1     Legacy Django 1.4 application running on
                                      Apache 2 ``mod-python``. 
external.enterprise.co.tt/django2     A More modern Django application running 
                                      nginx/gunicorn. The internal nginx
                                      server takes care of static media serving
external.enterprise.co.tt/owa         Microsoft Outlook web access 
==================================    ===================================== 

We start with a block which adds header fields to the 
request that will be passed on to the upstream applications. This ensures 
the upstream applications have access to to the correct HTTP headers. 

.. code-block:: nginx
   
     proxy_set_header   Host             $host;
     proxy_set_header   X-Real-IP        $remote_addr;
     proxy_set_header   REMOTE_HOST      $remote_addr;
     proxy_set_header   X-Forwarded-For  $proxy_add_x_forwarded_for;
     proxy_set_header   X-Forwarded-Proto $scheme;

- Host - The domain name of the server and the TCP port
  number on which the server is listening i.e. *external.enterprise.co.tt:443*
- X-Real-IP - Without this header the upstream application will record all the
  request to the upstream as coming from the reverse proxy as opposed to the 
  remote clients.
- REMOTE_HOST - The same as X-Real-IP but some applications e.g. Django
  determine the client IP from this field in the request.
- X-Forwarded-For - This is similar to X-Real-IP, but provides added connection
  source entries for the entire chain of proxies the connection's passed
  through. 
- X-Forwarded-Proto This is used for identifying the originating protocol of
  the request, since the reverse proxy will communicate to the upstream using
  HTTP even if the request to the reverse proxy is HTTPS. 

The next block is were the actual reverse proxing actually happens. The
``location`` directive sets the processing based on the request URI. So for  URI
``https://external.enterprise.co.tt/jboss-app/``  which matches the location 
/jboss-app/ will be mapped to the JBoss server on the internal network. The
``proxy_pass`` directive allows us to specify the protocol i.e. HTTPS and the
port ``8443``. In contrast, the URI ``https://external.enterprise.co.tt/owa/`` 
will map to the exchange server running OWA ``http://192.168.64.A/owa/``  



.. code-block:: nginx
    :linenos: inline

    location /jboss-app/ {
        proxy_pass https://192.168.64.Y:8443/;

     } 

    location /dango1/ {
        proxy_pass http://192.168.64.A;

     } 

    location /django2/ {
        proxy_pass http://192.168.64.B;

     } 
    
    location /owa/ {
        proxy_pass http://192.168.64.A/owa
    }

    location /Microsoft-Server-ActiveSync/ {
        proxy_pass http://192.168.64.A;
    }

Next set up common error pages to deal with client and server errors

.. code-block:: nginx

   error_page 404             /404.html;
   error_page 500 502 503 504 /500.html;

You will need to add these  to the root of your static site i.e. 
to ``/usr/share/nginx/html/portal``. 

Test your configuration and restart nginx to reload the configuration
.. code-block:: nginx
   
   service nginx configtest
   service nginx restart

Finally, visit ``https://external.enterprise.co.tt/`` and try out the various
routes as defined in the reverse proxy. Ensure that you can log in i.e. to
verify the information is been passed correctly to the back end servers.


.. rubric:: Footnotes

.. [#f1] Of course ``Microsoft`` is has an actual product called Web
   Application Proxy which is available as part of Windows Server® 2012 R2.  But
   we believe that our open source approach was quick and easy to setup and met
   all the clients requirements. 

