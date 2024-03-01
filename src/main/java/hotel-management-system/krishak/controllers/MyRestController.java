
package hotel-management-system.krishak.controllers;

//import com.mysql.cj.protocol.Resultset;
//import Airbnb.pawandeep.vmm.DBLoader;
//import hostlers.pawandeep.vmm.RDBMS_TO_JSON;
import hotel-management-system.krishak.vmm.DBLoader;
import hotel-management-system.krishak.vmm.RDBMS_TO_JSON;
import hotel-management-system.krishak.vmm.sendWA;
import jakarta.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
public class MyRestController {
    
    @PostMapping("/userSignup")
    public String userSignup(@RequestParam String username, @RequestParam String email ,@RequestParam String password, @RequestParam String contact , @RequestParam MultipartFile photo) throws Exception
    {
        System.out.println("Rest Controller");
        String ans = "";
        ResultSet rs = DBLoader.executeSQL("select * from users where email ='"+email+"' ");
        if(rs.next()){
            ans = "already present id";
        }else{
            
            
            File f = new File("src\\main\\webapp\\myuploads\\" + photo.getOriginalFilename());
            byte b[] = photo.getBytes();
            FileOutputStream fos = new FileOutputStream(f);
            fos.write(b);
            fos.close();
            
            rs.moveToInsertRow();
            rs.updateString("username", username);
            rs.updateString("email", email);
             rs.updateString("password", password);
              rs.updateString("phoneNumber", contact);
            
            rs.updateString("photo", "../myuploads/" + photo.getOriginalFilename());
            rs.insertRow();
            
            ans = "success";
        }
        return ans;
    }
    
    @PostMapping("/userShowCities")
    public String userShowCities(){
        
        String ans ="";
        
        ans = new RDBMS_TO_JSON().generateJSON("select * from cities");
        
        return ans;
    
        
    }
    
