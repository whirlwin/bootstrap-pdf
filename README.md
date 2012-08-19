# Bootstrap CV

Bootstrap CV is a handy tool for creating good looking and well structured CVs
using [Twitter Bootstrap](http://twitter.github.com/bootstrap/).


## Requirements

- Ruby 1.9.3


## Getting started

### 1. Clone the repository:
>     git clone git@github.com:whirlwin/bootstrap-cv.git

### 2. Fetch all necessary gems:
>     bundle

### 3. Make a Haml file called cv.haml, and give it some content.
    %html
      %head
      %body
        .container
          %h1 Hey there

### 4. Convert the file to PDF
>     rake haml

This produces a file called cv.pdf.
