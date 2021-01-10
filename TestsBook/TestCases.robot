*** Settings ***
Resource  ../Operational/instructions.robot
Resource  ../Operational/locatorVariables.robot


#robot -d results Tests/TestCases.robot  


*** Test Cases ***
User should be able to Land on Book details Page
    [Tags]    sanity
    Open India Bookstore
    Navigate to Category "Fantasy & Science Fiction"
    Click on "Fantasy" Sub Section
    Search for the book title 'Harry Potter y la piedra filos' in the Booklist
    Go to Expected Book details page
    Verify User navigated to the expected book details

Adding selected book to Cart
    Adding Book to Cart
