<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Registration Form</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" >
</head>
<body>
  <div class="container mt-5">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="card">
          <div class="card-header text-center">
            <h4>Registration Form</h4>
          </div>
          <div class="card-body">
            <form method="post">
              <div class="mb-3">
                <label for="firstName" class="form-label">First Name</label>
                <input type="text" class="form-control" id="firstName" name="firstName" required>
              </div>
              <div class="mb-3">
                <label for="lastName" class="form-label">Last Name</label>
                <input type="text" class="form-control" id="lastName" name="lastName" required>
              </div>

              <!-- Date of Birth -->
              <div class="mb-3">
                <label for="dob" class="form-label">Date of Birth</label>
                <input type="date" class="form-control" id="dob" name="dob" required>
              </div>

              <!-- Age -->
              <div class="mb-3">
                <label for="age" class="form-label">Age</label>
                <input type="number" class="form-control" id="age" name="age" required>
              </div>

              <!-- Email -->
              <div class="mb-3">
                <label for="email" class="form-label">Email address</label>
                <input type="text" class="form-control" id="email" name="email" required>
              </div>

              <!-- Username -->
              <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" class="form-control" id="username" name="userName" required>
              </div>

              <!-- Password -->
              <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
              </div>

              <!-- Submit Button -->
              <button type="submit" class="btn btn-primary w-100" name="submit">Register</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
<cfif structKeyExists(form,"submit")>
    <cfquery name="insertRegistrationDetails" datasource="myproj" result="res">
        INSERT INTO registrationDetails(firstName,lastName,dob,age,email,userName,password)
        VALUES (
            <cfqueryparam value="#form.firstName#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#form.lastName#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#form.dob#" cfsqltype="cf_sql_date">,
            <cfqueryparam value="#form.age#" cfsqltype="cf_sql_integer">,
            <cfqueryparam value="#form.email#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#form.userName#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#form.password#" cfsqltype="cf_sql_varchar">
        );

    </cfquery>
    <cfquery name="insertLoginDetails" datasource="myproj" result="loginRes">
        INSERT INTO loginDetails(userName,password) 
        VALUES (
            <cfqueryparam value="#form.userName#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#form.password#" cfsqltype="cf_sql_varchar">
        );
    </cfquery>
    <div class="text-center">
        <p>Data Inserted Successfully!</p>
    </div>
    
</cfif>
</html>
