*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CHROME_BROWSER_PATH}    C:/ChromeTest/chrome-win64/chrome.exe
${CHROME_DRIVER_PATH}     C:/ChromeTest/chromedriver-win64/chromedriver.exe
${URL}    http://localhost:7272/StarterFiles/Registration.html 
${delay}    0.2s

*** Test Cases ***
TC_01: Open website
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${options.binary_location}=    Set Variable    ${CHROME_BROWSER_PATH}
    
    ${service}=    Evaluate    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")    sys
    
    Create Webdriver    Chrome    options=${options}    service=${service}
    Set Selenium Speed    ${delay}
    Go To    ${URL}

    Input Text    id=firstname      Somyod
    Input Text    id=lastname       Sodsai
    Input Text    id=organization    CS KKU
    Input Text    id=phone       091-001-1234

    Click Button    id=registerButton

    Page Should Contain    Success

    capture page screenshot    Test1_2_Test2bot_TC01_Result.png

    close browser