    @PostMapping("/userShowAllAirbnbs")
    public String userShowAllAirbnbs(@RequestParam String cityid){
        System.out.println(cityid);
        
        String ans;
        
        ans = new RDBMS_TO_JSON().generateJSON("select * from properties where cityid = '"+cityid+"' and owneremail in (select owneremail from owner where status = 'Approved' ); ");
        
        return ans;
    }
    @PostMapping("/userShowSingleAirbnbDetails")
    public String userShowSingleAirbnbDetails(@RequestParam String detailid){
        System.out.println(detailid);
        
        String ans;
        
        ans = new RDBMS_TO_JSON().generateJSON("select * from properties where detailid = '"+detailid+"'");
        
        return ans;
    }
     @PostMapping("/showPhotos")
    public String showPhotos(@RequestParam String detailid){
        System.out.println(detailid);
        
        String ans;
        
        ans = new RDBMS_TO_JSON().generateJSON("select * from property_photos where detailid = '"+detailid+"'");
        
        return ans;
    }
    @PostMapping("/UserLogin")
    public String UserLogin(@RequestParam String email ,@RequestParam String password, HttpSession session) throws Exception
    {
        System.out.println("Rest Controller");
        String ans = "";
        ResultSet rs = DBLoader.executeSQL("select * from users where email ='"+email+"' and password ='"+password+"' ");
        if(rs.next()){
            session.setAttribute("useremail",email);
             ans = "success";
        }else{  
 
            ans = "fail";
        }
        return ans;
    }
    @PostMapping("/onlinepayment")
    public String SelectModeOfPayment(@RequestParam String detailid, @RequestParam String stdate, @RequestParam String enddate, @RequestParam String grandtotal,HttpSession session) throws Exception
    {
       
        String ans = "";   
        String address="";
        String owneremail="";
        String phoneno ="";
        
        
        String useremail = (String) session.getAttribute("useremail");
        ResultSet rs10 = DBLoader.executeSQL("select phoneNumber from users where email ='"+useremail+"' ");
        if(rs10.next()){
            phoneno = rs10.getString("phoneNumber");
        }
        
        ResultSet rs2 = DBLoader.executeSQL("select * from properties where detailid='"+detailid+"' ");
        
        if(rs2.next()){
            address = rs2.getString("address");
            owneremail = rs2.getString("owneremail");
        }
        
        ResultSet rs = DBLoader.executeSQL("select * from payment");
        
                
                rs.moveToInsertRow();
                rs.updateString("detailid", detailid);
                rs.updateString("totalprice", grandtotal);
                rs.updateString("start_date", stdate);
                rs.updateString("end_date", enddate);
                rs.updateString("useremail",(String) session.getAttribute("useremail"));
                rs.updateString("owneremail", owneremail);
                rs.updateString("address", address);
                rs.updateString("payment_type", "ONLINE");
                rs.insertRow();
                int paymentid = 0;
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");
            LocalDate ldStartDate = LocalDate.parse(stdate, formatter);
            LocalDate ldEndDate = LocalDate.parse(enddate, formatter);

            ResultSet rs3 = DBLoader.executeSQL("select max(payment_id) from payment");
            if (rs3.next()) {
                paymentid = rs3.getInt("max(payment_id)");
                System.out.println(paymentid);
            }

            for (LocalDate date = ldStartDate; date.isBefore(ldEndDate); date = date.plusDays(1)) {
                System.out.println("Date: " + date.toString());
                ResultSet rs4 = DBLoader.executeSQL("select * from payment_detail");
                rs4.moveToInsertRow();
                rs4.updateString("start_per_date", date.format(formatter));
                rs4.updateString("end_per_date", date.plusDays(1).format(formatter));
                rs4.updateInt("payment_id", paymentid);
                rs4.insertRow();
            }
                ans = "success";
                
//                sendWA.sendWA(phoneno,"Payment Done Sussessfully. Your Payment-ID is ="+paymentid+" this. Your Start Date is "+stdate+" and End Date is "+enddate+". "
//                      + "Your Grandtotal is "+grandtotal+" Rupees. Property Owner Email is "+owneremail+" and You have Booked Property at "+address+". You have made online payment.");
              
        return ans;
    }
     @PostMapping("/cashpayment")
    public String SelectModeOfPayment1(@RequestParam String detailid, @RequestParam String stdate, @RequestParam String enddate, @RequestParam String grandtotal,HttpSession session) throws Exception
    {
       
        String ans = "";   
        String address="";
        String owneremail="";
        
        String useremail = (String) session.getAttribute("useremail");
        System.out.println("1---->"+useremail);
        String phoneno ="";
        try{
        
        ResultSet rs10 = DBLoader.executeSQL("select phoneNumber from users where email ='"+useremail+"' ");
        if(rs10.next()){
            phoneno = rs10.getString("phoneNumber");
        }
        System.out.println(phoneno);
        
        ResultSet rs2 = DBLoader.executeSQL("select * from properties where detailid='"+detailid+"' ");
        
        if(rs2.next()){
            address = rs2.getString("address");
            owneremail = rs2.getString("owneremail");
        }
        
        ResultSet rs = DBLoader.executeSQL("select * from payment");
        
                
                rs.moveToInsertRow();
                rs.updateString("detailid", detailid);
                rs.updateString("totalprice", grandtotal);
                rs.updateString("start_date", stdate);
                rs.updateString("end_date", enddate);
                rs.updateString("useremail",useremail);
                rs.updateString("owneremail", owneremail);
                rs.updateString("address", address);
                rs.updateString("payment_type", "CASH");
                rs.insertRow();
                  int paymentid = 0;
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");
            LocalDate ldStartDate = LocalDate.parse(stdate, formatter);
            LocalDate ldEndDate = LocalDate.parse(enddate, formatter);

            ResultSet rs3 = DBLoader.executeSQL("select max(payment_id) from payment");
            if (rs3.next()) {
                paymentid = rs3.getInt("max(payment_id)");
                System.out.println(paymentid);
            }

            for (LocalDate date = ldStartDate; date.isBefore(ldEndDate); date = date.plusDays(1)) {
                System.out.println("Date: " + date.toString());
                ResultSet rs4 = DBLoader.executeSQL("select * from payment_detail");
                rs4.moveToInsertRow();
                rs4.updateString("start_per_date", date.format(formatter));
                rs4.updateString("end_per_date", date.plusDays(1).format(formatter));
                rs4.updateInt("payment_id", paymentid);
                rs4.insertRow();
            }
            
            System.out.println(phoneno);
                ans = "success";
//                
//              sendWA.sendWA(phoneno,"Payment Done Sussessfully. Your Payment-ID is ="+paymentid+" this. Your Start Date is "+stdate+" and End Date is "+enddate+". "
//                      + "Your Grandtotal is "+grandtotal+" Rupees. Property Owner Email is "+owneremail+" and You have Booked Property at "+address+". you have made cash payment.");
        
        }catch(Exception e){
            e.toString();
        }
        return ans;
    }
     @PostMapping("/OwnerSignup")
    public String OwnerSignup(@RequestParam String ownername, @RequestParam String owneremail ,@RequestParam String airbnbname,@RequestParam String password, @RequestParam int cityid, @RequestParam String contact , @RequestParam MultipartFile photo) throws Exception
    {
        System.out.println("Rest Controller");
        String ans = "";
      
        String status = "Approved";
        
        ResultSet rs = DBLoader.executeSQL("select * from owner where owneremail ='"+owneremail+"' ");
        if(rs.next()){
            ans = "fail";
        }else{
            
            
            File f = new File("src\\main\\webapp\\myuploads\\" + photo.getOriginalFilename());
            byte b[] = photo.getBytes();
            FileOutputStream fos = new FileOutputStream(f);
            fos.write(b);
            fos.close();
            
            rs.moveToInsertRow();
            rs.updateString("ownername", ownername);
            rs.updateString("owneremail", owneremail);
             rs.updateString("password", password);
             rs.updateString("airbnbname", airbnbname);
               rs.updateString("status", status);
              rs.updateString("phoneNumber", contact);
                rs.updateInt("cityid", cityid);
            
            rs.updateString("photo", "../MyUploads/" + photo.getOriginalFilename());
            rs.insertRow();
            
            ans = "success";
        }
        return ans;
    }
        @PostMapping("/OwnerShowCitiesServlet")
    public String OwnerShowCitiesServlet(){
        
        String ans;
        
        ans = new RDBMS_TO_JSON().generateJSON("select * from cities");
        
        return ans;
    }
     @PostMapping("/OwnerLogin")
     public String OwnerLogin(@RequestParam String owneremail ,@RequestParam String password, HttpSession session) throws Exception
    {
        System.out.println("Rest Controller");
        String ans = "";
        ResultSet rs = DBLoader.executeSQL("select * from owner where owneremail ='"+owneremail+"' and password ='"+password+"' ");
        if(rs.next()){
            session.setAttribute("owneremail",owneremail);
             ans = "success";
        }else{  
 
            ans = "fail";
        }
        return ans;
    }
      @PostMapping("/OwnerManageProperties")
    public String OwnerManageProperties(@RequestParam String price,@RequestParam String propertytype, @RequestParam String offerprice ,@RequestParam String address, @RequestParam String description , @RequestParam MultipartFile photo, HttpSession session) throws Exception
    {
        System.out.println("Rest Controller");
        String ans = "";
        String airbnbname="";
                int cityid=0;
      String owneremail =(String) session.getAttribute("owneremail");
      try{
         ResultSet rs4 = DBLoader.executeSQL("select * from owner where owneremail='"+owneremail+"'");
        if(rs4.next()){
               cityid= rs4.getInt("cityid");
               airbnbname=rs4.getString("airbnbname");
        }
        ResultSet rs = DBLoader.executeSQL("select * from properties");
        
            
            File f = new File("src\\main\\webapp\\myuploads\\" + photo.getOriginalFilename());
            byte b[] = photo.getBytes();
            FileOutputStream fos = new FileOutputStream(f);
            fos.write(b);
            fos.close();
            
            rs.moveToInsertRow();
            rs.updateString("owneremail", owneremail);
             rs.updateString("propertytype",propertytype);
            rs.updateString("price", price);
            rs.updateString("offerprice", offerprice);
            rs.updateString("description", description);
            rs.updateString("airbnbname", airbnbname);
            rs.updateString("address", address);
            rs.updateInt("cityid", cityid);
            rs.updateString("photo", "../MyUploads/" + photo.getOriginalFilename());
            rs.insertRow();
            
            ans = "success";
        
        
      }catch(Exception e){
          e.toString();
      }
      return ans;
    }
        @PostMapping("/OwnerPropertyTypeServlet")
    public String OwnerPropertyTypeServlett(){
        
        String ans;
        
        ans = new RDBMS_TO_JSON().generateJSON("select * from property_type");
        
        return ans;
    }
        @PostMapping("/OwnerShowPropertiesServlet")
    public String OwnerShowPropertiesServlet(HttpSession session){
        
        String ans;
        String owneremail =(String) session.getAttribute("owneremail");
        
        ans = new RDBMS_TO_JSON().generateJSON("select * from properties where owneremail='"+owneremail+"' ");
        
        return ans;
    }
    
