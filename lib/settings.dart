
import 'package:google_lens_clone/enums/apiurl.dart';
import 'package:google_lens_clone/enums/enviroment.dart';

class Settings{


 static final CurrentVmsWebAPI = getApiUrl(Enviroment.Development,ApiUrl.VMSAPI);
 static final CurrentIdentityAPI = getApiUrl(Enviroment.Development,ApiUrl.IDENTITYAPI);

 //Production
 static const APIbaseUrl_production="";
 static const IDENTITYbaseUrl_production="";

//Development
 static const APIbaseUrl_development="http://192.168.0.114:45457/";
 static const IDENTITYbaseUrl_development="http://192.168.0.114:45455/";


 //StagingUrl
 static const APIbaseUrl_staging="https://vmswebapi-staging-as.azurewebsites.net/";
 static const IDENTITYbaseUrl_staging="https://vmsidentityapi-staging-as.azurewebsites.net";

 //AppUnique Identifier
static const AppUniqueIdentifier = "OptiResident";


//Access Token and Refresh Token key
static const  access_token = "access_token";
static const  refresh_token = "refresh_token";
static const  role ="Resident";

//Datetime format follow by whole app
static const datetime_format = "dd-MM-yyyy";
static const datetime_format_visitrequest = "d MMM yyy";
static int list_pagesize = 10;



static const default_username = "Raash Vision";




static String getApiUrl(Enviroment enviroment, ApiUrl whichapi) {

      String url;


       if (whichapi == ApiUrl.VMSAPI) {
            switch(enviroment) {

             case Enviroment.Development:{
              url = APIbaseUrl_development;
             }
             break;

             case Enviroment.Staging:{
              url = APIbaseUrl_staging;
             }
             break;

             case Enviroment.Production:{
              url = APIbaseUrl_production;
             }
             break;


            }

       }
       else {

            switch(enviroment) {

             case Enviroment.Development:{
              url = IDENTITYbaseUrl_development;
             }
             break;

             case Enviroment.Staging:{
              url = IDENTITYbaseUrl_staging;
             }
             break;

             case Enviroment.Production:{
              url = IDENTITYbaseUrl_production;
             }
             break;


            }
       }

       return url;
  }

}
