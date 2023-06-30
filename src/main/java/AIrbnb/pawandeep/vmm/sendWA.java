package AIrbnb.pawandeep.vmm;


import java.net.HttpURLConnection;
import java.net.URL;


public class sendWA {
   
    public static void sendWA(String phone , String message) {
       
        String mes = message.replace(" ", "%20");
        String api = "10f417ba7b184dc7820e066a9f5ad2ee";
        try {
           
        String apiUrl = "http://wapi.tagdigitalsolutions.com/wapp/api/send?apikey="+api+"&mobile="+phone+"&msg="+mes;
        
        
        URL url = new URL(apiUrl);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("GET");
        
        if(connection.getResponseCode()==200)
        {
           String res = new String(connection.getInputStream().readAllBytes());
            System.out.println("--->"+res);
        }
        
    }
        catch (Exception ex) 
        {
        ex.printStackTrace();
        
        }
    }
    
    
}
