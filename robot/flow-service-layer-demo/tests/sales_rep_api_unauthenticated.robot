# Run Command:  cci task run robot -o suites robot/tests/sales_rep_api.robot

*** Settings ***

Resource              cumulusci/robotframework/Salesforce.robot
Library               RequestsLibrary



*** Variables ***

# Request Methods
${GET} =                 Get On Session

# Response Codes
${CODE_OK} =             200
${CODE_BAD_REQUEST} =    400
${CODE_UNAUTHORIZED} =   401
${CODE_NOT_FOUND} =      404
${CODE_SERVER_ERROR} =   500

# Tokens
${ACCESS_TOKEN} =        will_be_replaced

# Bodies
${GOOD_BODY} =                      {"good":["body"]}

# URLs
${GOOD_BASE_URL} =                  /services/apexrest/get_sales_rep

# Responses
${SUCCESS} =                        005


*** Keywords ***

Get Salesforce Org Access
  [Documentation]
  ...                    Get Salesforce Org Access Token and Instance URL.
  ...                    Sets both as Global Variables.
  ${orginfo}=                   Get Org Info
  ${instance_url} =           Get From Dictionary        ${org_info}
  ...                         instance_url
  ${instance_url} =           Set Suite Variable         ${instance_url}
  ${access_token} =           Get From Dictionary        ${org_info}
  ...                         access_token
  ${access_token} =           Set Suite Variable         ${access_token}

Check For Access Token
  [Documentation]
  ...              Checks for existing Salesforce Org Access Token.
  ...              If missing it runs Get Salesforce Org Access Token.
  ...              Required parameters are:
  ...
  ...              |   access_token    |   access token for salesforce org   |
  [Arguments]                   ${access_token}
  Run Keyword If                '${access_token}' == 'will_be_replaced'
  ...                           Get Salesforce Org Access

Create Request
  [Documentation]
  ...              Creates a request an returns the response.
  ...              Required parameters are:
  ...
  ...              |   method       |   request method Ex: GET,POST,PUT   |
  ...              |   access_token |   access token for salesforce org   |
  ...              |   base_url     |   request url   |
  ...              |   body         |   request body   |
  [Arguments]                   ${method}                  ${access_token}                         ${base_url}                             ${body}
  Check For Access Token        ${access_token}
  ${better_url} =               Replace String             ${INSTANCE_URL}                         salesforce                              site
  Create Session                Baseurl                    ${better_url}
  ${response}=                  Run Keyword                ${method}                               Baseurl
  ...                           ${base_url}                data=${body}
  Set Suite Variable            ${response}                ${response}
  Log                           ${response}                console=yes

Validate Response
  [Documentation]
  ...              Validates a request's response with a provided response code and body.
  ...              Required parameters are:
  ...
  ...              |   response   |   request's response to be validated   |
  ...              |   code       |   code to validate against Ex: 200,400,404   |
  ...              |   body_part  |   body excerpt to validate against   |
  [Arguments]                   ${response}                ${code}                                 ${body_part}
  ${res_body}=                  Convert To String          ${response.content}
  Log                           ${res_body}                console=yes
  Should Be Equal As Strings    ${response.status_code}    ${code}
  Should Contain                ${res_body}                ${body_part}

GET Good Token, Good URL, and Good Body
  Create Request                    ${GET}              ${ACCESS_TOKEN}          ${GOOD_BASE_URL}         ${GOOD_BODY}

Verify Successful Response
  Validate Response                 ${response}          ${CODE_OK}               ${SUCCESS}


*** Test Cases ***

1. GET - SUCCESS
  GET Good Token, Good URL, and Good Body
  Verify Successful Response