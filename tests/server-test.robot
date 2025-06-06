*** Settings ***
Library    Collections
Library    RequestsLibrary
Library     CryptoLibrary     variable_decryption=True

Suite Setup    Authenticate as Regular

*** Variables ***

${Username}    crypt:p7Wl4yv6DONY7nHE9vU9aSGZJUupaJqnwdbDOc/icmt9qrhPnEW7U3EURlLJfXBI/7wbPk+mSsxIxZ81qh//b8KOGhQ=
${Password}    crypt:SNsMiRq3+ZXKvNZV1JauH1zZ7iBOJagqrf8/QS7xJG/mwcsXtlXTuwn/09aY6q1uIm43m+6h5YOMXcQ=

*** Test Cases ***

*** Keywords ***
Authenticate as Regular

    ${body}    Create Dictionary    username=${Username}    password=${Password}
    ${response}    POST    url=http://127.0.0.1:3000/api/auth/kubios-login    json=${body}

    Should Contain    ${response.json()}[message]    Logged in successfully with Kubios
    Dictionary Should Contain Key    ${response.json()}  user

    ${token}    Set Variable    ${response.json()}[token]
    ${user_id}    Set Variable    ${response.json()}[user_id]
    #Log To Console   ${token}
    Set Suite Variable    ${token}
    Set Suite Variable    ${user_id}

*** Test Cases ***
Get User's Shifts

    ${header}    Create Dictionary    Authorization=Bearer ${token}
    ${response}    GET    http://127.0.0.1:3000/api/shifts/user/${user_id}    headers=${header}
    Status Should Be    200
    #Log To Console    ${response.json()}

Post A New Shift

    ${header}    Create Dictionary    Authorization=Bearer ${token}
    ${body}    Create Dictionary    user_id=${user_id}    start_date=2025-04-25    start_time=08:00    end_time=16:00    end_date=2025-04-25
    ${response}    POST    http://127.0.0.1:3000/api/shifts   headers=${header}   json=${body}
    Status Should Be    201

    Should Contain    ${response.json()}[message]    New shift created
    Dictionary Should Contain Key    ${response.json()}  shift_id
    #Log To Console    ${response.json()}

