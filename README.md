# bootstrap-pdf

bootstrap-pdf is a handy tool for creating good looking and well structured PDFs
using [Twitter Bootstrap](http://twitter.github.com/bootstrap/).


## Requirements

- Git
- Ruby 1.9.3
  - wkhtmltopdf ([Installing wkhtmltopdf](https://github.com/pdfkit/pdfkit/wiki/Installing-WKHTMLTOPDF))


## Getting started

### 1. Install the Gem
    gem install bootstrap-pdf

### 2. Usage

#### Make a file with some content
    touch foo.haml

Inside the file:

    !!!5
    %html
      %head
      %body
        .container
          .page-header
            %h1 Hey there

#### Run it!

    bootstrap-pdf foo.haml

Will generate a file called out.pdf

#### Specifying custom stylesheets (path to look)
    bootstrap-pdf foo.haml -s .
