# https://demoqa.com/utilities/weather/city/Delhi

*** Settings ***

Library     RequestsLibrary
Library     Collections

*** Variables ***

${base_url}     http://demoqa.com
${city}     Delhi


*** Test Cases ***

Get_weatherInfo
    create session  myssion    ${base_url}
    ${response}=    get request  myssion    /utilities/weather/city/${city}
    log to console  ${response.status_code}
    log to console  ${response.content}
    log to console  ${response.headers}

    # Validation
    ${status_code}=     convert to string    ${response.status_code}
    should be equal  ${status_code}     200

    ${body}=    convert to string   ${response.content}
    should contain  ${body}    Delhi

    ${contentTypeValue}=    get from dictionary  ${response.headers}    Content-Type
    should be equal  ${contentTypeValue}   application/json; charset=utf-8




