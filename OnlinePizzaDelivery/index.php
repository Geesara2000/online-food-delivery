<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    <title>Home</title>
    <link rel = "icon" href ="img/logo.jpg" type = "image/x-icon">
  </head>
<body>
  <?php include 'partials/_dbconnect.php';?>
  <?php require 'partials/_nav.php' ?>

  <style>
    body{
      background-color: black;
    }
  </style>
  
  <!-- Category container starts here -->
  <div class="container my-3 mb-5">
  <div class="col-lg-4 text-center  text-light my-3" style="margin:auto;border-top: 2px ;border-bottom: 4px groove black">    
      <h1 class="text-center"> MENU </h1>
    </div>
    <div class="row">
      <!-- Fetch all the categories and use a loop to iterate through categories -->
      <?php 
        $sql = "SELECT * FROM `categories`"; 
        $result = mysqli_query($conn, $sql);
        while($row = mysqli_fetch_assoc($result)){
          $id = $row['categorieId'];
          $cat = $row['categorieName'];
          $desc = $row['categorieDesc'];
          echo '<div class="col-xs-3 col-sm-3 col-md-3">
                  <div class="card bg-transparent" style="width: 17rem; ">
                  <a href="viewPizzaList.php?catid=' . $id . '">
                    <img src="img/card-'.$id. '.jpg" class="card-img-top"  alt="image for this category" width="266px" height="250px"></a>
                    <div class="card-body"  >
                      <h5 class="card-title" ><a href="viewPizzaList.php?catid=' . $id . '"><div style="color:#000;"><div style="color:#fff;">' .  $cat . '</div></div></a></h5>
                      <p class="card-text"><div style="color:#fff;">' . substr($desc, 0, 50). '....</div></p>
                      <a href="viewPizzaList.php?catid=' . $id . '" class="btn btn-primary" style="width: 120px;">View All</a>
                    </div>
                  </div>
                </div>';
        }
      ?>
    </div>
  </div>


    <?php require 'partials/_footer.php' ?>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>         
    <script src="https://unpkg.com/bootstrap-show-password@1.2.1/dist/bootstrap-show-password.min.js"></script>
</body>
</html>