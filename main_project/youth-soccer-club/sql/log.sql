INSERT INTO EmailLogs (Date, LocationIDSender, EmailReceiver, EmailSubject, EmailBody)
VALUES (CURDATE(), 1, 'example_receiver@example.com', 'Subject of the Email', LEFT('Body of the email that exceeds 100 characters, this part will be truncated to fit into the EmailBody field.', 100));
