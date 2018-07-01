xquery version "1.0-ml";

import module namespace lib-bootstrap = "http://www.xmlmachines.com/lib-bootstrap" at "/lib/lib-bootstrap.xqy";

declare option xdmp:mapping "false";

declare variable $text as xs:string := "test";

lib-bootstrap:create-starter-template("MarkLogic Bootstrap 4 Page Template",
        lib-bootstrap:bootstrap-fluid-container(
        (
            for $i in 1 to 7 return (lib-bootstrap:h($i, "Header "||$i)),
            for $i in 1 to 4 return (lib-bootstrap:display-header($i, "Display Header "||$i, "with subheading text")),

            element hr {},
            lib-bootstrap:display-with-muted-text(4, "Main title", "sub"),
            lib-bootstrap:lead-paragraph("lead text"),

            element hr {},
            lib-bootstrap:h(5, "Blockquote"),
            lib-bootstrap:blockquote("blockquote rules!", "Mr Blah in", "The Big Book", "text-left"),
            lib-bootstrap:blockquote("main body of text", "Mr Blah in", "The Big Book", "text-center"),
            lib-bootstrap:blockquote("main body of text", "Mr Blah in", "The Big Book", "text-right"),

            element hr {},
            lib-bootstrap:h(5, "Figure"),
            lib-bootstrap:figure("http://via.placeholder.com/350x150", "some alt text", "This is a caption"),

            element hr {},
            lib-bootstrap:h(5, "Layouts"),
            lib-bootstrap:two-column-row(4,8,"A","B"),
            lib-bootstrap:three-column-row(4,4,4,"A","B","C"),

            element hr {},
            lib-bootstrap:image("mr-3 rounded", "http://via.placeholder.com/350x150", "alt text"),

            lib-bootstrap:media(
                    lib-bootstrap:image("mr-3", "http://via.placeholder.com/350x150", "alt text"),
                    "heading",
                    "body text here"
            ),

            element hr {},
            lib-bootstrap:h(5, "Card"),
            lib-bootstrap:card-with-header("Card title", "Card body text"),

            element hr {},
            lib-bootstrap:h(5, "Dismissable Alert"),
            lib-bootstrap:dismissable-alert("Bold text", "normal text")
        )
    )
)
