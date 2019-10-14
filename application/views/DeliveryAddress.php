<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Delivery Address</title>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>    
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="StyleSheet" type="text/css" href="<?php echo base_url()."assets/css/bootstrap.min.css"; ?>">
    <link rel="StyleSheet" type="text/css" href="<?php echo base_url()."assets/css/main.css"; ?>">
</head>
<body>
    <div class="container">
        <form style="width:40%; margin-left:25%; margin-top:2%;" action="<?php echo site_url('DeliveryApi/InsertAddress') ?>?id=1" method="post">
        <div class="form-group">
            <label for="customerAddress"><b>Customer Address</b></label>
            <textarea class="form-control rounded-0" id="customerAddress" rows="3" placeholder="Enter Your Address" name="customerAddress" required></textarea>
        </div>
        <div class="form-group">
            <label for="pincode"><b>Pincode</b></label>
            <input type="number" class="form-control" id="pincode" placeholder="Enter your pincode" name="deliveryPincode" required>
        </div>
        <div class="form-group">
            <label for="landmark"><b>Landmark</b></label>
            <input type="text" class="form-control" id="landmark" name="landmark" required>
        </div>
        <div class="form-group">
            <label for="mobileNumber"><b>Mobile Number</b></label>
            <input type="tel" class="form-control"  id="mobileNumber" onchange="unCheckBox();" name="mobileNumber" maxlength="10" minlength="10">
        </div>
        
        <div class="form-check">
            <input type="checkbox" class="form-check-input" id="signupMobileNumber" name="mobileNumber" checked>
            <label class="form-check-label" for="signupMobileNumber">Mobile Number used during signup</label>
        </div><p></p>
        <div class="form-group">
            <div class="form-check">
            <input class="form-check-input" type="radio"  id="workPlace" value="Workplace" name="deliverTo" checked>
            <label class="form-check-label" for="workPlace">
                <b>Workplace</b>
            </label>
            </div>
            <div class="form-check">
            <input class="form-check-input" type="radio"  id="home" value="Home" name="deliverTo">
            <label class="form-check-label" for="home">
                <b>Home</b>
            </label>
            </div>
            <div class="form-check">
            <input class="form-check-input" type="radio"  id="others" value="Other" name="deliverTo">
            <label class="form-check-label" for="others">
                <b>Other</b>
            </label>
            </div>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
    
    
</body>
<script>
    function unCheckBox()
    {
        document.getElementById("signupMobileNumber").checked = false;
    }
    if ($('#signupMobileNumber').is(":checked"))
    {
        // console.log("success");
        Retrieve();
        async function Retrieve()
        {
           
           var url = "<?php echo site_url('GetDeliveryApi/retrieveNumber')?>?q=1";
           request = await fetch(url);
           response = await request.json();
           console.log(response);
           $mobileValue = document.getElementById('signupMobileNumber');
           $mobileValue.value = response;
        }
    }

</script>
<script src="<?php echo base_url().'assets/js/bootstrap.min.js';?>"></script>
</html>