Welcome to the Blog
###################

:date: 2013-04-03
:tags: general
:category: test
:slug: test-post
:author: Christopher Clarke
:summary: Short version for index and feeds

This is a test
Vestibulum id ligula porta felis euismod semper.
Cras mattis consectetur purus sit amet fermentum.


Nullam quis risus eget urna mollis ornare vel eu leo.
Cum sociis natoque penatibus et magnis dis parturient montes,
nascetur ridiculus mus. Duis mollis, est non commodo luctus,
nisi erat porttitor ligula, eget lacinia odio sem nec elit.
Duis mollis, est non commodo luctus, nisi erat porttitor
ligula, eget lacinia odio sem nec elit. Praesent commodo cursus
magna, vel scelerisque nisl consectetur et.


* Nullam quis risus eget urna mollis ornare vel eu leo.
* Nullam quis risus eget urna mollis ornare vel eu leo.


Here is some code:

.. code-block:: python

    class CustomFlatPageForm(FlatpageForm):

        template_name = forms.ChoiceField(
            choices=FPX_TEMPLATE_CHOICES, required=False,
            label='Template',
            help_text=_("Sepcify a template for displaying your content")
        )

        content_md = forms.CharField(label="Content",
            widget=content_widget()
        )

        content = forms.CharField(widget=forms.Textarea(), required=False)


        def __init__(self, *args, **kwargs):
            super(CustomFlatPageForm, self).__init__(*args, **kwargs)
            fp = self.instance

            try:
                latest_revision = fp.revisions.order_by("-updated")[0]
            except IndexError:
                latest_revision = None

            if latest_revision:
                self.fields["content_md"].initial = \
                                latest_revision.content_source
