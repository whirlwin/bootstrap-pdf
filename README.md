# BootstrapPDF

BootstrapPDF is a handy tool for creating good looking and well structured PDFs
using [Twitter Bootstrap](http://twitter.github.com/bootstrap/).


## Requirements

- Git
- Ruby 1.9.3


## Getting started

### 1. Clone the repository:
>     git clone git@github.com:whirlwin/bootstrap-cv.git

### 2. Fetch all necessary gems:
>     bundle

### 3. Create a file called foo.haml in the project, and give it some content.
    %html
      %head
      %body
        .container
          %h1 Hey there

### 4. Convert the file to PDF
>     rake haml

This produces the file out.pdf.
