//
//  Constants.swift


import Foundation
import UIKit





//stage
let API_BASE_URL = "https://33helpme.net/api/api/values/"

//https://33helpme.net/api/api/values/Getlocation?staffid=3
//https://33helpme.net/api/api/values/Getlocation?staffid=3
//stage
//let API_BASE_URL = "https://33helpme.net/api/api/values/"



// live
//let API_BASE_URL = ""
//let POLICY_BASE_URL  = ""
//let MERCHANT_ID = ""
//let Country_Code = "+1"

let login = API_BASE_URL+"LogStaff"
let SendAlerts = API_BASE_URL + "SendAlerts"
let Setlocation = API_BASE_URL + "Setlocation"
let GetPurposes = API_BASE_URL + "GetPurposes"
let SetPurpose = API_BASE_URL + "SetPurpose"
let DeleteLog = API_BASE_URL + "DeleteLog"


let SIGNUP_URL = API_BASE_URL+"signup"

let forgot_Password_Url = API_BASE_URL + "forgotPassword"
let checkOtpUrl = API_BASE_URL + "checkOTP"
let resetPassword = API_BASE_URL + "resetPassword"
let signup_URL = API_BASE_URL + "signup"
let getFactors_URL = API_BASE_URL + "getFactors"
let saveUserFactor_URL = API_BASE_URL + "saveUserFactor"
let getPositiveCognitions_URL = API_BASE_URL + "getPositiveCognitions"
let getNegativeCognitions_URL =  API_BASE_URL + "getNegativeCognitions"
let saveUserCognition_URL = API_BASE_URL + "saveUserCognition"
let socialLogin_URL = API_BASE_URL + "socialLogin"
let logout_URL = API_BASE_URL + "logout"
let getEmotions_URL = API_BASE_URL + "getEmotions"
let saveUserEmotion_URL = API_BASE_URL + "saveUserEmotion"
let get_EMDR_Configurations = API_BASE_URL + "getConfigurations"
let saveUserBackground = API_BASE_URL + "saveUserBackground"
let saveUserAudio_URL = API_BASE_URL + "saveUserAudio"

//let Social_Login_Url = API_BASE_URL+"social-login"
//let Verify_Otp = API_BASE_URL + "verify-otp"
//let Reset_Password = API_BASE_URL + "reset-password"
//let Logout_Url = API_BASE_URL + "logout"
//let Advertisement_List  =  API_BASE_URL + "advertisement-list"
//let Calculate_Price  =  API_BASE_URL + "calculate-price"
//let PreviousLocations  =  API_BASE_URL + "previous-locations"
//let ConfirmPickup = API_BASE_URL + "confirm-pickup"
//let profile   =  API_BASE_URL + "profile"
//let verifyEmail = API_BASE_URL + "verify-email"
//let editProfileUrl = API_BASE_URL + "edit-profile"
//let contactUrl = API_BASE_URL + "contact-us"
//let orderList = API_BASE_URL + "order-list"
//let changePassword = API_BASE_URL + "change-password"



let ImageExtention = ".jpeg"


let AlertMessage = "AlertMessage"
let SchoolId = "SchoolId"
let EmployeeId = "EmployeeId"
let Location = "Location"
let Name = "Name"
let SchoolCode = "SchoolCode"
let SchoolName = "SchoolName"
let StaffId = "StaffId"
let Device_Type = "2"
let Email = "Email"


//let INSTA_IMAGE_URl = "https://api.instagram.com/v1/users/self/media/recent/?access_token="


let INSTA_Self_URl = "https://api.instagram.com/v1/users/self/?access_token="

let appDelegate = UIApplication.shared.delegate as! AppDelegate

let titleLength = 100
let tilesPrice:Int16 = 6
let deliveryPrice:Int = 5

let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
let SCREEN_WIDTH = UIScreen.main.bounds.size.width



let enter_email_UserName  = "Please enter user name"
let enter_psw  = "Please enter password"

let NoInternetMsg = "The internet connection appears to be offline"
let enter_User_name  = "Please enter user name"
let enter_User_Valid_name  = "Username will start with the alphabet and the length of the username will be a minimum 3 characters and a maximum of 30 characters and you can use alphabet and numbers only"
let enter_valid_email  = "Please enter a valid email"
let enter_phone  = "Please enter Mobile number"

let enter_confirm_psw  = "Please enter Confirm Password"
let psw_must_same  = "Password and Confirm Password should be same"

let enter_email  = "Please enter email."
let pwdMsg = "A password must contain a lowercase letter, a uppercase letter, a special symbol and a digit and must be 8 to 30 characters in length"
let otpMsg = "Please enter One Time Password(OTP)"
let NegBel = "Please select negative belief"
let PosBel = "Please select Positive belief"

let SelectObject = "Please select the object"
let SelectObjectSize = "Please select the object size"
let SelectObjectPattern = "Please select the object pattern"
let SelectObjectDuration = "Please select the object duration"
let SelectObjectBack = "Please select the object background"

let SelectAudio = "Please select the audio file"



let agree_tc  = "Please check the terms of use and privacy policy"

let enter_phone_Valid  = "Invalid format for Mobile Number. Must start with \'+\' followed by country code of min 1 or max 4 digits, a space and then mobile number ranging from 7 to 10 digits e.g. '+1234 1234567890'."
let enter_No_Bottles  = "Please enter number of bottles."
let enter_No_Bottles_Max  = "Number of bottles should be greater than or equal to 20."
let full_Address = "Please enter full address"

let validEmailOrUserName = "enter correct username or emailid"



let MaxTiles = "User can select max 100 tiles at time"
let SelectTiles = "Please select a tiles first"
let enter_street_ads  = "Please enter street address"
let enter_city  = "Please enter city"
let enter_state  = "Please enter state"
let enter_zipcode  = "Please enter zipcode"
let enter_street_ads_2  = "Please enter street address 2"

let enter_current_psw  = "Please enter current password."
let enter_new_psw  = "Please enter new password."
let new_Conf_Pwd = "New password and Confirm password does not match."
let Conf_psw  = "Please enter Confirm password."
let logoutMsg = "Are you sure you want to logout?"
let currentNewPws = "Current password and New password cannot be same."
let phoneMsgContinue = "Phone number associated with this account is not verified yet. Do you want to verify it now?"
let PreandNewPws = "Previous password and new password cannot be same."


public func ShowHUD()
{
    
    
    let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
    if(window != nil){
       MBProgressHUD.showAdded(to: (window)!, animated: false)
    }
    
}

public func ShowHUDWithMsg()
{
    //let appDelegate1 = UIApplication.shared.delegate as! AppDelegate
      let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
    MBProgressHUD.showAdded(to: (window)!, animated: false)
}


public func RemoveHUD()
{
  //  let appDelegate1 = UIApplication.shared.delegate as! AppDelegate
    
     let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
    MBProgressHUD.hide(for: (window)!, animated: true)
}


//MARK: - Server Error Message Constants
struct serverError
{
    static let errorMsgGeneral                  = "Something went wrong. Please try again"
    static let errorMsgNoInternet               = "Please make sure your device is connected to the Internet"
    static let errorMsgServerDown               = "Server is not responding. Please try again later"
}


let deviceType = "2"
let deviceToken = UIDevice.current.identifierForVendor!.uuidString
let pushToken = "pushToken"
let appLanguage = "appLanguage"
