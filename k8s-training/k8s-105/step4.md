---

## Test Tomcat Manager UI Access

---

FYI: The Secrets we defined earlier are the username and password for the Tomcat Manager UI.  This is found at http://tomcat-server:8080/manager/html
 
 
---

## Confirm that we CANNOT access the Tomcat Manager UI without credentials

The below command exec’s into the Pod, curls localhost, returns output, and looks for response code.
`kubectl exec -it $(kubectl get pod --selector="user"="a123456" -o jsonpath={.items[0]..metadata.name}) -- sh -c "curl -is localhost:8080/manager/html | grep HTTP"`{{execute}}
> _"HTTP/1.1 401"_

An HTTP status code of 4xx shows that we do not have privileges to access the page (since we did not specify a username and password).


---

## Verify that we CAN access the Tomcat Manager UI with credentials

The below command does the same thing as the command above, but also passes in the username and password (matching the ones defined in the Secret we deployed).

`kubectl exec -it $(kubectl get pod --selector="user"="a123456" -o jsonpath={.items[0]..metadata.name}) -- sh -c "curl -is -u admin:password localhost:8080/manager/html | grep HTTP"`{{execute}}
> _"HTTP/1.1 200"_

An HTTP status code of 200 shows that we successfully accessed the page

---

## That's all for this lab!!!

