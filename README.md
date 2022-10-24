Create a scratch org:

```sh
cci flow run dev_org --org dev
```

Open the scratch org in the browser:

```sh
cci org browser --org dev
```

https://www.cloudwaale.com/post/how-to-create-public-rest-web-service-in-salesforce

After enabling sites:

```
[10/24/22 14:31:31] Found 33 changed components in the scratch org.
Profile: Admin
ApexClass: SiteLoginController
ApexClass: SiteLoginControllerTest
ApexClass: SiteRegisterController
ApexClass: SiteRegisterControllerTest
ApexClass: ChangePasswordController
ApexClass: ChangePasswordControllerTest
ApexClass: ForgotPasswordController
ApexClass: ForgotPasswordControllerTest
ApexClass: MyProfilePageController
ApexClass: MyProfilePageControllerTest
ApexPage: SiteRegister
ApexPage: ChangePassword
ApexPage: ForgotPassword
ApexPage: SiteLogin
ApexPage: ForgotPasswordConfirm
ApexPage: SiteRegisterConfirm
ApexPage: MyProfilePage
ApexPage: StdExceptionTemplate
ApexPage: SiteTemplate
ApexPage: FileNotFound
ApexPage: BandwidthExceeded
ApexPage: Exception
ApexPage: InMaintenance
ApexPage: Unauthorized
ApexPage: UnderConstruction
ApexPage: IdeasHome
ApexPage: AnswersHome
StaticResource: SiteSamples
ApexComponent: SitePoweredBy
ApexComponent: SiteHeader
ApexComponent: SiteFooter
ApexComponent: SiteLogin
```

After adding a site:
```
Found 35 changed components in the scratch org.
Profile: Public APIs Profile <---------------
Profile: Admin
ApexClass: SiteLoginController
ApexClass: SiteLoginControllerTest
ApexClass: SiteRegisterController
ApexClass: SiteRegisterControllerTest
ApexClass: ChangePasswordController
ApexClass: ChangePasswordControllerTest
ApexClass: ForgotPasswordController
ApexClass: ForgotPasswordControllerTest
ApexClass: MyProfilePageController
ApexClass: MyProfilePageControllerTest
ApexPage: SiteRegister
ApexPage: ChangePassword
ApexPage: ForgotPassword
ApexPage: SiteLogin
ApexPage: ForgotPasswordConfirm
ApexPage: SiteRegisterConfirm
ApexPage: MyProfilePage
ApexPage: StdExceptionTemplate
ApexPage: SiteTemplate
ApexPage: FileNotFound
ApexPage: BandwidthExceeded
ApexPage: Exception
ApexPage: InMaintenance
ApexPage: Unauthorized
ApexPage: UnderConstruction
ApexPage: IdeasHome
ApexPage: AnswersHome
StaticResource: SiteSamples
ApexComponent: SitePoweredBy
ApexComponent: SiteHeader
ApexComponent: SiteFooter
ApexComponent: SiteLogin
CustomSite: Public_APIs <---------------
```

After "Enabled Apex Class Access" adding "SalesRepAPI":

```
Found 35 changed components in the scratch org.
Profile: Public APIs Profile
Profile: Admin
ApexClass: SiteLoginController
ApexClass: SiteLoginControllerTest
ApexClass: SiteRegisterController
ApexClass: SiteRegisterControllerTest
ApexClass: ChangePasswordController
ApexClass: ChangePasswordControllerTest
ApexClass: ForgotPasswordController
ApexClass: ForgotPasswordControllerTest
ApexClass: MyProfilePageController
ApexClass: MyProfilePageControllerTest
ApexPage: SiteRegister
ApexPage: ChangePassword
ApexPage: ForgotPassword
ApexPage: SiteLogin
ApexPage: ForgotPasswordConfirm
ApexPage: SiteRegisterConfirm
ApexPage: MyProfilePage
ApexPage: StdExceptionTemplate
ApexPage: SiteTemplate
ApexPage: FileNotFound
ApexPage: BandwidthExceeded
ApexPage: Exception
ApexPage: InMaintenance
ApexPage: Unauthorized
ApexPage: UnderConstruction
ApexPage: IdeasHome
ApexPage: AnswersHome
StaticResource: SiteSamples
ApexComponent: SitePoweredBy
ApexComponent: SiteHeader
ApexComponent: SiteFooter
ApexComponent: SiteLogin
CustomSite: Public_APIs
```

_(BTW, "Enabled Visualforce Page Access" list is:)_

```
BandwidthExceeded	 
Exception	 
FileNotFound	 
ForgotPassword	 
ForgotPasswordConfirm	 
InMaintenance	 
SiteLogin	 
SiteRegister	 
SiteRegisterConfirm	 
SiteTemplate	 
Unauthorized
```