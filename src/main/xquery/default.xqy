xquery version "1.0-ml";

import module namespace lib-bootstrap = "http://www.xmlmachines.com/lib-bootstrap" at "/lib/lib-bootstrap.xqy";

lib-bootstrap:create-starter-template("test", "test"),

lib-bootstrap:display-with-muted-text(4, "Main title", "sub"),
lib-bootstrap:lead-paragraph("lead text"),
lib-bootstrap:display-header(1, "header1"),
lib-bootstrap:display-header(2, "header2", "with subheading text"),
lib-bootstrap:display-header(3, "header3")