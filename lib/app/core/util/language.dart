import 'package:cmo_ferry/app/core/values/strings_manager.dart';
import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        // English
        'en_MM': {
          // Log In Screen
          'greetings': 'Welcome!',
          'logIn': 'Log in',
          'logInId': 'ID',
          'logInPassword': 'Password',
          'employeeIdErrorText': 'Please enter valid employee id.',
          'passwordErrorText': 'Please enter valid password.',
          'dataWrongErrorText': 'Your password or email is incorrect. Please try again or contact admin.',
          'dataBlankErrorText': 'Please enter valid input',

          // Settings Screen
          'privacyAndSecurity': 'Privacy And Security',
          'changePassword': 'Change Password',
          'language': 'Language',
          'changeLanguage': 'Change Language',

          // Navigation Screen
          'routePageLabel': 'Route',
          'informationPageLabel': 'Information',
          'leavePageLabel': 'Leave Management',
          'otherPageLabel': 'Other',
          'logOut': 'Log out',

          // Leaves Screen
          'driverLeave': 'Driver Leave',
          'vehicleLeave': 'Vehicle Leave',
          'status': 'Status',
          'rangeSpacer': 'to',

          // Profile
          'phoneNumber': 'Phone Number',
          'address': 'Address',
          'edit': 'Edit',

          // Change Password Screen
          'changePasswordAppBar': 'Change Password',
          'currentPassword': 'Current Password',
          'currentPasswordHint': 'Enter the current password',
          'newPassword': 'New Password',
          'newPasswordHint': 'Enter the new password',
          'newAgainPasswordHint': 'Enter the new password (again)',
          'changePasswordButton': 'Change',
          'minimumCharacterCount': 'At least Eight letters',
          'oneSmallLetter': 'One small letter',
          'oneCapitalLetter': 'One capital letter',
          'oneNumber': 'One number letter',
          'oneSpecialLetter': 'One special letter (e.g. - ! @ # \$)',
          'isMatch': 'Passwords match',

          // Ferry Status
          'ferryStatus': 'Ferry Status',
          'ferryStatusNone': 'There is no ferry status. ',
          'ferryStatusSubmitted': 'Your request was submitted. Please wait for admin to approve it.',
          'ferryStatusPending': 'Your request is pending. You will be added to a route shortly.',
          'ferryStatusRiding': 'You are riding ferry. ',

          'ferryStatusNoneSpanTap': 'Tap to request ferry.',
          'ferryStatusRidingSpanTap': 'Please tap to cancel.',

          // Other Page
          'services': 'Services',
          'aboutUs': 'About Us',
          'changeFerryStop': 'Change Stop',
          'feedback': 'Feedback',
          'theme': 'Theme',
          'detail': 'Detail',
          'validPhoneNumber': 'Please enter valid phone number.',
          'validAddress': 'Please enter valid address.',

          // Ferry stop change request
          'chooseFerryStop': 'Choose Ferry Stop',
          'township': 'Township',
          'road': 'Road,',
          'ferryStop': 'Ferry Stop',

          // AlertDialog
          'dialogConfirm': 'Confirm',
          'dialogEditConfirm': 'Confirm',
          'dialogCancel': 'Cancel',
          'logOutConfirmation': 'Are you sure you want to log out?',
          'dialogProfileEdit': 'Edit Profile',
          'areYouSureCheckIn': 'Are you sure you wish to check In?',
          'areYouSureCheckOut': 'Are you sure you wish to check out?',
          //leave request screen
          'Full Day': 'Full Day',
          'Reason of leave(optional)': 'Reason of leave(optional)',
          'Please choose the date and time you want to apply':
              'Please choose the date and time you want to apply',
          'Evening': 'Evening',
          'Morning': 'Morning',
          'Enter Date': 'Enter Date',
          'Submit': 'Submit',
          'leaveReason':'Reason Of Leave :',

          'Cancel': 'Cancel',
          //base route info
          'Vehicle Information': "Vehicle Information",
          'Bus Stop List': 'Bus Stop List',
          //change password screen
          'CurrentPassword': 'Current Password',
          'New Password': 'New Password',
          'Retype New Password': 'Retype New Password',
          'Password Change': 'Password Change',
          'Please input your new password': 'Please input your new password',
          'Please input your new password again':'Please input your new password again',
          'currentPasswordHints': 'Please input your current password',


          // Request Ferry
          'requestFerryPageLabel': 'Ferry Request',
          'requestFerry': 'Request  Ferry',
          'requestHistory': 'Histories',
          'chooseTownship': 'Choose Township',
          'chooseRoad': 'Choose Road',

          'cannotBeNull': 'cannot be empty. Please choose first.',
          'noFerryStop': 'There are no ferry stop for current location.',
          'chooseDate':'Choose Date',
  },

        // Burmese
        'my_MM': {
          //change password screen
          'currentPasswordHints': 'သင့်လက်ရှိ စကားဝှက်ကို ထည့်သွင်းပါ',

          'Please input your new password': 'သင့်စကားဝှက်အသစ်ကို ထည့်သွင်းပါ',
          'Please input your new password again':
              'သင့်စကားဝှက်အသစ်ကို ထပ်မံထည့်သွင်းပါ',
          'Password Change': 'စကားဝှက်ပြောင်းရန်',
          'Retype New Password': 'စကားဝှက်အသစ်ကို ပြန်ရိုက်ပါ',
          'Current Password': 'လက်ရှိစကားဝှက်',
          'New Password': 'စကားဝှက်အသစ်',
          //base route info
          'Vehicle Information': 'ယာဉ်အချက်အလက်',
          'Bus Stop List': 'ဘတ်စ်ကားမှတ်တိုင်စာရင်း',
          //leave request screen
          'Full Day': 'တစ်နေကုန်',
          'Reason of leave(optional)':
              'ထွက်ခွာရသည့် အကြောင်းရင်း (ချန်လှပ်ထားနိုင်သည်)',
          'Evening': 'ညနေ',
          'Submit': 'လုပ်မည်',
          'Cancel': 'မလုပ်တော့ပါ',
          'Morning': 'မနက်ခင်း',
          'Please choose the date and time you want to apply':
              'လျှောက်ထားလိုသော နေ့ရက်နှင့် အချိန်ကို ရွေးချယ်ပါ',
          'Enter Date': '‌ရက်စွဲထည့်ပါ',
          // Log In Screen
          'greetings': 'မင်္ဂလာပါ',
          'logIn': 'ဝင်မည်',
          'logInId': 'ဝန်ထမ်းနံပါတ်',
          'logInPassword': 'စကားဝှက်',

          // Settings Screen
          'privacyAndSecurity': 'ကိုယ်ရေးကိုယ်တာနှင့် လုံခြုံရေး',
          'changePassword': 'စကားဝှက်ပြောင်းလဲမည်',
          'language': 'ဘာသာစကား',
          'changeLanguage': 'ဘာသာစကားပြောင်းလဲမည်',

          // Navigation Screen

          'routePageLabel': 'လမ်းကြောင်း',
          'informationPageLabel': 'အချက်အလက်',
          'fullDay': 'တစ်နေကုန်',
          'evening': 'ညနေ',
          'morning': 'မနက်ခင်း',
          'leavePageLabel': 'ခွင့်',
          'otherPageLabel': 'အခြား',
          'logOut': 'ထွက်မည်',

          // Profile
          'name': 'အမည်',
          'phoneNumber': 'ဖုန်းနံပါတ်',
          'address': 'လိပ်စာ',
          'edit': 'ပြင်ရန်',
          //leave history
          'leaveReason':'ခွင့်ယူရခြင်းအကြောင်းရင်း',


          // Leaves Screen
          'driverLeave': 'ယာဥ်မောင်းခွင့်',
          'vehicleLeave': 'ယာဥ်ခွင့်',
          'status': 'အခြေအနေ',
          'rangeSpacer': 'မှ',

          // Change Password Screen
          'changePasswordAppBar': 'လက်ရှိစကားဝှက်ပြောင်းလဲရန်',
          'currentPassword': 'လက်ရှိစကားဝှက်',
          'currentPasswordHint': 'လက်ရှိစကားဝှက်ကို ရိုက်သွင်းပါ',
          'newPassword': 'စကားဝှက်အသစ်',
          'newPasswordHint': 'စကားဝှက်အသစ်ကို ရိုက်သွင်းပါ',
          'newAgainPasswordHint': 'စကားဝှက်အသစ်ကို ထပ်မံ၍ရိုက်သွင်းပါ',
          'changePasswordButton': 'ပြောင်းမည်',
          'minimumCharacterCount': 'စာလုံးရေအနည်းဆုံး ၈ လုံး',
          'oneSmallLetter': 'အက္ခရာအသေး ၁ လုံး',
          'oneCapitalLetter': 'အက္ခရာအကြီး ၁ လုံး',
          'oneNumber': 'ဂဏန်း ၁ လုံး',
          'oneSpecialLetter': 'သင်္ကေတ ၁ လုံး (ဥပမာ - ! @ # \$)',
          'isMatch': 'ကိုက်ညီသည်',

          // Ferry Status
          'ferryStatus': 'စီးနင်းမှု အခြေအနေ',
          'ferryStatusNone': 'စီးနင်းမှုအခြေအနေ အချက်အလက် မရှိပါ။ ',
          'ferryStatusSubmitted': 'သင်၏လျှောက်ထားမှုအား ပေးပို့ထားပါသည်။ ဆောင်ရွက်နေဆဲဖြစ်ပါသည်။',
          'ferryStatusPending': 'သင်၏လျှောက်ထားမှုအား လက်ခံပါသည်။ ဖယ်ရီလမ်းကြောင်းအား မကြာမီသတ်မှတ်ပေးပါမည်။',
          'ferryStatusRiding': 'ဖယ်ရီစီးနင်းနေပါသည်။',
          'ferryStatusNoneSpanTap': 'လျှောက်ထားရန် နှိပ်ပါ။',
          'ferryStatusRidingSpanTap': 'ရပ်တန့်ရန် နှိပ်ပါ။',


          // Other Page
          'services': 'ဝန်ဆောင်မှုများ',
          'changeFerryStop': 'မှတ်တိုင်ပြောင်းရန်',
          'aboutUs': 'App အကြောင်း',
          'feedback': 'အကြံပြုချက်များ',
          'theme': 'အပြင်အဆင်',
          'detail': 'အသေးစိတ်',
          'validPhoneNumber': 'မှန်ကန်သော ဖုန်းနံပါတ်ကို ထည့်ပါ။',
          'validAddress': 'မှန်ကန်သော လိပ်စာကို ထည့်ပါ။',
          // Ferry stop change request
          'chooseFerryStop': 'မှတ်တိုင်ရွေးချယ်ပါ။',
          'township': 'မြို့နယ်',
          'road': 'လမ်း,',
          'ferryStop': 'မှတ်တိုင်',

          // AlertDialog
          'dialogConfirm': 'သေချာပါသည်။',
          'dialogEditConfirm': 'ပြင်မည်။',
          'dialogCancel': 'မလုပ်တော့ပါ။',
          'logOutConfirmation': 'App မှထွက်ရန်သေချာပါသလား။',
          'dialogProfileEdit': 'Profile ပြင်ရန်',
          'areYouSureCheckIn': 'Check In ဝင်ချင်တာသေချာလား?',
          'areYouSureCheckOut': 'Check Out ဝင်ချင်တာသေချာလား?',

          // Request Ferry
          'requestFerryPageLabel': 'ဖယ်ရီလျှောက်ထားမှုများ',
          'requestFerry': 'ဖယ်ရီလျှောက်ထားရန်',
          'requestHistory': 'လျှောက်ထားမှုမှတ်တမ်းများ',
          'chooseTownship': 'မြို့နယ်ရွေးချယ်ပါ။‌',
          'chooseRoad': 'လမ်းရွေးချယ်ပါ။‌',

       'cannotBeNull': 'မရှိပါ။ ကျေးဇူးပြု၍ အရင်‌ရွေးချယ်ပါ။',
          'noFerryStop': 'မှတ်တိုင် မရှိပါ။',
          'chooseDate': 'ရက်ရွေးချယ်ပါ။‌',

          'successToast':'အောင်မြင်ပါသည်။'
        }
      };
}
