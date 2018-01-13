xquery version "1.0-ml";

module namespace lib-bootstrap = "http://www.xmlmachines.com/lib-bootstrap";

declare namespace xdmp = "http://marklogic.com/xdmp";

declare function lib-bootstrap:create-starter-template($title as xs:string, $text as xs:string) as item()* {
    (xdmp:set-response-content-type("text/html; charset=utf-8"),
    "<!doctype html>",
    <html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous"/>
        <title>{$title}</title>
    </head>
    <body>
        <h1>{$text}</h1>
        <h2>{$text}</h2>
        <h3>{$text}</h3>
        <h4>{$text}</h4>
        <h5>{$text}</h5>
        <h6>{$text}</h6>
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous">{" "}</script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous">{" "}</script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js" integrity="sha384-a5N7Y/aK3qNeh15eJKGWxsqtnX/wWdSZSKp+81YjTmS15nvnvxKHuzaWwXHDli+4" crossorigin="anonymous">{" "}</script>
    </body>
    </html>)
};

declare function lib-bootstrap:display-with-muted-text($size as xs:int, $main as xs:string, $sub as xs:string) as element() {
    element {"h"||$size} {$main || " ", element small { attribute class {"text-muted"}, $sub}} 
};

declare function lib-bootstrap:lead-paragraph($text) as element(p){
    element p {attribute class {"lead"}, $text}
};

(: Display headers :)

declare function lib-bootstrap:display-header($size as xs:int, $heading as xs:string, $subheading as xs:string) as element() {
    element {"h"||$size} {attribute class {"display-"||$size}, $heading|| " ", element small { attribute class {"text-muted"}, $subheading}}
};

declare function lib-bootstrap:display-header($size as xs:int, $heading as xs:string) as element() {
    element {"h"||$size} {attribute class {"display-"||$size}, $heading}
};


