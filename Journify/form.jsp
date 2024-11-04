<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="form.css" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <title>FORM</title>
</head>
<body>
    <div class="container">
        <h1>Registration Form</h1>
        <form action="#" class="regform">
          <div class="input_box">
             <label>Name</label>
             <input type="text" placeholder="Enter Your Name" required>
          </div>
         <div class="input_box">
             <label>Email Adress</label>
             <input type="text" placeholder="Enter Email Adress" required>
         </div>
         <div class="column">
         <div class="input_box">
             <label>Phone Number</label>
             <input type="text" placeholder="Enter Phone Number" required>
         </div>

         <div class="input_box">
             <label>Birth Date</label>
             <input type="text" placeholder="Enter Your DOB" required>
         </div>
    </div>
    <div class="gender_box">
        <h1>GENDER</h1>
        <div class="gender_option">
        <div class="gender">
              <input type="radio" id="radio_box" name="Gender">
              <label for="check-male">Male</label>
        </div>
        <div class="gender">
              <input type="radio" id="radio_box" name="Gender">
              <label for="check-Female">Female</label>
        </div>
         <div class="gender">
              <input type="radio" id="radio_box" name="Gender">
              <label for="check-prefer">Prefer Not To Say</label>
         </div>
      </div>
      <div class="input_box">
        <label>Address</label>
        <input type="text" placeholder="Enter Street Address" required>
        <input type="text" placeholder="Enter Street Address" required>
        <div class="column">
            <div class="select_box">
                <select>
                    <option hidden>Country</option>
                    <option>India</option>
                    <option>Japan</option>
                    <option>Nepal</option>
                    <option>America</option>
                    <option>China</option>
                    <option>Europe</option>
                    <option>Africa</option>
                </select>
            </div>
        </div>
        <input type="text" placeholder="Enter Your City" required>
        <input type="text" placeholder="Enter Your Region" required>
        <input type="text" placeholder="Enter Pincode" required>
      </div>
    </div>

    <button>Submit</button>
        </form>
</body>
</html>