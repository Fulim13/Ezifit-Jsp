

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<title>Add Product| EZIFIT</title>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <style>
            html{
                overflow: scroll;
                overflow-x: hidden;
            }
            ::-webkit-scrollbar {
                width: 0px;
            }
            ::webkit-scrollbar-thumb{
                background: #FF0000;
            }
            body{
                font-family: 'Arial narrow'; 
            }
            .header{
                font-family: 'Lucida Sans';   
                display: flex; 
                align-items: center; 
                justify-content: space-between; 
                margin: 25px;
            }
            .header span a{
                font-size: 40px; 
                font-weight: bold; 
                letter-spacing: 3px;
                color: black;
                text-decoration: none;
            } 
            .nav-link li{
                display: inline-block;
                margin: 0 13px;
                font-weight: 700; 
                font-size: 22px;
            }
            .nav-link li i{
                color: black;
            }
            .nav-link :hover{
                color: #8B0000;
            }
            .col-2{
                flex-basis: 100%;
                flex-basis: 100%;
                min-width: 300px;
                margin: 50px;
            }
            .col-2 h1{
                font-size: 25px;
                line-height: 0px;
                margin: 18px 0;
                font-family: 'Lucida Sans'; 
                border-bottom: solid;
                border-color: #8B0000;
                display: inline;
            }
            .col-3{
                flex-wrap: wrap;
                flex-basis: 100%;
                min-width: 300px;
                margin: 10px;
            }
            .col-3 h1{
                font-size: 15px;
                line-height: 0px;
                margin: 18px 0;
                font-family: 'Lucida Sans'; 
                text-align: right;
            }
            .col-3 h2{
                font-size: 14px;
                line-height: 2px;
                margin: 0;
                font-family: 'Lucida Sans'; 
                text-align: right;
            }
            .productreview{
                width: 80%;              
                border-collapse: collapse; 
                margin: 30px auto;  
                margin-bottom: 250px;
            }            
            .productreview td{
                border: none;
                vertical-align: top;
                padding: 40px 0px 20px 20px;
            }
            .productreview td:nth-child(2){
                border: solid;
                box-shadow: 15px 12px;
            }
            .orderReview{
                width: 55%;              
                border-collapse: collapse; 
                margin: 30px auto;   
                border: solid;
                box-shadow: 15px 12px;
                margin-bottom: 250px;
            }            
            .orderReview td{
                border: none;
                vertical-align: top;
                padding: 40px 0px 20px 20px;
            }
            .orderReview td:nth-child(2){
                border: solid;
                box-shadow: 15px 12px;
            }
            .cart{
                width: 40%;
            }
            .productreview img{
                width: 80%;
            }
            .descriptionC{                               
                vertical-align: top;
                margin-left: 30px;
            }
            .name{
                font-size: 30px;
                margin-bottom: 50px;
                margin-top: 5px;              
            }
            .descriptionC :nth-child(2), :nth-child(3), :nth-child(4){
                font-size: 18px;
                margin-bottom: 5px;
            }
            input.form-control:read-only {
                background-color: #fff;
            }
            .form{
                width: 100%;
            }   

            .input-box{
                margin-bottom: 15px;
                display: flex;
                align-items: center;
            }
            .input-box label{
                width: 200px;
                color:#757575;
                margin-right: 10px;
                font-size: 14px;
            }
            .input-box .form-control{
                width: 100%;
                outline: none;
                border: 1px solid #d5dbd9;
                font-size: 15px;
                padding: 8px 10px;
                border-right: 3px;
                transition: all 0.3s ease;
            }
            .input:focus{
                border: 1px solid #fec107;
            }
            .btn{
                width: 98%;
                padding: 8px 10px;
                font-size: 15px;
                border: 0;
                background: #8B0000;
                color: #fff;
                cursor: pointer;
                border-radius: 3px;
                outline: none;
                margin-top: 10px;
                margin-bottom: 10px;
            }
            .customerReview .form .input-box .btn:hover{
                background: black;
            }
            .orderReview .form .input-box .btn:hover{
                background: black;
            }
            .orderReview .btn{
                width: 95%;
                padding: px 10px;
                font-size: 15px;
                border: 0;
                background: #8B0000;
                color: #fff;
                cursor: pointer;
                border-radius: 3px;
                outline: none;
                margin-top: 10px;
                margin-left: 20px;
                margin-bottom: 10px;
            }
            .orderReview .input-box label{
                width: 200px;
                color:#757575;
                margin-right: 10px;
                margin-left: 20px;
                margin-top: 15px;
                font-size: 14px;
            }
            .orderReview .input-box .form-control{
                width: 100%;
                outline: none;
                border: 1px solid #d5dbd9;
                font-size: 15px;
                padding: 8px 10px;
                border-right: 3px;
                margin-top: 20px;
                transition: all 0.3s ease;
            }
            .feedback{
                font-size: 18px;
                padding: 20px 30px;
            }
            textarea.form-control:read-only {
                background-color: #fff;
            }
            textarea.form-control{
                width: 95%;
                outline: none;
                border: 2px solid #d5dbd9;
                font-size: 15px;
                padding: 8px 10px;
                border-right: 13px;
                transition: all 0.3s ease;
            }
            textarea.reply{
                width: 95%;
                outline: none;
                border: 2px solid #d5dbd9;
                font-size: 15px;
                padding: 8px 10px;
                border-right: 13px;
                transition: all 0.3s ease;
            }
            .date{
                margin: 15px 5px 0 1330px;
                font-size: 15px;
                font-style: inherit;
            }
        </style>
    </head>
    <body>
        <div class="header">            
            <span><a href="staffHomepage.jsp">EZIFIT</a></span>
            <ul class="nav-link">
                <li><a href="../LoadCheckIdentityStaff"><i class="fa fa-user"></i></a></li>
                <li><a href="logoutStaff.jsp"><i class="fa fa-sign-out"></i></a></li>                
            </ul>
        </div>
        <div class="col-3">
            <h1 style="color: #818589">" A good team is a greater action.</h1>
            <h2 text-align="right" style="color: #818589">Believe in your team ! "</h2>
            <p class="date"><span id="datetime"></span></p><script>var dt = new Date();
                document.getElementById("datetime").innerHTML = dt.toLocaleString();</script>  
        </div>

        <div class="col-2">

            <h1 style="color: #8B0000">ADD PRODUCT</h1>

        </div>
        <br>      <hr style="width: 97%">
        <div class="col-2">
            <h3>&nbsp;&nbsp;&nbsp;PRODUCT INFORMATION</h3>
        </div>

        <table class="productreview">
            <tr>
                
                <td class="customerReview">
              <form action="../AddProduct" method="post" enctype="multipart/form-data">
                                                
                        <div class="input-box">
                            <label class="details">Product Name</label>
                            <input type="text" class="form-control" name="prod_name"  required/>    
                        </div>

                        <div class="input-box">
                            <label class="details">Description</label>
                            <input type="text" class="form-control" name="description"  required/>    
                        </div>
                      
                      <div class="input-box">
                            <label class="details">Product Picture</label>
                            <input type="file" class="form-control" name="image" required/>    
                        </div>

                        <div class="input-box">
                            <label class="details">Price</label>                           
                            <input type="text" class="form-control" name="price"
                                   required/>    
                        </div>

                        <div class="input-box">
                            <label class="details">Quantity</label>
                            <input type="text" class="form-control" name="quantity"
                                   required/>    
                        </div>

                        <div class="input-box">
                            <label class="details">Weight</label>
                            <input type="text" class="form-control" name="weight"
                                  required />    
                        </div>

                        <div class="input-box">
                            <label class="details">Status</label>
                            <input type="text" class="form-control" name="status"
                     required />    
                        </div>

                        <div class="input-box">
                            <label class="details">Cost</label>
                            <input type="text" class="form-control" name="cost"
                      required />    
                        </div>
                        
                        <div class="input-box">
                            <label class="details">Size</label>
                            <input type="text" class="form-control" name="size"
                      required/>    
                        </div>
                        
                        <div class="input-box">
                            <label class="details">Category</label>
                            <input type="text" class="form-control" name="category"
                      required />    
                        </div>
                        
                       
                        
                        <div class="input-box">
                            <button type="submit" class="btn">ADD PRODUCT</button>
                        </div>
                    </form>
                </td>
            </tr>
            <br>
        </table>

    </body>
</html>







