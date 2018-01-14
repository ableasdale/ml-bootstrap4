xquery version "1.0-ml";

import module namespace lib-bootstrap = "http://www.xmlmachines.com/lib-bootstrap" at "/lib/lib-bootstrap.xqy";

declare option xdmp:mapping "false";

declare variable $text as xs:string := "test";

lib-bootstrap:create-starter-template("test", lib-bootstrap:bootstrap-container(
    (<h1>{$text}</h1>,
        <h2>{$text}</h2>,
        <h3>{$text}</h3>,
        <h4>{$text}</h4>,
        <h5>{$text}</h5>,
        <h6>{$text}</h6>,
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
    ))
)

