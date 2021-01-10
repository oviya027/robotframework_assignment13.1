*** Settings ***
Library  SeleniumLibrary
Library  Collections
Resource  ../Operational/instructions.robot
Resource  ../Operational/locatorVariables.robot

*** Keywords ***
Open India Bookstore
    Open Browser  ${url_books}  ${brows}   
    Maximize Browser Window
    sleep  4s
    Verify WebPage title  ${Expected_homePage}
    Execute Javascript  window.scrollTo(0, 500)
    Log to Console  Step1

Navigate to Category "Fantasy & Science Fiction"
    ${category_count} =  Get Element Count  xpath=//*[@id="leftNavContainer"]/ul/li
    #Log to Console  ${category_count}
    sleep  5s
    FOR  ${i}  IN RANGE  1  ${category_count}
        ${dynamic_categ_name} =  Get Text  xpath=//*[@id="leftNavContainer"]/ul/li[${i}]/a
        Scroll Element Into View  xpath=//*[@id="leftNavContainer"]/ul/li[${i}]/a
        #Log to Console  ${dynamic_categ_name}
        Exit For Loop If  "${dynamic_categ_name}" == "${Expected_category}"
    END
    Set Test Variable  ${static_categ_name}  xpath=//*[@id="leftNavContainer"]/ul/li[${i}]/a
    Log to Console  Step2
    

Click on "Fantasy" Sub Section
    Mouse Over  ${static_categ_name}
    sleep  2s
    Mouse Over  ${Fantasy_Science_Fiction}
    sleep  4s
    Verify WebPage title  Digital Media and Internet
    Click Element  ${Fantasy_Science_Fiction}
    sleep  2s
    Verify WebPage title  ${Expected_Book_Category}
    Log to Console  Step3


Search for the book title 'Harry Potter y la piedra filos' in the Booklist
    ${buk_list} =  Get Element Count  xpath=//div[@class='col-md-9']/div
    #Log to Console  ${buk_list}
    FOR  ${j}  IN RANGE  2  ${buk_list}
    ${buk_names} =  Get Text  xpath=//div[@class='col-md-9']/div[${j}]/a/div[3]
    #Log to Console  ${buk_names}
    Exit For Loop If  "${buk_names}" == "${Expected_Book_Name}"
    END
    Set Test Variable  ${exact_buk_elem}  xpath=//div[@class='col-md-9']/div[${j}]/a/div[3]
    Log to Console  Step4

Go to Expected Book details page
    sleep  5s
    Click Element  ${exact_buk_elem}
    Log to Console  Step5
    
Verify User navigated to the expected book details
    Verify WebPage title  ${Expected_Book_Detailed_Name}
    Log to Console  Step6

Verify WebPage title
    [Arguments]  ${title_name}
    Wait Until Page Contains  ${title_name}
    Log to Console  ${title_name}
    Log to Console  Pass!!

Adding Book to Cart
    # select the price site
    Click Element  xpath=//*[@id="main-wrapper"]/div[5]/div[2]/div[3]/div/a[2]
    Select Window  ${Expected_flipkart_page_title}
    Click Element  xpath=//*[@id="container"]/div/div[3]/div[2]/div/div[2]/div[2]/div/div/div/a[2]
    Sleep  3s
    Select Window  ${Expected_book_page} 
    Click Element  xpath=//*[@id="container"]/div/div[3]/div[1]/div[1]/div[2]/div/ul/li[1]/button 
    Log to Console  Step7   

    