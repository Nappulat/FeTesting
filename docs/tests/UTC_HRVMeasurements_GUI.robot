*** Settings ***
Documentation     Onnistunut sisäänkirjautuminen ja HRV mittaustulosten pyyntö käyttöliittymässä.
Library           Browser    auto_closing_level=KEEP
Library     CryptoLibrary     variable_decryption=True

*** Variables ***

${Username}    crypt:Rjv8RYjWPp72oh1mY1wAE/5lzYGPwGmMA+Av09jQ1gfGEA6wffCSNA8Fcr0LmquPMVaTP6ePNW2PDgkWJZu5Zmt3loU=
${Password}    crypt:oDNjvOw2FZFOo8kcHVJzgdRa4z2uT3QNjHzM/+eUXHladU7DzzwgNCpRMdP+ZQqe9ubpacwAg0Vpc0M=

*** Test Cases ***
Get HRV Measurements
    [Documentation]    Sisäänkirjautuminen, mittaustulosten pyyntö ja uloskirjautuminen.
    New Browser    chromium    headless=No

    New Page       http://localhost:5173
    Get Title      ==    Kirjautumissivu
    Type Text      //input[@id='username']        ${Username}    delay=0.1 s
    Type Secret    //input[@id='password']    $Password      delay=0.1 s
    Click With Options    xpath=//button[@type='submit' and text()='Kirjaudu sisään']    delay=2 s

    Wait For Condition    Text    Title   contains    Renovo App

    Click With Options    xpath=(//a[@href='hrv.html' and text()='Tulokset'])[1]    delay=1 s
    Click With Options    xpath=//button[@id='print-hrv-thirty-days' and text()='30 viimeistä päivää']    delay=2 s

    Click With Options    xpath=//button[@id='log-out-user' and text()='Kirjaudu ulos']    delay=2 s

    Wait For Condition    Text    Title   contains    Kirjautumissivu

