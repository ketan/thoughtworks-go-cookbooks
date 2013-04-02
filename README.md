ThoughtWorks go-cookbooks
=========================

Chef Cookbooks to install [ThoughtWorks Go](http://www.thoughtworks-studios.com/go-continuous-delivery)

Usage:

    $ git clone https://github.com/ketan/thoughtworks-go-cookbooks.git
    $ cd thoughtworks-go-cookbooks
    $ sudo chef-solo -c solo.rb -o 'recipe[go_server],recipe[go_agent]'
