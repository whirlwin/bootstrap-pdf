# BootstrapPDF

BootstrapPDF is a handy tool for creating good looking and well structured PDFs
using [Twitter Bootstrap](http://twitter.github.com/bootstrap/).


## Requirements

- Git
- Ruby 1.9.3
  - wkhtmltopdf ([Installing wkhtmltopdf](https://github.com/pdfkit/pdfkit/wiki/Installing-WKHTMLTOPDF))


## Getting started

### 1. Install the Gem
    gem install bootstrappdf

### 2. Usage
    bootstrappdf foo.haml

Will create a file called out.pdf

#### Specifying custom stylesheets (path to look)
    bootstrap foo.haml -s .
