xquery version "1.0-ml";

module namespace lib-bootstrap = "http://www.xmlmachines.com/lib-bootstrap";

declare namespace xdmp = "http://marklogic.com/xdmp";

declare function lib-bootstrap:create-starter-template($title as xs:string, $content as item()*) as item()* {
    lib-bootstrap:create-starter-template($title, $content, ())
};

declare function lib-bootstrap:create-starter-template($title as xs:string, $content as item()*, $javascript as item()*) as item()* {
    (xdmp:set-response-content-type("text/html; charset=utf-8"),
    "<!doctype html>",
    <html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous" />
        <title>{$title}</title>
    </head>
    <body>
        {$content}
        <!-- Optional JavaScript -->
        {if(fn:empty($javascript)) then "" else $javascript}
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">{" "}</script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous">{" "}</script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous">{" "}</script>
    </body>
    </html>)
};

declare function lib-bootstrap:bootstrap-container($content as item()*) as element(div) {
    element div { attribute class {"container"}, $content }
};

declare function lib-bootstrap:bootstrap-fluid-container($content as item()*) as element(div) {
    element div { attribute class {"container-fluid"}, $content }
};

declare function lib-bootstrap:display-with-muted-text($size as xs:int, $main as xs:string, $sub as xs:string) as element() {
    element {"h"||$size} {$main || " ", element small { attribute class {"text-muted"}, $sub}} 
};

declare function lib-bootstrap:lead-paragraph($text) as element(p){
    element p {attribute class {"lead"}, $text}
};

(: Heading (h1 - h7) :)
declare function lib-bootstrap:h($size as xs:int, $heading as xs:string) as element() {
    element {"h"||$size} {$heading}
};

declare function lib-bootstrap:h($size as xs:int, $class as xs:string, $heading as xs:string) as element() {
    element {"h"||$size} {attribute class {$class}, $heading}
};

(: Display headers :)
declare function lib-bootstrap:display-header($size as xs:int, $heading as xs:string, $subheading as xs:string) as element() {
    element {"h"||$size} {attribute class {"display-"||$size}, $heading|| " ", element small { attribute class {"text-muted"}, $subheading}}
};

declare function lib-bootstrap:display-header($size as xs:int, $heading as xs:string) as element() {
    element {"h"||$size} {attribute class {"display-"||$size}, $heading}
};

(: Blockquote :)
declare function lib-bootstrap:blockquote($quote as xs:string, $footer-text as xs:string, $citation-title as xs:string, $justification as xs:string) as element(blockquote) {
    <blockquote class="blockquote {$justification}">
        <p class="mb-0">{$quote}</p>
        <footer class="blockquote-footer">{$footer-text||" "} <cite title="{$citation-title}">{$citation-title}</cite></footer>
    </blockquote>
};


(: Card :)
declare function lib-bootstrap:card-with-header($title as xs:string, $body as item()*) as element(div) {
    element div {attribute class {"card"},
        lib-bootstrap:h(5, "card-header", $title),
        element div {attribute class {"card-body"}, $body}
    }
};

declare function lib-bootstrap:image($class as xs:string, $src as xs:string, $alt as xs:string) as element(img) {
    <img class="{$class}" src="{$src}" alt="{$alt}" />
};

(: Figure :)
declare function lib-bootstrap:figure($img as element(img), $caption as xs:string) as element(figure) {
    <figure class="figure">
        {$img}
        <figcaption class="figure-caption">{$caption}</figcaption>
    </figure>
};


declare function lib-bootstrap:figure($img-src as xs:string, $alt as xs:string, $caption as xs:string) as element(figure) {
    lib-bootstrap:figure(lib-bootstrap:image("figure-img img-fluid", $img-src, $alt), $caption)
};

(: Media :)
declare function lib-bootstrap:media($img as element(img), $heading as xs:string, $body as xs:string) {
    <div class="media">{$img, lib-bootstrap:media-body($heading, $body)}</div>
};

declare function lib-bootstrap:media-body($heading as xs:string, $body as xs:string) {
    <div class="media-body">
        <h5 class="mt-0">{$heading}</h5>
        {$body}
    </div>
};

(: Media List :)
declare function lib-bootstrap:media-list($items as element(li)+) as element (ul) {
    <ul class="list-unstyled">
        {$items}
    </ul>
};

declare function lib-bootstrap:media-list-item($img as element(img), $heading as xs:string, $body as xs:string) as element (li) {
    <li class="media">{$img, lib-bootstrap:media-body($heading, $body)}</li>
};


(: TODO - declare function lib-bootstrap:media($img as element(img), $heading as item(), $body as xs:string) { :)

(: Layout :)
declare function lib-bootstrap:two-column-row($left as xs:int, $right as xs:int, $content-left as item(), $content-right as item()) as element(div) {
    element div {attribute class {"row"},
        element div {attribute class {"col-"||$left}, $content-left},
        element div {attribute class {"col-"||$right}, $content-right}
    }
};

declare function lib-bootstrap:three-column-row($left as xs:int, $centre as xs:int, $right as xs:int, $content-left as item(), $content-centre as item(), $content-right as item()) as element(div) {
    element div {attribute class {"row"},
        element div {attribute class {"col-"||$left}, $content-left},
        element div {attribute class {"col-"||$centre}, $content-centre},
        element div {attribute class {"col-"||$right}, $content-right}
    }
};