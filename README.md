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
