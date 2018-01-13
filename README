# ml-bootstrap4

```xquery
xquery version "1.0-ml";

import module namespace admin = "http://marklogic.com/xdmp/admin" at "/MarkLogic/admin.xqy";

declare variable $DATABASE as xs:string := "Documents";
declare variable $PORT as xs:unsignedLong := 8005;
declare variable $PATH := "/ROOT/PATH/TO/ml-bootstrap4/src/main/xquery";

declare function local:create-http-application-server() {
  let $config := admin:get-configuration()
  let $config := admin:http-server-create(admin:get-configuration(), admin:group-get-id($config, "Default"), fn:concat("http-",$PORT), $PATH, $PORT, 0, xdmp:database($DATABASE))
  return admin:save-configuration($config)
};

local:create-http-application-server()
```