    @PostMapping("/deleteProperty")
    public String deleteProperty(@RequestParam String detailid) throws Exception 
    {
        String ans="";
        ResultSet rs = DBLoader.executeSQL("select * from properties where detailid ='"+detailid+"' ");
        if(rs.next()){
            rs.deleteRow();
            ans = "success";
        }
        return ans;
    }
     @PostMapping("/OwnerManageBookings")
    public String OwnerManageBookings(HttpSession session) throws Exception 
    {
      String ans;
      String owneremail =(String) session.getAttribute("owneremail");
         ans = new RDBMS_TO_JSON().generateJSON("select * from payment where owneremail='"+owneremail+"' ");
        return ans;
    }
      @PostMapping("/OwnerEditProperties")
    public String OwnerEditProperties(HttpSession session) throws Exception 
    {
      String ans;
      String owneremail =(String) session.getAttribute("owneremail");
         ans = new RDBMS_TO_JSON().generateJSON("select * from properties where owneremail='"+owneremail+"' ");
        return ans;
    }
     @PostMapping("/prefilledData")
       public String prefilledData(@RequestParam String detailid) {
        return new RDBMS_TO_JSON().generateJSON("select * from properties where detailid ='"+ detailid+"' ");
    }

       @PostMapping("/UpdateProfile")
     public String UpdateProfile(@RequestParam String detailid,@RequestParam String description,@RequestParam String price,@RequestParam String offerprice) throws Exception 
    {
        String ans="";
          ResultSet rs = DBLoader.executeSQL("select * from properties where detailid ='"+detailid+"' ");
            if (rs.next()) {
            rs.updateString("description", description);
            rs.updateString("price", price);
            rs.updateString("offerprice", offerprice);
            rs.updateRow();

            ans = "success";
        }
        return ans;
    }
     
