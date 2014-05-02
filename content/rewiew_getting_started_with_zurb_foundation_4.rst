Book Review: Getting Started with Zurb Foundation 4 by Andrew D. Patterson
#############################################################################

:date: 2014-02-23
:tags: Zurb Foundation, book review, foundation 4, responsive, CSS, Sass
:category:  Zurb Foundation
:slug: book-review-getting-started-with-zurb-foundation
:author: Christopher Clarke
:summary: Covers the all the basics but does not provide enough by way of practical
          guidelines that readers could apply to building real world
          responsive sites.


I was really looking forward to reviewing this book as I'm a big fan of `Zurb
Foundation`_ as I think that it is by far the best_ responsive framework out
there. Indeed, at work here at ChrisDev_,  we use Foundation for all our web
based projects. 

The book is supposed to aimed at web architects, designers, and builders who
were already familiar with the basics principles of responsive design and 
is divided up into four chapters. I found that 
`Chapter 1: Getting The Most from the Grid System` was the most useful of the
lot. The author discussed in some detail his approach
to dealing with a number of practical layout issues including: nesting rows in
columns; understanding and customizing column gutters; maintaining row and page
width; mobile first design (or what the author calls designing from small to to
large); rearranging columns and so on.  While I found that this chapter hit
all the basics I felt more emphasis should have been placed on the implications
of mobile first design as this has always been Foundation's big selling
point over rivals such as `Twitter BootStrap`_.  Also, it was strange
that there was no mention of some of the great resources provided by Zurb such
as the `Foundation 4 Templates`_ which provide a number of canned layouts for
various kinds of sites (blogs, marketing product page etc.) that can be a great
starting point for customizing layout.

I was a little disappointed in the next two chapters which covered the CSS and
JavaScript components provided with Foundation. These seemed a little cursory and
there was little that went beyond the `online documentation`_.
Of course Foundation comes with more than twenty CSS components about twelve
JavaScript Plugins so it would have been unrealistic to expect a comprehensive
treatment of all these components, but maybe the author could have singled out
the more popular component such as Orbit for more comprehensive treatment. 

The final chapter covered Sass_. I felt that there was a lot of good material
here and readers unfamiliar with Sass would find it quite enlightening.
I particularly liked the sections entitled *Customizing with Variables* and
*Understanding functions and mixins*. However, I felt that more emphasis should
have been placed on this topic given that Sass has become the most efficient
way to customize and style layout, components and plugins.  I would have
preferred if Sass could have been introduced very early on (probably as Chapter
2) and the subsequent chapters covering CSS and JavaScript components each
contain a section on how to customize one or more of the components or plugins
with Sass.

Overall, I would have to give this book a 3 out of 5 stars since it covers the
basics and provides a good supplement for the `online documentation`_. However,
I feel that for more experienced designers, architects and builders the book
will prove to be a bit of a disappointment. Aside from `Chapter 1`, it provides
little in the way of a practical approach or even  some guidelines for building
real world responsive sites with Foundation.  This is important in the context
of a rapidly evolving framework like Zurb Foundation, where we are we are
reviewing a book about `version 4` while `Foundation 5`_ has been out since
November 21, 2013. 


.. _Zurb Foundation : http://foundation.zurb.com
.. _Foundation 4 Templates : http://foundation.zurb.com/templates4.html
.. _online documentation : http://docs.foundation.com
.. _best :  http://responsive.vermilion.com/compare.php?framework=current
.. _Twitter Bootstrap : http://getbootstrap.com
.. _Sass : http://sass-lang.com
.. _Foundation 5 : http://foundation.zurb.com/docs/changelog.html
.. _ChrisDev : http://chrisdev.com
