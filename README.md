# SignalWire Coding Challenge

* API URL http://139.59.44.141:3000/tickets
* Methon POST
* Request Params(JSON data)
* Content Type: application/json 
* Example JSON data
  ```
  {
  "title": "title name",
  "user_id":2,
  "tags" : ["tag1","tag2"]
  }
  ```
 * If Success 
    Respoonse Code 200
    ```
   {
    "success": true,
    "message": "Ticket created"
   }
   ```
* If Failed
    Reponse Code 422 or 500
    ```
    {
    "success": false,
    "message": "Error message"
   }
   ```

* Internal heighest count Tag name and count response URL
https://webhook.site/#!/0618378d-b6ea-4d4c-a892-0140153dd8b1/a79d929d-5e23-4336-8003-1dc77b380e30/1