     @PostMapping("/AdminLogin")
     public String AdminLogin(@RequestParam String adminemail ,@RequestParam String password, HttpSession session) throws Exception
    {
        System.out.println("Rest Controller");
        String ans = "";
        ResultSet rs = DBLoader.executeSQL("select * from admin where adminemail ='"+adminemail+"' and password ='"+password+"' ");
        if(rs.next()){
            session.setAttribute("adminemail",adminemail);
             ans = "success";
        }else{  
 
            ans = "fail";
        }
        return ans;
    }
        @PostMapping("/citiesdetail")
    public String citiesdetail(@RequestParam String description,@RequestParam String cityname, @RequestParam MultipartFile photo) throws Exception
    {
     
        String ans = "";
     try{
        ResultSet rs = DBLoader.executeSQL("select * from cities");
        
            
            File f = new File("src\\main\\webapp\\myuploads\\" + photo.getOriginalFilename());
            byte b[] = photo.getBytes();
            FileOutputStream fos = new FileOutputStream(f);
            fos.write(b);
            fos.close();
            
            rs.moveToInsertRow();
            rs.updateString("cityname", cityname);
       
            rs.updateString("description", description);
      
            rs.updateString("photo", "../MyUploads/" + photo.getOriginalFilename());
            rs.insertRow();
            
            ans = "success";
        
        
      }catch(Exception e){
          e.toString();
      }
      return ans;
    }
        @PostMapping("/AdminPropertyTypeServlet")
    public String AdminPropertyTypeServlett(){
        
        String ans;
        
        ans = new RDBMS_TO_JSON().generateJSON("select * from cities");
        
        return ans;
    }
      @PostMapping("/deletecity")
    public String deletecity(@RequestParam String id) throws Exception 
    {
        String ans="";
        ResultSet rs = DBLoader.executeSQL("select * from cities where id ='"+id+"' ");
        if(rs.next()){
            rs.deleteRow();
            ans = "success";
        }
        return ans;
    }
        @PostMapping("/propertydetail")
    public String propertydetail(@RequestParam String property_type_name,@RequestParam String description, @RequestParam MultipartFile photo) throws Exception
    {
     
        String ans = "";
     try{
        ResultSet rs = DBLoader.executeSQL("select * from property_type");
        
            
            File f = new File("src\\main\\webapp\\myuploads\\" + photo.getOriginalFilename());
            byte b[] = photo.getBytes();
            FileOutputStream fos = new FileOutputStream(f);
            fos.write(b);
            fos.close();
            
            rs.moveToInsertRow();
            rs.updateString("property_type_name", property_type_name);
       
            rs.updateString("description", description);
      
            rs.updateString("photo", "../MyUploads/" + photo.getOriginalFilename());
            rs.insertRow();
            
            ans = "success";
        
        
      }catch(Exception e){
          e.toString();
      }
      return ans;
    }
        @PostMapping("/AdminPropertyType")
    public String AdminPropertyType(){
        
        String ans;
        
        ans = new RDBMS_TO_JSON().generateJSON("select * from property_type");
        
        return ans;
    }
      @PostMapping("/Adminremovecity")
    public String Adminremovecity(@RequestParam String property_type_name ) throws Exception 
    {
        String ans="";
        ResultSet rs = DBLoader.executeSQL("select * from property_type where property_type_name ='"+property_type_name+"' ");
        if(rs.next()){
            rs.deleteRow();
            ans = "success";
        }
        return ans;
    }
    @PostMapping("/ApproveOwner")
    public String ApproveOwner(@RequestParam String owneremail) throws Exception {
        String ans = "";
        ResultSet rs = DBLoader.executeSQL("select * from owner where owneremail ='"+owneremail+"' ");
        if (rs.next()) 
        {
            rs.updateString("status", "Approved");
            rs.updateRow();

            ans = "success";
        }
        return ans;
}
    @PostMapping("/BlockOwner")
    public String PendingOwner(@RequestParam String owneremail) throws Exception {
        String ans = "";
        ResultSet rs = DBLoader.executeSQL("select * from owner where owneremail = '" + owneremail + "' ");
        if (rs.next()) 
        {
            rs.updateString("status", "Pending");
            rs.updateRow();

            ans = "success";
        }
        return ans;
}
@PostMapping("/admin_manageOwner")
    public String ownerDetail() {
        String ans = new RDBMS_TO_JSON().generateJSON("select * from owner");
        return ans;
    }
         @PostMapping("/AddPhotos")
    public String AddPhotos(@RequestParam String detailid, @RequestParam MultipartFile photo) throws Exception
    {
     
        String ans = "";
     try{
        ResultSet rs = DBLoader.executeSQL("select * from property_photos where detailid ='"+detailid+"' ");
        
            
            File f = new File("src\\main\\webapp\\myuploads\\" + photo.getOriginalFilename());
            byte b[] = photo.getBytes();
            FileOutputStream fos = new FileOutputStream(f);
            fos.write(b);
            fos.close();
            
            rs.moveToInsertRow();
            rs.updateString("detailid",detailid);

            rs.updateString("photo", "../MyUploads/" + photo.getOriginalFilename());
            rs.insertRow();
            
            ans = "success";
        
        
      }catch(Exception e){
          e.toString();
      }
      return ans;
    }
        @PostMapping("/AdminShowPhotoServlet")
    public String AdminShowPhotoServlet(@RequestParam int detailid){
        
            System.out.println(detailid);
        
        String ans;
        
        ans = new RDBMS_TO_JSON().generateJSON("select * from property_photos where detailid = '"+detailid+"' ");
        
        return ans;
    }
     @PostMapping("/deletePhoto")
     public String deletePhoto(@RequestParam String photoid) throws Exception 
    {
        String ans="";
        ResultSet rs = DBLoader.executeSQL("select * from property_photos where photoid ='"+photoid+"' ");
        if(rs.next()){
            rs.deleteRow();
            ans = "success";
        }
        return ans;
    }
      @PostMapping("/userManageBookings")
    public String useManageBookings(HttpSession session) throws Exception 
    {
      String ans;
      String useremail =(String) session.getAttribute("useremail");
         ans = new RDBMS_TO_JSON().generateJSON("select * from payment where useremail='"+useremail+"' ");
        return ans;
    }
    
    
    
    @PostMapping("/UserCheckDatesServlet")
    public String UserCheckDatesServlet(@RequestParam int detailid, @RequestParam String startdate, @RequestParam String enddate) throws Exception {
        int paymentid = 0;

        int flag = 1;

        ResultSet rs2 = DBLoader.executeSQL("select payment_id from payment where detailid='" + detailid + "' ");
        while (rs2.next()) {
            System.out.println("Inside RS2");
            paymentid = rs2.getInt("payment_id");

            System.out.println("Payment id is -" + paymentid);
            ResultSet rs3 = DBLoader.executeSQL("select * from payment_detail where payment_id='" + paymentid + "' ");

            while (rs3.next()) {
                if (startdate.equals(rs3.getString("start_per_date")) || enddate.equals(rs3.getString("end_per_date"))) {
                    System.out.println("Inside RS3 IF");
                    flag = 0;
                    break;
                } else {
                    flag = 1;
                }
            }

            if (flag == 0) {
                break;
            }
        }

        if (flag == 0) {
            System.out.println("False");
            return "false";
        } else {
            System.out.println("Success");

            return "success";
        }
    }
    
    
    
    
    }
   

