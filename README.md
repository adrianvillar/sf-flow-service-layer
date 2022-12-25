## What's in this codebase

See the blog post "[Use Subflow EVERYWHERE](https://katiekodes.com/subflow-service-layer-principles/)" for the reason this codebase exists.

* The Autolaunched Flow labeled "**Sales Rep Suggester**," which lives in "`/force-app/00_shared_subflow_main`" in this codebase, is used by both:
    * The "[build your own API endpoint inside of Salesforce](https://katiekodes.com/introduction-salesforce-rest-apis/#1--build-your-own-endpoint-inside-salesforce)" API endpoint supported by the Apex class "**SalesRepAPI**," which lives in "`/force-app/20_rest_api_main`" in this codebase.
    * The record-triggered flow labeled "**Account Assign Sugg Sales Rep Flow (TAF)**," which lives in "`/force-app/40_dml_triggered_main`" in this codebase.
        * _(Technically it's not a typical Salesforce record-triggered flow.  Technically it's also yet another Autolaunched Flow, and it's called by the "**AccountTrigger_TAF**" trigger and the "**TAF SAO Account**" custom metadata entry the "**TAF Account Assign Sugg Sales Rep FlwBI** custom metadata entry.)_

**Project idea:**  Enhance this codebase by adding some extra users to the scratch org and making the "**Sales Rep Suggester**" Flow more complex about which countries go to which sales rep.  Edit some Account records and validate that your changes take effect _(that `OwnerId` gets assigned correctly)_.

**Project idea:**  Enhance this codebase by adding another Autolaunched Flow labeled "**Contact Assign Sugg Sales Rep Flow (TAF)**," being sure to also add a "**TAF SAO Contact**" custom metadata entry and a "**TAF Contact Assign Sugg Sales Rep FlwBI** custom metadata entry.  Don't forget you'll have to change the new Flow to work with a `MailingCountry` instead of a `BillingCountry`.  Edit some Contact records and validate that your changes take effect _(that `OwnerId` gets assigned correctly based on the logic in "**Sales Rep Suggester**")_.

---

## How to create a scratch org from this codebase using CumulusCI:

1. Download a copy of this codebase to your computer.
2. With your computer's command prompt set to the folder into which you downloaded this codebase, run the following CumulusCI command-line command to create a scratch org:
    ```sh
    cci flow run dev_org --org feature
    ```
    * It should take a couple of minutes to set up, and you should see the following things occur in the output of running this command _(please **be sure to validate** that the "robot" tests and the "run_tests" tests pass)_:
        ```
        [12/25/22 08:20:08] Creating scratch org with command: sfdx force:org:create --json  -f orgs/feature.json -w 120 -n --durationdays 1 -a flow-service-layer-demo__feature
                            adminEmail=your-github-email@example.com
        [12/25/22 08:20:33] Created: OrgId: 00D123456789123, Username:scratch-org-username@example.com
                            Generating scratch org user password with command: sfdx force:user:password:generate -u scratch-org-username@example.com
        [12/25/22 08:20:37] ============================================================
                            Initializing flow: FlowCoordinator (dev_org)
                            Set up an org as a development environment for unmanaged metadata
                            ============================================================
        [12/25/22 08:21:35] ------------------------------------------------------------
                            Running task: create_community
                            ------------------------------------------------------------
        ...
        [12/25/22 08:22:21] Community 0DB987654321321 created
                            ------------------------------------------------------------
                            Running task: enable_sales_rep_api_class_on_public_apis_profile
                            ------------------------------------------------------------
        ...
                            Anonymous Apex Executed Successfully!
                            ------------------------------------------------------------
                            Running task: robot
                            ------------------------------------------------------------
        ...
        Tests.Sales Rep Api                                                   | PASS |
        1 test, 1 passed, 0 failed
        ...
        Tests.Sales Rep Api Unauthenticated                                   | PASS |
        1 test, 1 passed, 0 failed
        ==============================================================================
        Tests                                                                 | PASS |
        2 tests, 2 passed, 0 failed
        ==============================================================================
        ...
        [12/25/22 08:22:28] ------------------------------------------------------------
                            Running task: run_tests
                            ------------------------------------------------------------
        ...
                            --------------------------------------------------------------------------------
                            Pass: 93  Retried: 0  Fail: 0  CompileFail: 0  Skip: 0
                            --------------------------------------------------------------------------------
        ...
        [12/25/22 08:22:44] Completed flow 'dev_org' on org feature successfully!
        ```
3. If you'd like to poke around and see what's in this scratch org, open the scratch org in the browser with either of the following commands:
    * Either this CumulusCI command:
        ```sh
        cci org browser --org feature
        ```
        * _(If you want to open the scratch org in a specific browser, add "` --url-only`" to the end of the command and, after running it, and copy the URL to your clipboard from the command-line output.)_
    * Or this SFDX command:
        ```sh
        sfdx force:org:open -u flow-service-layer-demo__feature
        ```
        * _(If you want to open the scratch org in a specific browser, add "` -b chrome`," "` -b firefox`," etc. to the end of the command.)_
        * _(Alternatively, add "` -r`" to the end of the command and, after running it, and copy the URL to your clipboard from the command-line output.)_
4. To see the public API in action, if the URL your browser opened _(or the URL that "` --url-only`" or "` -r`" put into the command line)_ looks like "`https://12345.scratch.lightning.force.com/...`" or "`https://12345.scratch.my.salesforce.com/...`," make note of what actually appears in your URLs instead of "`12345`" and then visit this URL, of course replacing "`12345`" with your value from your scratch org:
    ```
    https://12345.scratch.my.site.com/services/apexrest/get_sales_rep`
    ```
    * **Validate** that the contents of this website look something like this _(should contain a Salesforce user ID starting with "`005`")_:
        ```xml
        <response>005987123654456987</response>
        ```
    * Note that you shouldn't even need to open this URL in the same browser that's already logged into your scratch org -- theoretically, you could visit it from a totally different browser in incognito mode and it would work, because it's a _**publicly available**_ URL for an "API" included with this codebase.
        * In fact, please **validate** that this is the case!
5. If you get stuck and need to delete your scratch org and start over, run the following CumulusCI command:
    ```sh
    cci org remove --org feature
    ```

---

## Misc. notes:

* Note that the two Apex classes under "`/force-app/40_dml_triggered_main/classes`" aren't even really used when you spin up a scratch org from this codebase.  They would be if "`Bypass_Execution__c`" in the custom metadata entry "**TAF Account Assign Sugg Sales Rep ApxBI**" weren't set to "`true`" -- but it is set to "`true`," because I want you to be impressed by the Flow, not the Apex.  These two classes are just artifacts of an earlier time when I wanted to validate that Mitch Spano's [Trigger Actions Framework](https://github.com/mitchspano/apex-trigger-actions-framework) package could delegate "trigger handling" to an Apex class or to an Autolaunched Flow with equal ease.
* https://www.cloudwaale.com/post/how-to-create-public-rest-web-service-in-salesforce
* https://salesforce.stackexchange.com/questions/378966/how-to-include-a-guest-user-license-profile-in-the-ci-for-a-digital-experience
* https://github.com/pgonzaleznetwork/sfdx-community-deployment

---