*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CHROME_BROWSER_PATH}    C:/ChromeTest/chrome-win64/chrome.exe
${CHROME_DRIVER_PATH}     C:/ChromeTest/chromedriver-win64/chromedriver.exe
${URL}    http://localhost:7272/StarterFiles/Registration.html 
${delay}    5s

*** Test Cases ***
TC_01: Open website
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${options.binary_location}=    Set Variable    ${CHROME_BROWSER_PATH}
    
    ${service}=    Evaluate    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")    sys
    
    Create Webdriver    Chrome    options=${options}    service=${service}
    Set Selenium Speed    ${delay}
    Go To    ${URL}

