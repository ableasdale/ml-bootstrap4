xquery version "1.0-ml";

import module namespace lib-bootstrap = "http://www.xmlmachines.com/lib-bootstrap" at "/lib/lib-bootstrap.xqy";

lib-bootstrap:create-starter-template("test", "test"),

lib-bootstrap:display-with-muted-text(4, "Main title", "sub"),
lib-bootstrap:lead-paragraph("lead text"),
lib-bootstrap:display-header(1, "header1"),
lib-bootstrap:display-header(2, "header2", "with subheading text"),
lib-bootstrap:display-header(3, "header3"),

lib-bootstrap:blockquote("main body of text", "Mr Blah in", "The Big Book", "text-center"),
lib-bootstrap:blockquote("main body of text", "Mr Blah in", "The Big Book", "text-right"),

lib-bootstrap:figure("http://via.placeholder.com/350x150", "some alt text", "This is a caption"),

lib-bootstrap:two-column-row(4,8,"A","B"),
lib-bootstrap:three-column-row(4,4,4,"A","B","C")