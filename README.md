# Invoice Parser

## App Setup
You can pull this code and set up your database with `rails db:create && rails db:migrate` and run the server with `ruby bin/rails server`.

## Instructions
It's recommended to run this on a Windows machine

1. Start the server: `ruby bin/rails server`
##### NOTE: You will need to make a couple API calls. I personally chose Postman but you can also use curl if you prefer.
3. Locate Invoice 1 or 2 (found in test/fixtures/files) and copy the full file path
4. Send a POST request to `http://localhost:3000/uploads?` while attaching the following form-data in the body:
    ```
    email: email, invoice: file_path
   ```
   You will receive back a document ID that will allow you to access the parsed PDF in a GET request to `/documents`. Note this number.
5. The upload and corresponding document have been created. You can now access the document by sending a GET request to `http://localhost:3000/documents/:id_you_just_received`
6. Sending the GET request should return the parsed document information from the filepath you provided in the upload step.

## Versions
Ruby 2.6.6p146

Rails 6.1.2.1

## Testing
Before testing, you will need to run the migrations on the test DB: `rails db:migrate RAILS_ENV="test"`

You can run the Uploads controller specs with: `rails test test/controllers/uploads_controller.rb`

You can run the Documents controller spcs with: `rails test test/controllers/documents_controller_test.rb`

You can run the ParsePdf service specs with: `rails test test/services/parse_pdf_service_test.rb` 
