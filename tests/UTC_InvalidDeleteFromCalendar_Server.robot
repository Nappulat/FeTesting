*** Settings ***
Documentation     Onnistunut sisäänkirjautuminen ja kalenterimerkintöjen epäonnistunut poistaminen taustapalvelimessa.
Library    Collections
Library    RequestsLibrary
Library     CryptoLibrary     variable_decryption=True

Suite Setup    Authenticate as Regular

*** Variables ***

${Username}    crypt:Rjv8RYjWPp72oh1mY1wAE/5lzYGPwGmMA+Av09jQ1gfGEA6wffCSNA8Fcr0LmquPMVaTP6ePNW2PDgkWJZu5Zmt3loU=
${Password}    crypt:oDNjvOw2FZFOo8kcHVJzgdRa4z2uT3QNjHzM/+eUXHladU7DzzwgNCpRMdP+ZQqe9ubpacwAg0Vpc0M=

*** Keywords ***
Authenticate as Regular

    ${body}    Create Dictionary    username=${Username}    password=${Password}
    ${response}    POST    url=http://127.0.0.1:3000/api/auth/kubios-login    json=${body}

    Should Contain    ${response.json()}[message]    Logged in successfully with Kubios
    Dictionary Should Contain Key    ${response.json()}  user

    ${token}    Set Variable    ${response.json()}[token]
    ${user_id}    Set Variable    ${response.json()}[user_id]

    Set Suite Variable    ${token}
    Set Suite Variable    ${user_id}

*** Test Cases ***

Delete a Shift Record

    ${header}    Create Dictionary    Authorization=Bearer ${token}
    ${response}    DELETE    http://localhost:3000/api/shifts/2   headers=${header}    expected_status=404
    Should Contain    ${response.json()}[message]    Shift not found

Delete an Exercise Record

    ${header}    Create Dictionary    Authorization=Bearer ${token}
    ${response}    DELETE    http://localhost:3000/api/exercise/2   headers=${header}    expected_status=404
    Should Contain    ${response.json()}[message]    Exercise not found

Delete a Sickness Record

    ${header}    Create Dictionary    Authorization=Bearer ${token}
    ${response}    DELETE    http://localhost:3000/api/sickness/2   headers=${header}    expected_status=404
    Should Contain    ${response.json()}[message]    Sickness record not found


Delete an Others Record

    ${header}    Create Dictionary    Authorization=Bearer ${token}
    ${response}    DELETE    http://localhost:3000/api/others/2   headers=${header}    expected_status=404
    Should Contain    ${response.json()}[message]    Others record not found
